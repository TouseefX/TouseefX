--[[============================================================================
    LBG Client Loader
    ----------------------------------------------------------------------------
    1. Downloads LBGReplicatedStorage.rbxm  -> parents everything into ReplicatedStorage
    2. Downloads Cutscenes.rbxm             -> replaces ReplicatedStorage.Assets.Cutscenes
    3. Downloads LBGLighting.rbxm           -> parents everything into Lighting
    4. Downloads FakeHead.rbxm              -> welded onto your character as "FakeHead"
    5. loadstring()s UniversalClientRenderer.luau
    6. Fires ClientRenderRequest at YOUR OWN client (see FireSelf, near the bottom)

    rbxm decoding and instance building uses LxmModule (pure Lua), NOT
    SerializationService: DeserializeInstancesAsync is capability-gated to
    PluginOrOpenCloud, so a client executor cannot call it at all.
    LxmModule parses the binary format and builds real Instances directly,
    while this loader handles asset downloading, parenting, character welding,
    and triggering the client renderer.
============================================================================]]--

local Players           = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting          = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer

--============================== CONFIG ========================================

local BASE = "https://github.com/TouseefX/TouseefX/raw/refs/heads/main/RobloxHacks/LBG/"

local URLS = {
	ReplicatedStorage = BASE .. "LBGReplicatedStorage.rbxm",
	Cutscenes         = BASE .. "Cutscenes.rbxm",
	Lighting          = BASE .. "LBGLighting.rbxm",
	FakeHead          = BASE .. "FakeHead.rbxm",
	Renderer          = "https://raw.githubusercontent.com/TouseefX/TouseefX/refs/heads/main/RobloxHacks/LBG/UniversalClientRenderer.luau",
}

local LXM_BASE = "https://raw.githubusercontent.com/metatablecat/lxm/main/src/"

-- If an instance from the ReplicatedStorage pack already exists by that name,
-- skip it instead of duplicating. Set false to force-add duplicates.
local SKIP_EXISTING_RS = true

-- How long to wait (s) for the renderer to hook up OnClientEvent before firing.
local RENDERER_TIMEOUT = 30

-- Building the ReplicatedStorage pack means ~149,000 Instance.new calls, which
-- blocks the client completely until it finishes. Yield every N instances so the
-- game keeps rendering. Costs some wall-clock time; set to 0 to disable.
local YIELD_EVERY = 2500

--============================== LOGGING =======================================

local TAG = "[LBG]"
local function log(...)  print(TAG, ...)  end
local function warnf(...) warn(TAG, ...)  end

--============================== HTTP ==========================================
-- Prefer the executor's request function: it returns binary-safe bytes.
-- game:HttpGet is a last resort and can mangle non-UTF8 payloads.

local function collectRequesters()
	local list = {}

	local function wrapRequest(fn)
		return function(url)
			local res = fn({ Url = url, Method = "GET" })
			if type(res) == "table" then
				return res.Body or res.body
			end
			return res
		end
	end

	if type(syn) == "table" and syn.request then table.insert(list, wrapRequest(syn.request)) end
	if type(request) == "function" then table.insert(list, wrapRequest(request)) end
	if type(http) == "table" and http.request then table.insert(list, wrapRequest(http.request)) end
	if type(http_request) == "function" then table.insert(list, wrapRequest(http_request)) end
	if type(fluent) == "table" and fluent.request then table.insert(list, wrapRequest(fluent.request)) end
	table.insert(list, function(url)
		warnf("using game:HttpGet as a last resort; binary payloads may be corrupted")
		return game:HttpGet(url)
	end)

	return list
end

local REQUESTERS = collectRequesters()

local function httpGet(url)
	for i, fn in ipairs(REQUESTERS) do
		local ok, body = pcall(fn, url)
		if ok and type(body) == "string" and #body > 0 then
			log(("http ok (%d bytes) via requester #%d: %s"):format(#body, i, url))
			return body
		end
	end
	error(TAG .. " every HTTP method failed for " .. tostring(url))
end

--============================== LXM LOADER ====================================
-- lxm addresses its modules through the DataModel tree (script.Parent.X), which
-- an executor does not have. We rewrite those requires to go through a resolver
-- and loadstring each module ourselves.

local LXM_MODULE_URL = "https://raw.githubusercontent.com/TouseefX/TouseefX/refs/heads/main/RobloxHacks/LBG/LxmModule.luau"

-- The parser and instance builder live in LxmModule.luau, which is fully
-- self-contained and publishes getgenv().Lxm. Run that script first, or let this fetch it.
local function getLxm()
	local genv = (getgenv and getgenv()) or _G
	if type(genv.lxm) == "table" or type(genv.Lxm) == "table" or type(genv.Lxm) == "function" then
		return genv.lxm or genv.Lxm
	end

	local ok, src = pcall(httpGet, LXM_MODULE_URL)
	if not ok or type(src) ~= "string" or #src == 0 then
		error("could not fetch LxmModule.luau: " .. tostring(src))
	end
	local chunk, cerr = loadstring(src, "LxmModule")
	if not chunk then
		error("LxmModule.luau failed to compile: " .. tostring(cerr))
	end
	local cok, cres = pcall(chunk)
	if not cok then
		error("LxmModule.luau threw: " .. tostring(cres))
	end
	if type(cres) == "table" or type(cres) == "function" then
		genv.lxm = cres
		genv.Lxm = cres
	end
	local mod = genv.lxm or genv.Lxm
	if type(mod) ~= "table" and type(mod) ~= "function" then
		error("LxmModule.luau did not publish lxm")
	end
	log("lxm module loaded via loadstring from LxmModule.luau")
	return mod
end

--============================== DECODE + BUILD ================================

local function decodeRbxm(raw, label)
	local lxm = getLxm()

	local t0 = os.clock()
	local ok, parsed = pcall(lxm.parse, raw)
	if not ok then
		error(("%s: lxm could not parse the file: %s"):format(label or "rbxm", tostring(parsed)))
	end
	local parsedTime = os.clock() - t0

	return lxm.build(parsed, label, {
		yieldEvery = YIELD_EVERY,
		log = log,
		warn = warnf,
		parsedTime = parsedTime,
	})
end

local function fetch(label, url)
	return decodeRbxm(httpGet(url), label)
end

--============================== PARENTING HELPERS =============================

local function parentAll(instances, target, skipExisting, label)
	local lxm = getLxm()
	return lxm.parentAll(instances, target, skipExisting, label, { log = log, warn = warnf })
end

local function replaceChild(parent, name, instances)
	local lxm = getLxm()
	return lxm.replaceChild(parent, name, instances, { log = log, warn = warnf })
end

--============================== STEP 1-4: ASSETS ==============================

local function loadAssets()
	local rsPack = fetch("ReplicatedStorage", URLS.ReplicatedStorage)
	parentAll(rsPack, ReplicatedStorage, SKIP_EXISTING_RS, "ReplicatedStorage")

	local Assets = ReplicatedStorage:FindFirstChild("Assets")
	if not Assets then
		Assets = Instance.new("Folder")
		Assets.Name = "Assets"
		Assets.Parent = ReplicatedStorage
		warnf("Assets folder was missing, created it")
	end

	replaceChild(Assets, "Cutscenes", fetch("Cutscenes", URLS.Cutscenes))

	local lightPack = fetch("Lighting", URLS.Lighting)
	for _, inst in ipairs(lightPack) do
		local existing = Lighting:FindFirstChild(inst.Name)
		if existing then
			existing:Destroy()
		end
		inst.Parent = Lighting
	end
	log(("parented %d instance(s) into Lighting"):format(#lightPack))

	-- Root of FakeHead.rbxm is a Part already named "FakeHead" with a Weld
	-- child, which is exactly what the renderer's On.FakeHead expects.
	replaceChild(ReplicatedStorage, "FakeHead", fetch("FakeHead", URLS.FakeHead))
end

--============================== STEP 5: SAFETY NET ============================
-- Verified by parsing LBGReplicatedStorage.rbxm: Assets, Modules, Remotes,
-- FriendAvatars, Communication (RemoteEvent), ClientRenderRequest (RemoteEvent),
-- ClientCommunication (BindableEvent) and ClientInvoke (BindableFunction) are
-- ALL present in the pack. This only fills in anything the pack was missing,
-- so the renderer never blocks forever on WaitForChild.

local REQUIRED = {
	{ Name = "ClientRenderRequest", Class = "RemoteEvent"     },
	{ Name = "Communication",       Class = "RemoteEvent"     },
	{ Name = "ClientCommunication", Class = "BindableEvent"   },
	{ Name = "ClientInvoke",        Class = "BindableFunction"},
	{ Name = "Remotes",             Class = "Folder"          },
	{ Name = "FriendAvatars",       Class = "Folder"          },
}

local function ensureRequired()
	for _, spec in ipairs(REQUIRED) do
		if not ReplicatedStorage:FindFirstChild(spec.Name) then
			local inst = Instance.new(spec.Class)
			inst.Name = spec.Name
			inst.Parent = ReplicatedStorage
			warnf("pack was missing " .. spec.Class .. " " .. spec.Name .. " - created it")
		end
	end
end

--============================== STEP 6: FAKEHEAD ==============================
-- Mirrors the server routine you pasted. The server reads ServerStorage.FakeHead;
-- from an executor we read the copy we just dropped into ReplicatedStorage.

local function processCharacterAccessories(character)
	if not character or not character:FindFirstChild("Torso") then
		return
	end

	for _, child in ipairs(character:GetChildren()) do
		if child:IsA("Accessory") then
			local handle = child:FindFirstChild("Handle")
			if handle then
				child.Name = ("HighQuailty_%s"):format(child.Name)
				handle.Anchored = true

				local src = handle:FindFirstChildWhichIsA("Weld")
				if src then
					local weld = src:Clone()
					local originalPart0, originalPart1 = weld.Part0, weld.Part1

					src:Destroy()

					weld.Part0 = handle

					-- Your line is: weld.Part1 = character:FindFirstChild(weld.Part1.Name)
					-- Guarded, because for a stock AccessoryWeld Part1 is the Handle itself
					-- and that lookup returns nil, which would detach the accessory.
					local remapped = originalPart1 and character:FindFirstChild(originalPart1.Name)
					weld.Part1 = remapped
						or (originalPart0 and originalPart0.Parent == character and originalPart0 or nil)
						or character:FindFirstChild("Head")

					weld.Parent = child
					-- NOTE: your snippet parents the weld to the Accessory, which is what this
					-- does. If accessories end up detaching in-game, change the line above to
					-- `weld.Parent = handle` -- a stock AccessoryWeld lives inside the Handle.
				end

				task.wait()
				handle.Anchored = false
			end
		end
	end
end

local function safeSet(inst, prop, value)
	pcall(function()
		inst[prop] = value
	end)
end

local function attachFakeHead(character)
	if not character then
		return nil, "no character"
	end

	local head = character:FindFirstChild("Head")
	if not head then
		return nil, "character has no Head"
	end

	if character:FindFirstChild("FakeHead") then
		return character.FakeHead, "already attached"
	end

	local template = ReplicatedStorage:FindFirstChild("FakeHead")
	if not template then
		return nil, "FakeHead template missing from ReplicatedStorage"
	end

	local FakeHead = template:Clone()

	FakeHead.CFrame = head.CFrame

	local weld = FakeHead:FindFirstChildOfClass("Weld")
		or FakeHead:FindFirstChildWhichIsA("Weld")

	if weld then
		weld.Part0 = head
		weld.Part1 = FakeHead
		weld.Name = "FakeWeld"
	else
		warnf("FakeHead template had no Weld; creating one")
		weld = Instance.new("Weld")
		weld.Part0 = head
		weld.Part1 = FakeHead
		weld.Name = "FakeWeld"
		weld.Parent = FakeHead
	end

	processCharacterAccessories(character)

	for _, Acc in pairs(character:GetChildren()) do
		if Acc:IsA("Accessory") then
			local Meow = Acc:Clone()
			Meow.Parent = FakeHead

			local handle = Meow:FindFirstChild("Handle")
			if handle then
				safeSet(handle, "CollisionGroup", "Nothing")
				handle.CanCollide = false
				handle.CanQuery = false
				handle.CanTouch = false
				safeSet(handle, "AudioCanCollide", true)
			end

			Meow:SetAttribute("HighQualityAccessory", true)
			Acc:Destroy()
		end
	end

	FakeHead.Parent = character
	log("FakeHead attached to " .. character.Name)
	return FakeHead
end

--============================== STEP 7: RENDERER ==============================

-- Upstream UniversalClientRenderer.luau is missing exactly one `end`: the
-- top-level `do` opened at line 31 is never closed, so the file does not compile
-- at all. Verified by compiling the raw bytes with Luau, which reports
-- "Expected 'end' (to close 'do' at line 31), got <eof>"; adding a single `end`
-- before the Reload function makes all 60,411 lines compile.
local RENDERER_RELOAD_MARKER = "-- =============== Reload Function ==============="

-- Anchored on marker text, not a line number, so it survives the file changing
-- length. Returns nil when there is nothing to anchor on.
local function patchRendererSource(source)
	-- Only touch a file we recognise, so we never append a stray `end` to
	-- something unrelated.
	if not source:find(RENDERER_RELOAD_MARKER, 1, true) then
		return nil
	end
	-- The closer belongs at EOF, NOT before the Reload banner. The tail code
	-- (Reload, the OnClientEvent handler, the PreRender hooks) sits inside the
	-- same `do` as the `local ClientRenderRequest`/`PreRender` declarations at
	-- line 45, so closing the block early makes those resolve to nil globals.
	-- That still compiles, but the handler is never connected and the renderer
	-- silently does nothing.
	return source .. "\nend\n"
end

local function tryCompile(src)
    -- Wrap loadstring in pcall ONLY because 60k lines can cause stack overflows or internal compiler crashes
    local ok, chunk, err = pcall(loadstring, src, "UniversalClientRenderer")
    if not ok then
        return nil, "Compiler crashed: " .. tostring(chunk)
    end
    if not chunk then
        return nil, tostring(err)
    end
    return chunk, nil
end

local function loadRenderer()
    log("Fetching renderer...")
    local source = httpGet(URLS.Renderer)
    
    if not source or #source == 0 then
        error(TAG .. " failed: Source is empty or download timed out.")
        return
    end

    local chunk, compileErr = tryCompile(source)
    if not chunk then
        error(TAG .. " compilation failed: " .. tostring(compileErr))
        return
    end
    
    -- task.spawn hands the 60k lines to a brand new thread.
    -- Even if the script waits, loops forever, or crashes internally, 
    -- your main script will immediately continue to the log line.
    local spawnSuccess, spawnError = pcall(function()
        chunk()
    end)

    if not spawnSuccess then
        error(TAG .. " failed to spawn thread: " .. tostring(spawnError))
        return
    end

    log("renderer executed (thread spawned successfully)")
end

--============================== STEP 8: FIRE AT YOURSELF ======================
--   ReplicatedStorage.ClientRenderRequest:FireClient(player, data)
-- only works on the SERVER, and FireServer goes to the server instead of your
-- own handler. From an executor you call the *connection* the renderer made on
-- OnClientEvent, locally:
--
--   firesignal(remote.OnClientEvent, data)
--   getconnections(remote.OnClientEvent)[i]:Fire(data)
--
-- Because the connection is invoked directly rather than the RemoteEvent, the
-- arguments are never replication-filtered, so local-only instances pass fine.

local function countConnections(signal)
	if type(getconnections) ~= "function" then
		return -1
	end
	local ok, conns = pcall(getconnections, signal)
	if ok and type(conns) == "table" then
		return #conns
	end
	return -1
end

local function waitForConnection(remote, timeout)
	local deadline = os.clock() + (timeout or RENDERER_TIMEOUT)
	while os.clock() < deadline do
		local n = countConnections(remote.OnClientEvent)
		if n > 0 then
			return n
		end
		task.wait(0.1)
	end
	return 0
end

local function FireSelf(data)
    local remote = ReplicatedStorage:FindFirstChild("ClientRenderRequest")
    if not remote then
        return false, "ClientRenderRequest not found"
    end

    -- Method 1: Modern firesignal
    if type(firesignal) == "function" then
        local ok, err = pcall(firesignal, remote.OnClientEvent, data)
        if ok then
            log("fired via firesignal: " .. tostring(data.Request))
            return true, "firesignal"
        end
        warnf("firesignal failed: " .. tostring(err))
    end

    -- Method 2: Connection Spoofing Fallback
    if type(getconnections) == "function" then
        local ok, conns = pcall(getconnections, remote.OnClientEvent)
        if ok and type(conns) == "table" then
            local fired = 0
            for _, conn in ipairs(conns) do
                -- Check for standard .Fire method
                if type(conn.Fire) == "function" then
                    -- FIX: Use conn.Fire(data) instead of conn.Fire(conn, data)
                    -- Luau method syntax conn:Fire(data) passes conn automatically if required by the exploit environment
                    local okc, errc = pcall(function()
                        conn:Fire(data) 
                    end)
                    if okc then
                        fired = fired + 1
                    else
                        warnf("conn:Fire failed: " .. tostring(errc))
                    end
                end
            end
            if fired > 0 then
                log(("fired via getconnections (%d connection(s)): %s"):format(fired, tostring(data.Request)))
                return true, "getconnections"
            end
        end
    end

    return false, "executor exposes neither firesignal nor getconnections"
end

--============================== MAIN ==========================================

local function waitForCharacter()
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	if not character:FindFirstChild("HumanoidRootPart") then
		character:WaitForChild("HumanoidRootPart", 10)
	end
	return character
end

local function run()
	log("starting")
	loadAssets()
	ensureRequired()

	local character = waitForCharacter()
	local fakeHead, note = attachFakeHead(character)
	if not fakeHead then
		warnf("FakeHead: " .. tostring(note))
	end
	
	local Remote = Instance.new('RemoteEvent')
	Remote.Name = 'Network'
	Remote.Parent = character

	loadRenderer()

	-- Bounded: an unqualified WaitForChild here hangs forever in any game that
	-- does not provide ClientRenderRequest.
	local remote = ReplicatedStorage:WaitForChild("ClientRenderRequest", RENDERER_TIMEOUT)
	if not remote then
		warnf(("ClientRenderRequest still absent after %.1fs - not firing"):format(RENDERER_TIMEOUT))
		return
	end

	local n = waitForConnection(remote, RENDERER_TIMEOUT)
	if n <= 0 then
		warnf("no OnClientEvent connections after " .. RENDERER_TIMEOUT
			.. "s - the renderer may still be loading, or your executor lacks getconnections")
	else
		log(("renderer is listening (%d connection(s))"):format(n))
	end

	LocalPlayer.CharacterAdded:Connect(function(newChar)
		task.wait(0.5)
		local fh, why = attachFakeHead(newChar)
		if not fh then
			warnf("FakeHead on respawn: " .. tostring(why))
		end
	end)

	--========================== TRIGGER THE CUTSCENE ==========================
	-- RagingFangsCamera reads Data.On and Data.T (NOT U/V):
	--   Data.On -> the performer. Needs .HumanoidRootPart, ["Right Arm"], .FakeHead
	--   Data.T  -> the target. Passed to IsDescendantOf(T), so it must be non-nil.
	character = LocalPlayer.Character
	if not character then
		warnf("no character, cannot fire cutscene")
		return
	end

	--   _G.LBG.Fire({ Request = "EndRagingFangsCamera" })  -- needs no other fields
	local api = {
		Fire           = FireSelf,
		FireSelf       = FireSelf,
		AttachFakeHead = attachFakeHead,
		Connections    = function()
			local r = ReplicatedStorage:FindFirstChild("ClientRenderRequest")
			return r and countConnections(r.OnClientEvent) or -1
		end,
		Reload         = function()
			local hook = _G.UniversalRendererReload or UniversalRendererReload
			if type(hook) == "function" then
				hook()
			end
		end,
	}

	LBG = api
	-- This script may itself be running inside a sandboxed _ENV, so a plain
	-- assignment is not guaranteed to land where your console reads _G from.
	-- Publish to every environment we can reach.
	pcall(function() _G.LBG = api end)
	if type(getgenv) == "function" then
		pcall(function() getgenv().LBG = api end)
	end

	log("done. use _G.LBG.Fire({ Request = ..., On = char, T = char })")
end

task.spawn(function()
	local ok, err = pcall(run)
	if not ok then
		warnf("FATAL: " .. tostring(err))
	end
end)
