--[[
════════════════════════════════════════════════════════════════════════
 AnimationBaker  (ModuleScript → put in ServerStorage)
════════════════════════════════════════════════════════════════════════
 Bakes a Roblox animation (its KeyframeSequence) into a Folder full of
 CFrameValues at a fixed FPS — R6 joints only (Torso, Head, Arms, Legs)
 plus optional keyframed extras (weapon/prop on its own Motor6D).

 Pose.CFrame IS the joint transform animations use (Motor6D.Transform /
 the offset for a Weld) — no Part.CFrame is ever stored.

 Output (example: 2.5 s animation at FPS = 360):

     Walk (Folder)
     ├── FPS       NumberValue = 360
     ├── Frames    IntValue    = math.floor(Duration * FPS)  → 900
     ├── Duration  NumberValue = 2.5
     ├── Torso      (Folder) → 0 : CFrameValue, 1 : CFrameValue, … 900
     ├── Head       (Folder) → "        "        "
     ├── … one folder per limb, a folder per ExtraPart
     └── Markers    (Folder — only if the animation has KeyframeMarkers)
           └── Footstep (Folder) → 12 : StringValue="left", 38 : StringValue="right"
               (name = nearest baked frame: math.floor(markerTime * FPS + 0.5))

 Play markers with:  track:GetMarkerReachedSignal("Footstep"):Connect(fn)

 Frame math (the CFrameAnimator player uses the SAME formula):
     totalFrames  = math.floor(duration * FPS)
     currentFrame = math.floor(elapsed  * FPS)   -- clamped to totalFrames
     frameTime    = frameIndex / FPS

────────────────────────────────────────────────────────────────────────
 USE IT — command bar (Edit mode), one line:

     require(game.ServerStorage.AnimationBaker).Bake({
         AnimationId = "rbxassetid://12345",
         FPS = 360,
     })

 …or with a KeyframeSequence you already extracted
 (e.g. with the "Animation To Keyframes" plugin):

     require(game.ServerStorage.AnimationBaker).Bake({
         KeyframeSequence = game.ServerStorage.WalkAnim,  -- Instance or "game.ServerStorage.WalkAnim"
         AnimationName = "Walk",
         FPS = 60,
     })

────────────────────────────────────────────────────────────────────────
 OPTIONS (ONE of AnimationId / KeyframeSequence is required):
     AnimationId        string          "rbxassetid://…" — must be owned by
                                        you/your group/Roblox (otherwise use
                                        the plugin route below)
     KeyframeSequence   Instance|string extracted KeyframeSequence (wins over
                                        AnimationId)
     AnimationName      string?         folder name (nil = sequence name)
     OutputParent       Instance        default ServerStorage
     Overwrite          bool            default true — only ever replaces a
                                        previous bake FOLDER, never your
                                        source KeyframeSequence
     FPS                number          default 60 — 30/60/120/360…
     OnlyLimbs          table?          bake only these, e.g. {"Torso","Right Arm"}
     ExtraParts         table           extra keyframed parts with their own
                                        Motor6D, e.g. {"Dragger","Handle"}

 Returns: the baked Folder.
════════════════════════════════════════════════════════════════════════
]]

local KeyframeSequenceProvider = game:GetService("KeyframeSequenceProvider")
local TweenService             = game:GetService("TweenService")

-- The only body parts an R6 rig animates through joints.
-- (The "Torso" pose drives HumanoidRootPart.RootJoint; the other 5 drive the
--  Motor6Ds inside the Torso. HumanoidRootPart itself has no joint in R6,
--  so its poses are ignored — same as Roblox's own Animator.)
local CORE_LIMBS = { "Torso", "Head", "Left Arm", "Right Arm", "Left Leg", "Right Leg" }

local AnimationBaker = {}

-------------------------------------------------------------------- helpers

local function findByPath(path)
	local node = game
	for seg in string.gmatch(path, "[^%.]+") do
		if seg ~= "game" and seg ~= "Game" then
			node = node and node:FindFirstChild(seg)
			if not node then return nil end
		end
	end
	return node
end

local function resolveKeyframeSequence(cfg)
	local input = cfg.KeyframeSequence
	if typeof(input) == "Instance" then
		assert(input:IsA("KeyframeSequence"), "KeyframeSequence option is not a KeyframeSequence instance")
		return input
	elseif type(input) == "string" then
		local inst = findByPath(input)
		assert(inst, "Could not find anything at path: " .. input)
		assert(inst:IsA("KeyframeSequence"), "The instance at path is not a KeyframeSequence: " .. input)
		return inst
	end

	assert(type(cfg.AnimationId) == "string" and string.find(cfg.AnimationId, "%d+"),
		"Pass AnimationId (rbxassetid://…) or KeyframeSequence to .Bake()")

	local ok, result = pcall(function()
		return KeyframeSequenceProvider:GetKeyframeSequenceAsync(cfg.AnimationId)
	end)
	assert(ok, "GetKeyframeSequenceAsync failed: " .. tostring(result)
		.. "\nIf this animation isn't owned by you/group, extract it with the "
		.. "'Animation To Keyframes' plugin and pass it as KeyframeSequence instead.")
	return result
end

-- Pose.EasingStyle / Pose.EasingDirection are the *PoseEasing* enums, but
-- TweenService:GetValue requires the regular *Easing* enums — passing the
-- pose ones errors with "Unable to cast PoseEasingStyle to EasingStyle".
-- Their member names line up 1:1 (Cubic, Constant, Linear, In, Out, InOut…),
-- so we convert by name (with a safe fallback for unknown future members).
local function toTweenEasing(style, dir)
	if typeof(style) == "EnumItem" then
		local ok, v = pcall(function() return Enum.EasingStyle[style.Name] end)
		style = (ok and v) or Enum.EasingStyle.Linear
	end
	if typeof(dir) == "EnumItem" then
		local ok, v = pcall(function() return Enum.EasingDirection[dir.Name] end)
		dir = (ok and v) or Enum.EasingDirection.InOut
	end
	return style, dir
end

-- Gather, for every tracked part, the sorted list of keyframe "points" that
-- contain a pose for it: { t = seconds, cf = joint CFrame, style, dir }.
local function collectTracks(seq, tracked)
	local keyframes = seq:GetKeyframes()
	table.sort(keyframes, function(a, b) return a.Time < b.Time end)

	local duration = (#keyframes > 0) and keyframes[#keyframes].Time or 0
	local tracks, seen = {}, {}

	for _, kf in ipairs(keyframes) do
		for _, d in ipairs(kf:GetDescendants()) do
			if d:IsA("Pose") and tracked[d.Name] then
				local dupKey = d.Name .. "@" .. tostring(kf.Time)
				if not seen[dupKey] then
					seen[dupKey] = true
					local cf = d.CFrame
					if d.Weight < 1 then
						cf = CFrame.new():Lerp(cf, d.Weight) -- fold pose weight in
					end
					local style, dir = toTweenEasing(d.EasingStyle, d.EasingDirection)
					local track = tracks[d.Name]
					if not track then
						track = {}
						tracks[d.Name] = track
					end
					table.insert(track, {
						t     = kf.Time,
						cf    = cf,
						style = style,
						dir   = dir,
					})
				end
			end
		end
	end

	for _, track in pairs(tracks) do
		table.sort(track, function(a, b) return a.t < b.t end)
	end
	return tracks, duration, keyframes
end

-- Gather every KeyframeMarker: name -> array of { frame, value }.
-- frame = the baked frame nearest the marker's keyframe time.
local function collectMarkers(keyframes, fps)
	local markers = {}
	local order   = {} -- marker names in first-seen order
	local count   = 0
	for _, kf in ipairs(keyframes) do
		for _, m in ipairs(kf:GetChildren()) do
			if m:IsA("KeyframeMarker") then
				if not markers[m.Name] then
					markers[m.Name] = {}
					table.insert(order, m.Name)
				end
				table.insert(markers[m.Name], {
					frame = math.floor(kf.Time * fps + 0.5),
					value = m.Value,
				})
				count = count + 1
			end
		end
	end
	return markers, order, count
end

-- Interpolated joint CFrame of one limb at time t.
-- Uses the EASING OF THE KEYFRAME YOU ARE MOVING TOWARDS — the same rule
-- Roblox's own Animator uses. (styles/dirs were converted to the Tween
-- enums by toTweenEasing at collect time, so GetValue accepts them.)
local function sampleTrack(track, t)
	local n = #track
	if n == 0 then return nil end
	if t <= track[1].t then return track[1].cf end -- hold first
	if t >= track[n].t then return track[n].cf end -- hold last

	-- binary search: last point with point.t <= t
	local lo, hi = 1, n
	while lo < hi do
		local mid = math.floor((lo + hi + 1) / 2)
		if track[mid].t <= t then lo = mid else hi = mid - 1 end
	end
	local a, b = track[lo], track[lo + 1]
	if not b or (b.t - a.t) < 1e-7 then return a.cf end

	local alpha = (t - a.t) / (b.t - a.t)
	local eased = TweenService:GetValue(alpha, b.style, b.dir) -- easing baked in
	return a.cf:Lerp(b.cf, eased)
end

---------------------------------------------------------------------- Bake

function AnimationBaker.Bake(options)
	assert(type(options) == "table",
		"AnimationBaker.Bake expects an options table, e.g. .Bake({ AnimationId = 'rbxassetid://123', FPS = 60 })")

	------------------------------------------------ config + defaults
	local cfg = {
		AnimationId      = options.AnimationId,
		KeyframeSequence = options.KeyframeSequence,
		AnimationName    = options.AnimationName,
		OutputParent     = options.OutputParent or game:GetService("ServerStorage"),
		Overwrite        = options.Overwrite ~= false, -- default true
		FPS              = options.FPS or 60,
		OnlyLimbs        = options.OnlyLimbs,
		ExtraParts       = options.ExtraParts or {},
	}
	assert(type(cfg.FPS) == "number" and cfg.FPS >= 1, "FPS must be a number >= 1")
	cfg.FPS = math.floor(cfg.FPS)
	assert(typeof(cfg.OutputParent) == "Instance", "OutputParent must be an Instance")
	assert(type(cfg.ExtraParts) == "table", "ExtraParts must be an array of part names")

	-- tracked pose names: the 6 R6 limbs + extra keyframed parts
	local tracked = {}
	local limbs   = {}
	local function addLimb(name)
		if not tracked[name] then
			tracked[name] = true
			table.insert(limbs, name)
		end
	end
	for _, n in ipairs(CORE_LIMBS)      do addLimb(n) end
	for _, n in ipairs(cfg.ExtraParts)  do addLimb(n) end

	-- which parts actually get output folders
	local outputLimbs = limbs
	if type(cfg.OnlyLimbs) == "table" then
		local keep = {}
		for _, n in ipairs(cfg.OnlyLimbs) do keep[n] = true end
		outputLimbs = {}
		for _, n in ipairs(limbs) do
			if keep[n] then table.insert(outputLimbs, n) end
		end
	end

	------------------------------------------------ read the sequence
	local seq                        = resolveKeyframeSequence(cfg)
	local tracks, duration, keyframes = collectTracks(seq, tracked)
	local fps                        = cfg.FPS
	-- THE frame math: math.max(0, math.floor(duration * fps))
	-- (+1e-4 guard: real durations can float-arrive as 122.99999999999999 —
	--  e.g. 123/30 s @ 30 fps — where a raw floor DROPS the last frame.
	--  The epsilon only ever duplicates the final frame; it never adds time.)
	local totalFrames                = math.max(0, math.floor(duration * fps + 1e-4))
	-- markers are global (not per-limb) — OnlyLimbs never filters them
	local markers, markerOrder, markerCount = collectMarkers(keyframes, fps)

	local foundAny = false
	for _, limb in ipairs(outputLimbs) do
		if tracks[limb] and #tracks[limb] > 0 then foundAny = true break end
	end
	assert(foundAny,
		"No tracked limb poses found. Is this an R6 animation? "
		.. "(R15 part names are skipped on purpose.)")

	local animName = cfg.AnimationName or seq.Name

	-- refuse to clobber an old BAKE unless Overwrite = true
	-- (only replaces Folders — a same-named KeyframeSequence source is left alone)
	local old = cfg.OutputParent:FindFirstChild(animName)
	if old and old:IsA("Folder") then
		assert(cfg.Overwrite, "A folder named '" .. animName
			.. "' already exists in the output parent. Pass Overwrite = true to replace it.")
		old:Destroy()
	end

	------------------------------------------------ build the folder tree
	local root = Instance.new("Folder")
	root.Name = animName

	local fpsValue = Instance.new("NumberValue")
	fpsValue.Name = "FPS" fpsValue.Value = fps fpsValue.Parent = root

	local framesValue = Instance.new("IntValue")
	framesValue.Name = "Frames" framesValue.Value = totalFrames framesValue.Parent = root

	local durationValue = Instance.new("NumberValue")
	durationValue.Name = "Duration" durationValue.Value = duration durationValue.Parent = root

	local created = 0
	for _, limb in ipairs(outputLimbs) do
		local limbFolder = Instance.new("Folder")
		limbFolder.Name = limb
		limbFolder.Parent = root

		local track = tracks[limb]
		if track then
			-- frame times: frameTime = frame / fps   (frames 0 .. totalFrames)
			for frame = 0, totalFrames do
				local cf = sampleTrack(track, math.min(frame / fps, duration))
				local v = Instance.new("CFrameValue")
				v.Name = tostring(frame)
				v.Value = cf
				v.Parent = limbFolder
				created = created + 1
			end
		end
	end

	------------------------------------------------ bake the markers
	if markerCount > 0 then
		local markersFolder = Instance.new("Folder")
		markersFolder.Name = "Markers"
		markersFolder.Parent = root
		for _, name in ipairs(markerOrder) do
			local nameFolder = Instance.new("Folder")
			nameFolder.Name = name
			nameFolder.Parent = markersFolder
			for _, entry in ipairs(markers[name]) do
				-- named by frame; suffix on a rare same-name/same-frame collision
				local childName = tostring(entry.frame)
				local suffix = 2
				while nameFolder:FindFirstChild(childName) do
					childName = tostring(entry.frame) .. "_" .. suffix
					suffix = suffix + 1
				end
				local v = Instance.new("StringValue")
				v.Name = childName
				v.Value = entry.value
				v.Parent = nameFolder
			end
		end
	end

	root.Parent = cfg.OutputParent

	local markerInfo = (markerCount > 0) and string.format(" + %d marker(s)", markerCount) or ""
	print(string.format(
		"[AnimationBaker] '%s' baked: %d frames @ %d FPS (%.3fs)%s → %s  [%d CFrameValues across %d folders]",
		animName, totalFrames + 1, fps, duration, markerInfo, root:GetFullName(), created, #outputLimbs))

	return root
end

return AnimationBaker
