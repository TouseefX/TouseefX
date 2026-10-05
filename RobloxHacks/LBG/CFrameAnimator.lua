--[[
════════════════════════════════════════════════════════════════════════
 CFrameAnimator  (ModuleScript → put in ReplicatedStorage)
════════════════════════════════════════════════════════════════════════
 Plays the CFrame folders made by the "AnimationBaker" module on R6 rigs
 ONLY, by driving the JOINTS (never Part.CFrame):

     Motor6D →  motor.Transform = bakedCFrame
     Weld    →  weld.C0 = baseC0 * bakedCFrame   (same visual result)

 Frame math per tick — identical to the baker's:
     elapsed += deltaTime * Speed
     frame    = math.floor(elapsed * FPS)   -- clamped to Frames
     joint.Transform = data[limb][frame]

 USAGE
     local CFrameAnimator = require(game.ReplicatedStorage.CFrameAnimator)

     local animator = CFrameAnimator.new(character)               -- one per rig
     local track    = animator:LoadAnimation(ServerStorage.Walk)  -- baked folder

     track.Looped = true
     track.Speed  = 1
     track:Play()
     -- track:Stop()
     -- track.Stopped:Connect(function() print("done") end)
     -- animator:StopAll()

 MARKERS (baked into the folder as Markers/<Name>/<frame> StringValues):
     track:GetMarkerReachedSignal("Footstep"):Connect(function(value)
         print("marker!", value) -- value = the marker's .Value string
     end)
     Fires when playback CROSSES the marker's frame — same moments a real
     AnimationTrack fires (forward play, loop wraps, natural end).

 NOTES
 • Works from server Scripts (Heartbeat) and client LocalScripts
   (RenderStepped — smoothest for the local player).
 • Play ONE track per rig at a time: a baked track owns all 6 joints.
 • If the rig's default Animator also plays animations, they'll fight over
   the joints — stop those tracks (or remove the Animator object) first.
 • Extra keyframed parts (dragger/props): if the baked folder has a folder
   for them, their joint is found automatically — ANY Motor6D or Weld in
   the rig whose Part1 is that part (no config needed).
 • High render rates are cheap: several RenderStepped ticks inside one
   baked frame apply the pose ONCE (dedupe by frame index), and markers
   fire once per crossing — no "same frame 6 times" bugs.
════════════════════════════════════════════════════════════════════════
]]

local RunService = game:GetService("RunService")

local LIMBS = { "Torso", "Head", "Left Arm", "Right Arm", "Left Leg", "Right Leg" }

-- standard R6 joint locations ("Torso" pose = the root motor!)
local JOINT_INFO = {
	["Torso"]     = { holder = "HumanoidRootPart", name = "RootJoint" },
	["Head"]      = { holder = "Torso", name = "Neck" },
	["Right Arm"] = { holder = "Torso", name = "Right Shoulder" },
	["Left Arm"]  = { holder = "Torso", name = "Left Shoulder" },
	["Right Leg"] = { holder = "Torso", name = "Right Hip" },
	["Left Leg"]  = { holder = "Torso", name = "Left Hip" },
}

local function findJoint(rig, limb)
	local info   = JOINT_INFO[limb]
	local holder = info and rig:FindFirstChild(info.holder)
	local j      = holder and holder:FindFirstChild(info.name)
	if j and (j:IsA("Motor6D") or j:IsA("Weld")) then
		return j
	end
	-- fallback: any Motor6D/Weld in the rig that drives this limb
	for _, d in ipairs(rig:GetDescendants()) do
		if (d:IsA("Motor6D") or d:IsA("Weld")) and d.Part1 and d.Part1.Name == limb then
			return d
		end
	end
	return nil
end

--══════════════════════════════════════ Animator (one per rig) ══════════

local Animator = {}
Animator.__index = Animator

function Animator.new(rig)
	assert(typeof(rig) == "Instance" and rig:IsA("Model"), "CFrameAnimator.new expects a rig Model")

	local humanoid = rig:FindFirstChildOfClass("Humanoid")
	if humanoid and humanoid.RigType == Enum.HumanoidRigType.R15 then
		warn("CFrameAnimator: this rig is R15 — the baker/player are R6-only")
	end

	local self = setmetatable({}, Animator)
	self.Rig     = rig
	self._joints = {} -- [limb] = Motor6D | Weld
	self._baseC0 = {} -- [limb] = CFrame  (rest C0, for Welds)
	self._tracks = {}

	local found = 0
	for _, limb in ipairs(LIMBS) do
		local j = findJoint(rig, limb)
		if j then
			self._joints[limb] = j
			if j:IsA("Weld") then
				self._baseC0[limb] = j.C0
			end
			found = found + 1
		end
	end
	if found == 0 then
		error("CFrameAnimator: no R6 joints found. Is '" .. rig:GetFullName() .. "' an R6 rig?")
	end
	return self
end

--══════════════════════════════════════ Track (one per folder) ══════════

local Track = {}
Track.__index = Track

function Animator:LoadAnimation(folder)
	assert(typeof(folder) == "Instance" and folder:IsA("Folder"), "LoadAnimation expects a baked animation Folder")

	local fpsV      = folder:FindFirstChild("FPS")
	local framesV   = folder:FindFirstChild("Frames")
	local durationV = folder:FindFirstChild("Duration")
	assert(fpsV and framesV and durationV,
		"'" .. folder:GetFullName() .. "' is missing FPS/Frames/Duration values — is it a baked animation folder?")

	-- cache every CFrameValue into plain arrays ONCE, so playback is a pure
	-- array lookup (no FindFirstChild per frame). ANY sub-folder counts as
	-- an animated part: the 6 R6 limbs + extra keyframed props (Dragger…)
	local data = {}
	for _, limbFolder in ipairs(folder:GetChildren()) do
		if limbFolder:IsA("Folder") then
			local arr = {}
			for _, child in ipairs(limbFolder:GetChildren()) do
				if child:IsA("CFrameValue") then
					local i = tonumber(child.Name)
					if i then arr[i] = child.Value end
				end
			end
			if next(arr) then data[limbFolder.Name] = arr end
		end
	end
	assert(next(data), "'" .. folder:GetFullName() .. "' contains no CFrameValues")

	-- make sure a joint exists for every animated part — the 6 standard R6
	-- joints were found in new(); extras resolve here (JOINT_INFO, then
	-- fallback: any Motor6D/Weld whose Part1 is that part)
	for limb in pairs(data) do
		if not self._joints[limb] then
			local j = findJoint(self.Rig, limb)
			if j then
				self._joints[limb] = j
				if j:IsA("Weld") then self._baseC0[limb] = j.C0 end
			else
				warn("CFrameAnimator: no Motor6D/Weld drives '" .. limb .. "' in rig '" .. self.Rig:GetFullName() .. "' — that part can't be animated")
			end
		end
	end

	-- markers: name -> sorted array of { frame, value }
	local markers = {}
	local markersFolder = folder:FindFirstChild("Markers")
	if markersFolder then
		for _, nameFolder in ipairs(markersFolder:GetChildren()) do
			if nameFolder:IsA("Folder") then
				local arr = {}
				for _, v in ipairs(nameFolder:GetChildren()) do
					if v:IsA("StringValue") then
						local i = tonumber(string.match(v.Name, "^(%d+)"))
						if i then table.insert(arr, { frame = i, value = v.Value }) end
					end
				end
				table.sort(arr, function(a, b) return a.frame < b.frame end)
				if #arr > 0 then markers[nameFolder.Name] = arr end
			end
		end
	end

	local track = setmetatable({}, Track)
	track.Name          = folder.Name
	track.Looped        = false
	track.Speed         = 1     -- time multiplier (0.5 = half speed)
	track.HoldLastFrame = false -- keep the last pose applied when it ends
	track.IsPlaying     = false
	track.TimePosition  = 0

	track._fps      = fpsV.Value
	track._frames   = framesV.Value -- totalFrames = math.floor(duration * fps)
	track._duration = durationV.Value
	track._data     = data
	track._joints   = self._joints
	track._baseC0   = self._baseC0
	track._conn     = nil

	track._markers       = markers
	track._markerSignals = {} -- [name] = BindableEvent (created on demand)
	track._lastFrame     = -1
	track._lastAppliedFrame = -1

	track._stoppedBindable = Instance.new("BindableEvent")
	track.Stopped = track._stoppedBindable.Event

	table.insert(self._tracks, track)
	return track
end

function Animator:StopAll()
	for _, track in ipairs(self._tracks) do
		if track.IsPlaying then track:Stop() end
	end
end

-- apply one baked frame to the joints (Motor6D.Transform / Weld.C0)
function Track:_apply(frameIndex)
	for limb, arr in pairs(self._data) do
		local cf    = arr[frameIndex]
		local joint = self._joints[limb]
		if cf and joint then
			if joint:IsA("Motor6D") then
				joint.Transform = cf
			else
				joint.C0 = self._baseC0[limb] * cf
			end
		end
	end
end

-- back to rest pose
function Track:_reset()
	for limb, joint in pairs(self._joints) do
		if joint:IsA("Motor6D") then
			joint.Transform = CFrame.new()
		else
			joint.C0 = self._baseC0[limb]
		end
	end
end

function Track:_step(dt)
	local duration = self._duration
	local fps      = self._fps
	local maxFrame = self._frames

	self.TimePosition = self.TimePosition + dt * self.Speed

	local ended, wrapped = false, false
	if duration > 0 and self.TimePosition >= duration then
		if self.Looped then
			self.TimePosition = self.TimePosition % duration
			wrapped = true
		else
			self.TimePosition = duration
			ended = true
		end
	end

	-- THE frame math: math.max(0, math.floor(elapsed * fps)), clamped to [0, maxFrame]
	local frame = math.max(0, math.min(math.floor(self.TimePosition * fps), maxFrame))

	-- fire every marker whose frame we crossed since the last step
	-- (markers already dedupe repeats naturally: only frames > _lastFrame fire)
	local oldFrame = self._lastFrame
	if wrapped then
		self:_fireMarkers(oldFrame, math.huge) -- rest of the old loop
		if oldFrame >= 0 then
			-- (oldFrame == -1 means the first call already covered frame 0 —
			--  firing again here would double-fire loop-start markers)
			self:_fireMarkers(-1, frame) -- start of the new loop
		end
	elseif frame > oldFrame then
		self:_fireMarkers(oldFrame, frame)
	end
	self._lastFrame = frame

	-- THE "same frame 6 times" FIX: RenderStepped can tick several times
	-- inside one baked frame — never re-apply a pose we are already showing
	if frame == self._lastAppliedFrame and not wrapped and not ended then
		return
	end

	self:_apply(frame)
	self._lastAppliedFrame = frame

	if ended then self:Stop() end
end

-- fire every marker in (fromExclusive, toInclusive] that has subscribers
function Track:_fireMarkers(fromExclusive, toInclusive)
	if not next(self._markerSignals) then return end
	local lo = math.max(0, fromExclusive + 1)
	local hi = (toInclusive == math.huge) and self._frames or math.min(toInclusive, self._frames)
	if lo > hi then return end
	for name, sig in pairs(self._markerSignals) do
		local arr = self._markers[name]
		if arr then
			for _, entry in ipairs(arr) do
				if entry.frame >= lo and entry.frame <= hi then
					sig:Fire(entry.value)
				end
			end
		end
	end
end

-- same API as AnimationTrack:GetMarkerReachedSignal(name) —
-- fires with the marker's .Value string
function Track:GetMarkerReachedSignal(name)
	local sig = self._markerSignals[name]
	if not sig then
		sig = Instance.new("BindableEvent")
		self._markerSignals[name] = sig
	end
	return sig.Event
end

function Track:Play()
	if self.IsPlaying then return end

	-- zero-length animation: just show frame 0 once, then finish
	if self._duration <= 0 then
		self:_apply(0)
		self._stoppedBindable:Fire()
		return
	end

	self.IsPlaying    = true
	self.TimePosition = 0
	self._lastFrame   = -1 -- frame-0 markers fire on the first step, like a real track
	self:_apply(0) -- snap to frame 0 immediately
	self._lastAppliedFrame = 0 -- ...but don't apply it a 2nd time on the first tick

	-- RenderStepped on the client (smooth), Heartbeat on the server
	local stepEvent = RunService:IsClient() and RunService.RenderStepped or RunService.Heartbeat
	self._conn = stepEvent:Connect(function(dt)
		self:_step(dt)
	end)
end

function Track:Stop()
	if not self.IsPlaying then return end
	self.IsPlaying = false
	if self._conn then
		self._conn:Disconnect()
		self._conn = nil
	end
	if not self.HoldLastFrame then
		self:_reset() -- release the joints, like a normal AnimationTrack does
	end
	self._stoppedBindable:Fire()
end

function Track:Destroy()
	self:Stop()
	self._stoppedBindable:Destroy()
	for _, sig in pairs(self._markerSignals) do
		sig:Destroy()
	end
end

return Animator
