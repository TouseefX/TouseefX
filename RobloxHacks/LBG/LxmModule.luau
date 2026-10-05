-- Standalone patched lxm: a complete rbxm/rbxl parser and instance builder in
-- one file, with every module inlined. No network access, no dependencies.
--
--   loadstring(game:HttpGet("https://raw.githubusercontent.com/TouseefX/TouseefX/refs/heads/main/RobloxHacks/LBG/LxmModule.luau"))()
--   local lxm = getgenv().lxm
--
--   -- 1. Parse decodes the rbxm into virtual data:
--   local parsed = lxm.parse(rbxmBytes)
--
--   -- 2. Build turns the parsed data into real Roblox Instances:
--   --    (automatically compiles scripts and installs require shims)
--   local instances = lxm.build(parsed)
--
--   -- 3. Builder fixes and parenting utilities:
--   lxm.repairReferences(instances)
--   lxm.auditScripts(instances)
--   lxm.installRequireShim(sources)
--   lxm.parentAll(instances, target, skipExisting)
--   lxm.replaceChild(parent, name, instances)
--
-- Upstream is metatablecat/lxm. These are the fixes it never got:
--   Buffer        reads numbers straight out of the source (no substrings)
--   lz4           O(n) buffer sink instead of `Source ..= data` per token
--   Chunks/INST   instance referents preserved so nodes carry a usable Ref
--   Chunks/PROP   Content (typeID 0x22) decoder, sequential SharedString reads,
--                 and enum planes de-interleaved MSB-first
--   Builder       turns lxm's virtual tree into real Roblox Instances with
--                 correct properties, enums, mesh parts, and scripts.
--   Builder Fixes automatic require shim on compile, joint/beam reference
--                 repair, script bytecode audit, and hierarchy parenting.
--
-- Publishes:  getgenv().lxm / getgenv().Lxm  ->  lxm module table

local MODULES = {
	["Chunks/PROP"] = [=[
local Types = require(script.Parent.Parent.Types)
local BasicTypes = require(script.Parent.Parent.BasicTypes)

local FACES_BIT_FLAG = {
	Enum.NormalId.Right,
	Enum.NormalId.Top,
	Enum.NormalId.Back,
	Enum.NormalId.Left,
	Enum.NormalId.Bottom,
	Enum.NormalId.Front
}
local AXES_BIT_FLAG = {
	Enum.Axis.X,
	Enum.Axis.Y,
	Enum.Axis.Z
}

local function GetEnumValFromNumber(enum: Enum, num: number): EnumItem
	local enums = enum:GetEnumItems()

	for _, v in enums do
		if v.Value == num then
			return v
		end
	end

	return enums[1]
end

local function parseBitFlag<T>(byte: number, bitFlag: {T}): T
	local output = {}
	for i = 0, 7 do
		if bit32.extract(byte, i) ~= 0 then
			table.insert(output, bitFlag[i+1])
		end
	end

	return unpack(output)
end

local function PROP(chunk: Types.Chunk, rbxm: Types.Rbxm)
	local reader = chunk.Data
	local classID = reader:readNumber("<I4")
	local classref = rbxm.ClassRefs[classID]
	local refs = classref.Refs
	local sizeof = classref.Sizeof

	local name = BasicTypes.String(reader)
	local optTypeIdCheck = string.byte(reader:read(1, false)) == 0x1E
	if optTypeIdCheck then
		-- although its only be spotted for CFrame, i do believe 0x1E will be used for
		-- other optional types in the future, this future proofs that case
		reader:seek(1)
	end

	local typeID = string.byte(reader:read())

	local properties = {}

	if typeID == 0x01 then
		-- String, Bytecode
		for i = 1, sizeof do
			properties[i] = BasicTypes.String(reader)
		end

	elseif typeID == 0x02 then
		-- Boolean
		for i = 1, sizeof do
			properties[i] = reader:read() ~= "\0"
		end

	elseif typeID == 0x03 then
		-- Int32
		properties = BasicTypes.Int32Array(reader, sizeof)

	elseif typeID == 0x04 then
		-- RbxFloat32
		properties = BasicTypes.RbxF32Array(reader, sizeof)

	elseif typeID == 0x05 then
		-- Float64
		for i = 1, sizeof do
			properties[i] = BasicTypes.Float64(reader)
		end

	elseif typeID == 0x06 then
		-- UDim
		local scale = BasicTypes.RbxF32Array(reader, sizeof)
		local offset = BasicTypes.Int32Array(reader, sizeof)

		for i = 1, sizeof do
			properties[i] = UDim.new(scale[i], offset[i])
		end

	elseif typeID == 0x07 then
		-- UDim2
		local scaleX, scaleY = BasicTypes.RbxF32Array(reader, sizeof), BasicTypes.RbxF32Array(reader, sizeof)
		local offsetX, offsetY = BasicTypes.Int32Array(reader, sizeof), BasicTypes.Int32Array(reader, sizeof)

		for i = 1, sizeof do
			properties[i] = UDim2.new(scaleX[i], offsetX[i], scaleY[i], offsetY[i])
		end

	elseif typeID == 0x08 then
		-- Ray
		for i = 1, sizeof do
			properties[i] = Ray.new(
				Vector3.new(
					reader:readNumber("<f"),
					reader:readNumber("<f"),
					reader:readNumber("<f")
				),
				Vector3.new(
					reader:readNumber("<f"),
					reader:readNumber("<f"),
					reader:readNumber("<f")
				)
			)
		end

	elseif typeID == 0x09 then
		-- Faces
		for i = 1, sizeof do
			local byte = string.byte(reader:read())
			properties[i] = Faces.new(parseBitFlag(byte, FACES_BIT_FLAG))
		end

	elseif typeID == 0x0A then
		-- Axes
		for i = 1, sizeof do
			local byte = string.byte(reader:read())
			properties[i] = Axes.new(parseBitFlag(byte, AXES_BIT_FLAG))
		end

	elseif typeID == 0x0B then
		-- BrickColor
		local ints = BasicTypes.unsignedIntArray(reader, sizeof)
		for i = 1, sizeof do
			properties[i] = BrickColor.new(ints[i])
		end

	elseif typeID == 0x0C then
		-- Color3
		local r = BasicTypes.RbxF32Array(reader, sizeof)
		local g = BasicTypes.RbxF32Array(reader, sizeof)
		local b = BasicTypes.RbxF32Array(reader, sizeof)

		for i = 1, sizeof do
			properties[i] = Color3.new(r[i], g[i], b[i])
		end

	elseif typeID == 0x0D then
		-- Vector2
		local x = BasicTypes.RbxF32Array(reader, sizeof)
		local y = BasicTypes.RbxF32Array(reader, sizeof)

		for i = 1, sizeof do
			properties[i] = Vector2.new(x[i], y[i])
		end

	elseif typeID == 0x0E then
		-- Vector3
		local x = BasicTypes.RbxF32Array(reader, sizeof)
		local y = BasicTypes.RbxF32Array(reader, sizeof)
		local z = BasicTypes.RbxF32Array(reader, sizeof)

		for i = 1, sizeof do
			properties[i] = Vector3.new(x[i], y[i], z[i])
		end

	-- elseif typeID == 0x0F then
		-- Vector2int16?

	elseif typeID == 0x10 then
		--CFrame
		local matricies = table.create(sizeof)

		for i = 1, sizeof do
			local rawOrientation = string.byte(reader:read())
			if rawOrientation > 0 then
				local orientID = rawOrientation - 1
				local R0 = Vector3.fromNormalId(orientID / 6)
				local R1 = Vector3.fromNormalId(orientID % 6)
				local R2 =	R0:Cross(R1)

				matricies[i] = {R0, R1, R2}
			else
				local r00, r01, r02 = 
					reader:readNumber("<f"),
					reader:readNumber("<f"),
					reader:readNumber("<f")
				local r10, r11, r12 = 
					reader:readNumber("<f"),
					reader:readNumber("<f"),
					reader:readNumber("<f")
				local r20, r21, r22 = 
					reader:readNumber("<f"),
					reader:readNumber("<f"),
					reader:readNumber("<f")

				matricies[i] = {
					Vector3.new(r00, r10, r20),
					Vector3.new(r01, r11, r21),
					Vector3.new(r02, r12, r22)
				}
			end
		end

		-- map interleaved position
		local cfX = BasicTypes.RbxF32Array(reader, sizeof)
		local cfY = BasicTypes.RbxF32Array(reader, sizeof)
		local cfZ = BasicTypes.RbxF32Array(reader, sizeof)

		for i = 1, sizeof do
			local thisMatrix = matricies[i]
			local pos = Vector3.new(cfX[i], cfY[i], cfZ[i])
			properties[i] = CFrame.fromMatrix(pos, thisMatrix[1], thisMatrix[2], thisMatrix[3])
		end

	elseif typeID == 0x11 then
		-- Quaternion (i can be a little quicker here by handling it differently)
		local quaternions = {}
		for i = 1, sizeof do
			quaternions[i] = {
				x = reader:readNumber("<f"),
				y = reader:readNumber("<f"),
				z = reader:readNumber("<f"),
				w = reader:readNumber("<f")
			}
		end

		local cfX = BasicTypes.RbxF32Array(reader, sizeof)
		local cfY = BasicTypes.RbxF32Array(reader, sizeof)
		local cfZ = BasicTypes.RbxF32Array(reader, sizeof)

		for i = 1, sizeof do
			local q = quaternions[i]
			properties[i] = CFrame.new(cfX[i], cfY[i], cfZ[i], q.x, q.y, q.z, q.w)
		end

	elseif typeID == 0x12 then
		-- Enum. rbx_binary reads these with read_interleaved_u32_array: one byte
		-- plane per significance, most-significant plane first. Reading them flat
		-- through unsignedIntArray reinterprets the first plane as the low byte,
		-- so 1 becomes 16777216 and every enum write is rejected. Verified against
		-- the observed corruption signature (EmissionDirection 16777216).
		local planes = reader:read(4 * sizeof)
		properties = table.create(sizeof)
		for i = 1, sizeof do
			properties[i] = string.byte(planes, i) * 16777216
				+ string.byte(planes, sizeof + i) * 65536
				+ string.byte(planes, 2 * sizeof + i) * 256
				+ string.byte(planes, 3 * sizeof + i)
		end

	elseif typeID == 0x13 then
		-- Ref
		properties = BasicTypes.RefArray(reader, sizeof)

	elseif typeID == 0x14 then
		-- Vector3int16
		for i = 1, sizeof do
			properties[i] = Vector3int16.new(
				reader:readNumber("<i2"),
				reader:readNumber("<i2"),
				reader:readNumber("<i2")
			)
		end

	elseif typeID == 0x15 then
		-- NumberSequence
		for i = 1, sizeof do
			local kpCount = reader:readNumber("<I4")
			local kp = table.create(kpCount)

			for i = 1, kpCount do
				table.insert(kp, NumberSequenceKeypoint.new(
					reader:readNumber("<f"),
					reader:readNumber("<f"),
					reader:readNumber("<f")
				))
			end

			properties[i] = NumberSequence.new(kp)
		end

	elseif typeID == 0x16 then
		-- ColorSequence
		for i = 1, sizeof do
			local kpCount = reader:readNumber("<I4")
			local kp = table.create(kpCount)

			for i = 1, kpCount do
				table.insert(kp, ColorSequenceKeypoint.new(
					reader:readNumber("<f"),
					Color3.new(
						reader:readNumber("<f"),
						reader:readNumber("<f"),
						reader:readNumber("<f")
					)
				))

				reader:readNumber("<f")
			end

			properties[i] = ColorSequence.new(kp)
		end

	elseif typeID == 0x17 then
		-- NumberRange
		for i = 1, sizeof do
			properties[i] = NumberRange.new(
				reader:readNumber("<f"),
				reader:readNumber("<f")
			)
		end

	elseif typeID == 0x18 then
		-- Rect
		local xmn, ymn = BasicTypes.RbxF32Array(reader, sizeof), BasicTypes.RbxF32Array(reader, sizeof)
		local xmx, ymx = BasicTypes.RbxF32Array(reader, sizeof), BasicTypes.RbxF32Array(reader, sizeof)

		for i = 1, sizeof do
			properties[i] = Rect.new(
				Vector2.new(
					xmn[i], ymn[i]
				),
				Vector2.new(
					xmx[i], ymx[i]
				)
			)
		end

	elseif typeID == 0x19 then
		-- PhysicalProperties
		for i = 1, sizeof do
			if reader:read() == "\0" then continue end

			properties[i] = PhysicalProperties.new(
				reader:readNumber("<f"),
				reader:readNumber("<f"),
				reader:readNumber("<f"),
				reader:readNumber("<f"),
				reader:readNumber("<f")
			)
		end

	elseif typeID == 0x1A then
		-- Color3int8
		local r = string.split(reader:read(sizeof), "")
		local g = string.split(reader:read(sizeof), "")
		local b = string.split(reader:read(sizeof), "")

		for i = 1, sizeof do
			properties[i] = Color3.fromRGB(
				string.byte(r[i]),
				string.byte(g[i]),
				string.byte(b[i])
			)
		end

	elseif typeID == 0x1B then
		-- Int64
		properties = BasicTypes.Int64Array(reader, sizeof)

	elseif typeID == 0x1C then
		-- SharedString
		-- SharedString refs are a plain u32 array, NOT interleaved. Running them
		-- through unsignedIntArray byte-rotates every index (1 becomes 1<<24), so
		-- every mesh/physics blob resolves to nil and MeshParts lose their mesh.
		for i = 1, sizeof do
			local ref = reader:readNumber("<I4") + 1
			properties[i] = rbxm.Strings[ref]
		end

	elseif typeID == 0x1D then
		-- Bytecode
		for i = 1, sizeof do
			properties[i] = buffer.fromstring(BasicTypes.String(reader))
		end

	elseif typeID == 0x20 then
		-- Font
		for i = 1, sizeof do
			local family = BasicTypes.String(reader)
			local weight = GetEnumValFromNumber(Enum.FontWeight, reader:readNumber("<I2"))
			local style = GetEnumValFromNumber(Enum.FontStyle, string.byte(reader:read()))
			
			BasicTypes.String(reader) --CachedFaceId

			properties[i] = Font.new(family, weight, style)
		end

	elseif typeID == 0x22 then
		-- Content (MeshContent, TextureContent, ...). Layout confirmed against the
		-- raw bytes of LBGReplicatedStorage.rbxm:
		--   4 interleaved byte-planes of `sizeof` bytes -> u32 type tag per element
		--     (0x02 = URL)
		--   u32 string count, then count x [u32 length][bytes]
		-- Reading one tag byte per element yields null for every mesh and
		-- silently skips ~530 KB of asset URLs.
		local planes = reader:read(4 * sizeof)
		local urls = {}
		local strCount = reader:readNumber("<I4")
		for i = 1, strCount do
			urls[i] = BasicTypes.String(reader)
		end
		for i = 1, sizeof do
			if string.byte(planes, 3 * sizeof + i) == 2 then
				properties[i] = urls[i]
			else
				properties[i] = nil
			end
		end
	end

	-- perform optional prop handle
	if optTypeIdCheck then
		reader:read()

		for i = 1, sizeof do
			local archivable = reader:read() ~= "\0"
			if not archivable then
				-- null the key (hopefully if OptCFrame returns, it allows null as a prop)
				properties[i] = nil
			end
		end
	end

	-- map to referents
	for i, v in refs do
		local inst = rbxm.InstanceRefs[v]
		inst.Properties[name] = properties[i]
	end
end

return PROP

]=],
	Buffer = [=[
--[[
	Optimized drop-in replacement for lxm's Buffer.

	Same public API as the original, two changes that matter for multi-megabyte
	models:

	  1. Methods live on a shared metatable instead of being re-created as five
	     closures for every stream. lxm builds one stream per chunk, and
	     LBGReplicatedStorage.rbxm alone has 1268 chunks.

	  2. readNumber/readByte read straight out of Source with a position argument
	     instead of carving off a substring first. Property parsing is the hot
	     loop (~149k instances in that file); this removes several million
	     temporary strings.
]]

local sub = string.sub
local byte = string.byte
local unpack = string.unpack
local packsize = string.packsize

local BufferLib = {}
BufferLib.__index = BufferLib

function BufferLib.read(self, len, shift)
	len = len or 1
	local off = self.Offset
	local dat = sub(self.Source, off + 1, off + len)
	local unread = len - #dat

	if unread > 0 and not self.AllowOverflows then
		error("Buffer went out of bounds and AllowOverflows is false")
	end

	if shift == nil or shift then
		self:seek(len)
	end

	self.LastUnreadBytes = unread
	return dat
end

function BufferLib.seek(self, len)
	local n = self.Offset + (len or 1)
	local limit = self.Length

	if n < 0 then
		n = 0
	elseif n > limit then
		n = limit
	end

	self.Offset = n
	self.IsFinished = n >= limit
end

function BufferLib.append(self, newData)
	self.Source ..= newData
	self.Length = #self.Source
	self:seek(0)
end

function BufferLib.toEnd(self)
	self.Offset = self.Length
	self.IsFinished = true
end

-- The original did read(packsize) then string.unpack on the copy. Reading with
-- an explicit position skips the copy entirely.
function BufferLib.readNumber(self, fmt, shift)
	fmt = fmt or "I1"
	local off = self.Offset
	local value, nextPos = unpack(fmt, self.Source, off + 1)
	local consumed = (nextPos - 1) - off

	if shift == nil or shift then
		self:seek(consumed)
	end

	self.LastUnreadBytes = 0
	return value
end

function BufferLib.readByte(self, shift)
	local b = byte(self.Source, self.Offset + 1)

	if shift == nil or shift then
		self:seek(1)
	end

	return b
end

local function Buffer(str, allowOverflows)
	return setmetatable({
		Offset = 0,
		Source = str,
		Length = #str,
		IsFinished = #str == 0,
		LastUnreadBytes = 0,
		AllowOverflows = if allowOverflows ~= nil then allowOverflows else true,
	}, BufferLib)
end

return Buffer
]=],

	lz4 = [=[
--[[
	Optimized LZ4 block decompressor for lxm.

	The original accumulated output with `Source ..= newData` on every token.
	That is O(n^2) in the decompressed size, and these models are large:
	  Cutscenes.rbxm              1.70 MB ->  9.07 MB
	  LBGReplicatedStorage.rbxm   2.88 MB -> 23.45 MB  (1267 compressed chunks)
	Some individual chunks expand 200:1, so a single chunk could mean hundreds
	of thousands of full-string copies.

	This writes into a Luau `buffer` instead: one allocation, memmove-speed
	literal and match copies, O(n) overall. When the buffer library is missing
	(executor without it) it falls back to the original append-based loop so it
	stays correct, just slow.
]]

local band = bit32.band
local rshift = bit32.rshift
local sbyte = string.byte
local ssub = string.sub
local sunpack = string.unpack

local HAS_BUFFER = type(buffer) == "table"
	and type(buffer.create) == "function"
	and type(buffer.copy) == "function"
	and type(buffer.tostring) == "function"

-- LZ4 matches may overlap their own source (offset < matchLength). Copying in
-- steps no longer than the offset keeps every individual copy non-overlapping.
local function copyMatch(out, dst, src, len, offset)
	local remaining = len
	while remaining > 0 do
		local n = if remaining < offset then remaining else offset
		buffer.copy(out, dst, out, src, n)
		dst += n
		src += n
		remaining -= n
	end
	return dst
end

local function readVarLen(data, pos, initial)
	local total = initial
	local nb
	repeat
		nb = sbyte(data, pos)
		pos += 1
		total += nb
	until nb ~= 0xFF
	return total, pos
end

local function lz4Buffer(lz4data: string, compressedLen: number, decompressedLen: number): string
	local out = buffer.create(decompressedLen)
	-- Some Luau builds (including the standalone CLI) only accept a buffer as
	-- the source of buffer.copy, so stage the input once. This is a single
	-- O(n) copy per chunk, versus the O(n^2) it replaces.
	local inBuf = buffer.fromstring(lz4data)
	local pos = 13 -- 12-byte chunk header
	local outLen = 0

	while outLen < decompressedLen do
		local token = sbyte(lz4data, pos)
		pos += 1

		local litLen = rshift(token, 4)
		local matLen = band(token, 15) + 4

		if litLen >= 15 then
			litLen, pos = readVarLen(lz4data, pos, litLen)
		end

		if litLen > 0 then
			if outLen + litLen > decompressedLen then
				error("lz4: literal run overruns the declared output size")
			end
			-- buffer offsets are 0-based, Lua string positions are 1-based
			buffer.copy(out, outLen, inBuf, pos - 1, litLen)
			outLen += litLen
			pos += litLen
		end

		-- The final sequence in a block is literals only; a match follows only
		-- if there is still room left in the output.
		if outLen < decompressedLen then
			local offset = sunpack("<I2", lz4data, pos)
			pos += 2

			if offset == 0 then
				error("lz4: zero match offset")
			end

			if matLen >= 19 then
				matLen, pos = readVarLen(lz4data, pos, matLen)
			end

			if outLen + matLen > decompressedLen then
				error("lz4: match overruns the declared output size")
			end

			outLen = copyMatch(out, outLen, outLen - offset, matLen, offset)
		end
	end

	return buffer.tostring(out)
end

-- Original append-based path, kept for environments with no buffer library.
local function lz4Append(lz4data: string, decompressedLen: number): string
	local Buffer = require(script.Parent.Buffer)
	local inputStream = Buffer(lz4data)
	local outputStream = Buffer("")

	inputStream:seek(12)

	repeat
		local token = string.byte(inputStream:read())
		local litLen = bit32.rshift(token, 4)
		local matLen = bit32.band(token, 15) + 4

		if litLen >= 15 then
			repeat
				local nextByte = string.byte(inputStream:read())
				litLen += nextByte
			until nextByte ~= 0xFF
		end

		outputStream:append(inputStream:read(litLen))
		outputStream:toEnd()

		if outputStream.Length < decompressedLen then
			local offset = string.unpack("<I2", inputStream:read(2))
			if matLen >= 19 then
				repeat
					local nextByte = string.byte(inputStream:read())
					matLen += nextByte
				until nextByte ~= 0xFF
			end

			outputStream:seek(-offset)
			local mark = outputStream.Offset
			local match = outputStream:read(matLen)
			local unreadBytes = outputStream.LastUnreadBytes
			if unreadBytes then
				repeat
					outputStream.Offset = mark
					local extra = outputStream:read(unreadBytes)
					unreadBytes = outputStream.LastUnreadBytes
					match ..= extra
				until unreadBytes <= 0
			end

			outputStream:append(match)
			outputStream:toEnd()
		end
	until outputStream.Length >= decompressedLen

	return outputStream.Source
end

local function lz4(lz4data: string): string
	local compressedLen, decompressedLen, reserved = sunpack("<I4<I4<I4", lz4data, 1)

	if reserved ~= 0 then
		error("provided chunk is not lz4 data")
	end

	if compressedLen == 0 then
		return ssub(lz4data, 13, 12 + decompressedLen)
	end

	if decompressedLen == 0 then
		return ""
	end

	if HAS_BUFFER then
		return lz4Buffer(lz4data, compressedLen, decompressedLen)
	end

	return lz4Append(lz4data, decompressedLen)
end

return lz4
]=],

	["Chunks/INST"] = [[
local Types = require(script.Parent.Parent.Types)
local BasicTypes = require(script.Parent.Parent.BasicTypes)

local function VirtualInstance(classID: number, className: string, ref: number): Types.VirtualInstance
	return {
		ClassId = classID,
		ClassName = className,
		Ref = ref,

		Properties = {},
		Children = {}
	}
end

local function INST(chunk: Types.Chunk, rbxm: Types.Rbxm)
	local buffer = chunk.Data
	-- creates virtual instances for each given instance
	-- this will reject service instances (errors)
	local ClassID = buffer:readNumber("<I4")
	local ClassName = BasicTypes.String(buffer)

	-- Upstream lxm hard-errors here. LBGReplicatedStorage.rbxm contains at least
	-- one service instance, so record the flag and let the caller decide what to
	-- do (you cannot Instance.new() a service) instead of losing the whole file.
	local isService = buffer:read() == "\1"

	local count = buffer:readNumber("<I4")
	local refs = BasicTypes.RefArray(buffer, count)

	-- map virtual instances and refs to RBXM
	rbxm.ClassRefs[ClassID] = {
		Name = ClassName,
		Sizeof = count,
		Refs = refs,
		IsService = isService,
	}

	for _, ref in refs do
		local vi = VirtualInstance(ClassID, ClassName, ref)
		vi.IsService = isService
		rbxm.InstanceRefs[ref] = vi
	end
end

return INST
]],

	["init"] = [=[--[[
	Reading process:

	Parse header
	Decompress chunks
	Parse META and SSTR chunks
	Parse INST chunks
	Parse PROP chunks
	Parse PRNT chunk

	We parse this way to prevent eroneous chunk placement, whenever possible, break the script if something
	doesn't read correctly
]]

local HEADER = "<roblox!"
local RBXM_SIGNATURE = "\x89\xff\x0d\x0a\x1a\x0a"
local ZSTD_HEADER = "\x28\xB5\x2F\xFD"

local Buffer = require(script.Buffer)
local Types = require(script.Types)
local lz4 = require(script.lz4)
local zstd = require(script.zstd)
local Chunks = script.Chunks

local VALID_CHUNK_IDENTIFIERS = {
	["END\0"] = true,
	["INST"] = true,
	["META"] = true,
	["PRNT"] = true,
	["PROP"] = true,
	["SIGN"] = true,
	["SSTR"] = true
}
local CHUNK_MODULES = {
	INST = require(Chunks.INST),
	META = require(Chunks.META),
	PRNT = require(Chunks.PRNT),
	PROP = require(Chunks.PROP),
	SSTR = require(Chunks.SSTR)

	--END\0 and SIGN are not processed because they're irrelevant
}

local function Chunk(buffer: Types.Buffer, chunkIndex: number): Types.Chunk
	local chunk = {}
	chunk.InternalID = chunkIndex
	chunk.Header = buffer:read(4)

	if not VALID_CHUNK_IDENTIFIERS[chunk.Header] then
		print(string.byte(chunk.Header, 1, 4))
		error(`Invalid chunk identifier {chunk.Header} on chunk id {chunkIndex}`)
	end

	-- validate LZ4 header, though we can provide the buffer in directly, just used for checking for zstd
	local data

	local lz4Header = buffer:read(16, false)
	local compressed = string.unpack("<I4", string.sub(lz4Header, 1, 4))
	local decompressed = string.unpack("<I4", string.sub(lz4Header, 5, 8))
	local reserved = string.sub(lz4Header, 9, 12)
	local zstd_check = string.sub(lz4Header, 13, 16)

	if reserved ~= "\0\0\0\0" then
		error(`Invalid chunk header on chunk id {chunkIndex} of identifier {chunk.Header}`)
	end

	if compressed == 0 then
		data = buffer:read(decompressed + 12)
	else
		if zstd_check == ZSTD_HEADER then
			buffer:seek(12)
			data = zstd(buffer:read(compressed))
		else
			data = lz4(buffer:read(compressed + 12))
		end
	end

	chunk.Data = Buffer(data, false)

	function chunk:Error(msg)
		error(`[{self.Header}:{self.InternalID}]: {msg}`)
	end
	
	return chunk
end

local function procChunkType(chunkStore: {[string]: {Types.Chunk}}, id: string, rbxm: Types.Rbxm)
	local chunks = chunkStore[id]
	local f = CHUNK_MODULES[id]

	if chunks and f then
		for _, chunk in chunks do
			f(chunk, rbxm)
		end
	end
end

local function rbxm(buffer: string): Types.Rbxm
	local rbxmBuffer = Buffer(buffer, false)

	-- read signature data
	if
		rbxmBuffer:read(8) ~= HEADER
		or rbxmBuffer:read(6) ~= RBXM_SIGNATURE
	then
		error("Provided file does not match the header of an RBXM file.")
	end

	if rbxmBuffer:read(2) ~= "\0\0" then
		error("Invalid RBXM version, if Roblox has released a newer version (unlikely), please let me know.")
	end

	local rbxm = {}
	local classCount = rbxmBuffer:readNumber("<i4")
	local instCount = rbxmBuffer:readNumber("<i4")

	local classRefIds = table.create(classCount)
	local instRefIds = table.create(instCount)
	rbxm.ClassRefs = classRefIds
	rbxm.InstanceRefs = instRefIds
	rbxm.Tree = {}
	rbxm.Metadata = {}
	rbxm.Strings = {}

	local chunkInfo = {}
	for k in VALID_CHUNK_IDENTIFIERS do
		chunkInfo[k] = {}
	end

	if rbxmBuffer:read(8) ~= "\0\0\0\0\0\0\0\0" then
		error("Provided file does not match the header of an RBXM file.")
	end

	local index = 0
	repeat
		index+=1
		local last_chunk = Chunk(rbxmBuffer, index)
		local header = last_chunk.Header
		local chunkInfoSection = chunkInfo[header]
		table.insert(chunkInfoSection, last_chunk)
	until last_chunk.Header == "END\0"

	procChunkType(chunkInfo, "META", rbxm)
	procChunkType(chunkInfo, "SSTR", rbxm)
	procChunkType(chunkInfo, "INST", rbxm)
	procChunkType(chunkInfo, "PROP", rbxm)
	procChunkType(chunkInfo, "PRNT", rbxm)

	return rbxm
end

return rbxm]=],
	["Types"] = [[export type Buffer = {
	Offset: number,
	Source: string,
	Length: number,
	IsFinished: boolean,
	LastUnreadBytes: number,
	AllowOverflows: boolean,

	read: (Buffer, len: number?, shiftOffset: boolean?) -> string,
	readNumber: (Buffer, packfmt: string?, shift: boolean?) -> number,
	seek: (Buffer, len: number) -> (),
	append: (Buffer, newData: string) -> (),
	toEnd: (Buffer) -> (),
	readByte: (Buffer, shift: boolean?) -> number
}

export type Chunk = {
	InternalID: number,
	Header: "END\0"|"INST"|"META"|"PRNT"|"PROP"|"SIGN"|"SSTR",
	Data: Buffer,
	Error: (Chunk, string) -> ()
}

export type VirtualInstance = {
	ClassId: number,
	ClassName: string,
	Properties: {[string]: any},
	Ref: number,
	Children: {VirtualInstance}
}

export type Rbxm = {
	ClassRefs: {
		{
			Name: string,
			Sizeof: number,
			Refs: {number}
		}
	},
	InstanceRefs: {VirtualInstance},
	Tree: {VirtualInstance},
	Metadata: {[string]: string},
	Strings: {string}
}

return nil]],
	["zstd"] = [[-- This is such a hack lmao

-- {"m":null,"t":"buffer","zbase64":""}

local HttpService = game:GetService("HttpService")
local b64 = require(script.Parent.b64)

return function(stream: string): string
	local zbase64 = b64.encode(stream)
	local x = HttpService:JSONDecode(`\{"m": null, "t":"buffer", "zbase64":"{zbase64}"\}`)
	return buffer.tostring(x)
end]],
	["b64"] = [[local SEQ = {
	[0] = "A", "B", "C", "D", "E", "F", "G", "H",
	"I", "J", "K", "L", "M", "N", "O", "P",
	"Q", "R", "S", "T", "U", "V", "W", "X",
	"Y", "Z", "a", "b", "c", "d", "e", "f",
	"g", "h", "i", "j", "k", "l", "m", "n",
	"o", "p", "q", "r", "s", "t", "u", "v",
	"w", "x", "y", "z", "0", "1", "2", "3",
	"4", "5", "6", "7", "8", "9", "+", "/",
}

local STRING_FAST = {}
local INDEX = {[61] = 0, [65] = 0}

for key, val in ipairs(SEQ) do
	-- memoization
	INDEX[string.byte(val)] = key
end

-- string.char has a MASSIVE overhead, its faster to precompute
-- the values for performance
for i = 0, 255 do
	local c = string.char(i)
	STRING_FAST[i] = c
end

local b64 = {}

function b64.encode(str)
	local len = string.len(str)
	local output = table.create(math.ceil(len/4)*4)
	local index = 1

	for i = 1, len, 3 do
		local b0, b1, b2 = string.byte(str, i, i + 2)
		local b = bit32.lshift(b0, 16) + bit32.lshift(b1 or 0, 8) + (b2 or 0)

		output[index] = SEQ[bit32.extract(b, 18, 6)]
		output[index + 1] = SEQ[bit32.extract(b, 12, 6)]
		output[index + 2] = b1 and SEQ[bit32.extract(b, 6, 6)] or "="
		output[index + 3] = b2 and SEQ[bit32.band(b, 63)] or "="

		index += 4
	end

	return table.concat(output)
end

function b64.decode(hash)
	-- given a 24 bit word (4 6-bit letters), decode 3 bytes from it
	local len = string.len(hash)
	local output = table.create(len * 0.75)
	
	local index = 1
	for i = 1, len, 4 do
		local c0, c1, c2, c3 = string.byte(hash, i, i + 3)

		local b = 
			bit32.lshift(INDEX[c0], 18)
			+ bit32.lshift(INDEX[c1], 12)
			+ bit32.lshift(INDEX[c2], 6)
			+ (INDEX[c3])
		

		output[index] = STRING_FAST[bit32.extract(b, 16, 8)]
		output[index + 1] = c2 ~= "=" and STRING_FAST[bit32.extract(b, 8, 8)] or "="
		output[index + 2] = c3 ~= "=" and STRING_FAST[bit32.band(b, 0xFF)] or "="
		index += 3
	end

	return table.concat(output)
end

return b64]],
	["BasicTypes"] = [[-- Used for deserialising interleaving, strings, numbers and refs
-- Refs are held here since multiple chunks rely on it

local Types = require(script.Parent.Types)
local Buffer = require(script.Parent.Buffer)
local basicTypes = {}

local function transformInt(x: number): number
	-- cant use the bit method because bit32 (yay)
	return if x % 2 == 0
		then x / 2
		else -(x + 1) / 2
end

local function rbxF32(x: number): number
	x = bit32.rrotate(x, 1)
	return string.unpack(">f", string.pack(">I4", x))
end

function basicTypes.String(buffer: Types.Buffer): string
	return buffer:read(buffer:readNumber("<I4"))
end

function basicTypes.Int32(buffer: Types.Buffer): number
	return transformInt(buffer:readNumber(">I4"))
end

function basicTypes.Int64(buffer: Types.Buffer): number
	return transformInt(buffer:readNumber(">I8"))
end

function basicTypes.Float32(buffer: Types.Buffer): number
	return rbxF32(buffer:readNumber(">I4"))
end

function basicTypes.Float64(buffer: Types.Buffer): number --just use <d lol (here for completeness)
	return buffer:readNumber("<d")
end

-- my favourite function :D
function basicTypes.InterleaveArrayWithSize(buffer: Types.Buffer, count: number, sizeof: number): Types.Buffer
	if count < 0 then return Buffer("", false) end
	
	local stream = buffer:read(count * sizeof)
	local out = table.create(count)
	for i = 1, count do
		local chunk = table.create(sizeof)
		for s = 0, sizeof-1 do
			local bitPos = i + (count * s)
			chunk[s+1] = string.sub(stream, bitPos, bitPos)
		end
		out[i] = table.concat(chunk)
	end

	return Buffer(table.concat(out), false)
end

function basicTypes.unsignedIntArray(buffer: Types.Buffer, count: number): {number}
	if count < 1 then return {} end

	local o = table.create(count)
	local strings = basicTypes.InterleaveArrayWithSize(buffer, count, 4)
	for i = 1, count do
		o[i] = strings:readNumber("<I4")
	end

	return o
end

function basicTypes.Int32Array(buffer: Types.Buffer, count: number): {number}
	if count < 1 then return {} end

	local o = table.create(count)
	local strings = basicTypes.InterleaveArrayWithSize(buffer, count, 4)
	for i = 1, count do
		o[i] = basicTypes.Int32(strings)
	end

	return o
end

function basicTypes.Int64Array(buffer: Types.Buffer, count: number): {number}
	if count < 1 then return {} end

	local o = table.create(count)
	local strings = basicTypes.InterleaveArrayWithSize(buffer, count, 8)
	for i = 1, count do
		o[i] = basicTypes.Int64(strings)
	end

	return o
end

function basicTypes.RbxF32Array(buffer: Types.Buffer, count: number): {number}
	if count < 1 then return {} end

	local o = table.create(count)
	local strings = basicTypes.InterleaveArrayWithSize(buffer, count, 4)

	for i = 1, count do
		o[i] = basicTypes.Float32(strings)
	end

	return o
end

function basicTypes.RefArray(buffer: Types.Buffer, count: number): {number}
	if count < 1 then return {} end

	local o = table.create(count)
	local refs = basicTypes.Int32Array(buffer, count)

	local last = 0
	for i = 1, count do
		local ref = last + refs[i]
		o[i] = ref
		last = ref
	end

	return o
end

return basicTypes]],
	["Chunks/META"] = [[local Types = require(script.Parent.Parent.Types)
local BasicTypes = require(script.Parent.Parent.BasicTypes)

local function META(chunk: Types.Chunk, rbxm: Types.Rbxm)
	local buffer = chunk.Data
	for i = 1, buffer:readNumber("<I4") do
		local k = BasicTypes.String(buffer)
		local v = BasicTypes.String(buffer)

		rbxm.Metadata[k] = v
	end
end

return META]],
	["Chunks/PRNT"] = [[local Types = require(script.Parent.Parent.Types)
local BasicTypes = require(script.Parent.Parent.BasicTypes)

local function PRNT(chunk: Types.Chunk, rbxm: Types.Rbxm)
	local buffer = chunk.Data
	--Builds the instance tree from the given PRNT structure

	local ver = buffer:read()
	if ver ~= "\0" then
		chunk:Error("Invalid PRNT version")
	end

	local count = buffer:readNumber("<I4")
	local child_refs = BasicTypes.RefArray(buffer, count)
	local parent_refs = BasicTypes.RefArray(buffer, count)

	for i = 1, count do
		local childID = child_refs[i]
		local parentID = parent_refs[i]

		local child = rbxm.InstanceRefs[childID]
		local parent = if parentID >= 0 then rbxm.InstanceRefs[parentID] else nil

		if not child then
			chunk:Error(`Could not parent {childID} to {parentID} because child {childID} was nil`)
		end

		if parentID >= 0 and not parent then
			chunk:Error(`Could not parent {childID} to {parentID} because parent {parentID} was nil`)
		end

		local parentTable = if parent then parent.Children else rbxm.Tree
		table.insert(parentTable, child)
	end
end

return PRNT]],
	["Chunks/SSTR"] = [[local Types = require(script.Parent.Parent.Types)
local BasicTypes = require(script.Parent.Parent.BasicTypes)

local function SSTR(chunk: Types.Chunk, rbxm: Types.Rbxm)
	local buffer = chunk.Data
	
	local ver = buffer:readNumber("<I4")
	if ver ~= 0 then
		chunk:Error("Invalid SSTR version")
	end

	for i = 1, buffer:readNumber("<I4") do
		buffer:read(16) --md5 hash (useless)
		rbxm.Strings[i] = BasicTypes.String(buffer)
	end
end

return SSTR]],
}


--============================ build the parser ================================
-- Modules are wrapped in a factory taking the resolver as a parameter. Executors
-- hand loadstring'd chunks their own _ENV, so a global set here would not be
-- visible inside them; an upvalue travels correctly in any environment.

local function buildParser()
	local cache, done, loading = {}, {}, {}

	local function resolve(name)
		if done[name] then return cache[name] end
		if loading[name] then error("lxm circular require: " .. name) end
		loading[name] = true

		local src = MODULES[name]
		if not src then
			error("lxm module missing: " .. name)
		end

		src = src:gsub("require%s*%(%s*script%.Parent%.Parent%.([%w_]+)%s*%)", '__LXM_REQUIRE("%1")')
		src = src:gsub("require%s*%(%s*script%.Parent%.([%w_]+)%s*%)", '__LXM_REQUIRE("%1")')
		src = src:gsub("require%s*%(%s*script%.([%w_]+)%s*%)", '__LXM_REQUIRE("%1")')
		src = src:gsub("require%s*%(%s*Chunks%.([%w_]+)%s*%)", '__LXM_REQUIRE("Chunks/%1")')
		src = src:gsub("local%s+Chunks%s*=%s*script%.Chunks", "local Chunks = {}")

		-- `export type` is only legal at the top level of a module, so downgrade it
		-- to a plain local type alias before wrapping.
		src = src:gsub("export%s+type", "type")

		local chunk, compileErr = loadstring("return function(__LXM_REQUIRE)\n" .. src .. "\nend", "lxm/" .. name)
		if not chunk then
			error("lxm/" .. name .. " failed to compile: " .. tostring(compileErr))
		end

		local built, factory = pcall(chunk)
		if not built then
			error("lxm/" .. name .. " failed to build: " .. tostring(factory))
		end

		local ok, value = pcall(factory, resolve)
		loading[name] = nil
		if not ok then
			error("lxm/" .. name .. " threw: " .. tostring(value))
		end

		cache[name] = value
		done[name] = true
		return value
	end

	local ok, lxm = pcall(resolve, "init")
	if not ok then
		error("could not load lxm: " .. tostring(lxm))
	end
	return lxm
end

local parse = buildParser()


--============================== INSTANCE BUILDER ===============================

local function defaultLog(...)
	print("[lxm]", ...)
end

local function defaultWarn(...)
	warn("[lxm]", ...)
end

-- Serialized-only properties that ride along on essentially every instance in
-- an rbxm and are never writable from a client. Measured against the real
-- LBGReplicatedStorage.rbxm: these four alone are 595,232 of its 1,298,755
-- property writes (46%), and every one of them raises. Skipping them removes
-- ~600k raised-and-caught errors, which dominated the build time.
local NEVER_WRITABLE = {
	SourceAssetId = true,
	DefinesCapabilities = true,
	AttributesSerialize = true,
	Tags = true,
	ClassName = true,
}

-- Hoisted so the property loop allocates no closure per write (~1.3M of them).
local function writeProp(inst, key, value)
	inst[key] = value
end

-- Static readers, because a dynamic `_G[name]` read misses executor globals
-- whenever _ENV is sandboxed.
local GLOBAL_READERS = {
	hookfunction   = function() return hookfunction end,
	replaceclosure = function() return replaceclosure end,
	hookfunc       = function() return hookfunc end,
	replacefunction= function() return replacefunction end,
	replacefunc    = function() return replacefunc end,
	detourfunction = function() return detourfunction end,
	detour_function= function() return detour_function end,
	getscriptbytecode = function() return getscriptbytecode end,
	sethiddenproperty = function() return sethiddenproperty end,
	setscriptsource   = function() return setscriptsource end,
}

-- hookfunction and its documented aliases, in preference order.
local HOOK_NAMES = {
	"hookfunction", "replaceclosure", "hookfunc", "replacefunction",
	"replacefunc", "detourfunction", "detour_function",
}

local function readGlobal(name)
	local reader = GLOBAL_READERS[name]
	if not reader then
		return nil
	end
	local ok, f = pcall(reader)
	if ok and f ~= nil then
		return f
	end
	local ok2, g = pcall(function() return _G[name] end)
	return ok2 and g or nil
end

local function findHookFunction()
	for _, name in ipairs(HOOK_NAMES) do
		local f = readGlobal(name)
		if type(f) == "function" then
			return f, name
		end
	end
	return nil
end

local function scriptHasBytecode(inst)
	local f = readGlobal("getscriptbytecode")
	if type(f) ~= "function" then
		return nil
	end
	local ok, bytecode = pcall(f, inst)
	if not ok then
		return nil
	end
	return bytecode ~= nil
end

-- Mesh/texture references. Decoded from the rbxm's Content (typeID 0x22)
-- properties, which lxm upstream drops entirely.
-- The rbxm serialises internal/legacy property names that scripts cannot write.
-- Color3uint8 is the hidden storage behind Color; size/shape/formFactorRaw are
-- lowercase legacy spellings. Same bug class as TextureContent -> Texture: the
-- value is present and correct, only the name is unwritable.
-- Object references in these rbxms are all the null sentinel -1. Writing -1 to
-- Attachment0 leaves a non-nil junk value that blocks hierarchy reconstruction,
-- so null references are dropped and repairReferences fills them in instead.
local NULL_REF_PROPS = {
	Attachment0 = true, Attachment1 = true, Part0 = true, Part1 = true,
	PrimaryPart = true, WeldPart0 = true, WeldPart1 = true,
}

local PROPERTY_ALIASES = {
	Color3uint8 = "Color",
	size = "Size",
	shape = "Shape",
	formFactorRaw = "FormFactor",
	archivable = "Archivable",
	-- Legacy serialised spelling of Sound.RollOffMaxDistance.
	xmlRead_MaxDistance_3 = "RollOffMaxDistance",
}

-- Read-only Content properties have writable legacy aliases that route through
-- the engine's real setter. ParticleEmitter.Texture and FileMesh.MeshId are both
-- access:ReadWrite, so they work with a plain write where *Content does not.
-- Tried before sethiddenproperty, which stores the raw value and desyncs it.
local CONTENT_ALIASES = {
	-- "Texture" first: it is the writable legacy property on ParticleEmitter,
	-- Beam and Decal, which is where every TextureContent in this rbxm lives.
	-- TextureID is the fallback for classes that only expose that spelling.
	TextureContent = { "Texture", "TextureID" },
	MeshContent = { "MeshId" },
}

local MESH_CONTENT_KEYS = {
	MeshContent = true, MeshId = true, TextureContent = true, TextureID = true,
}

local meshPartCache = {}

local enumItemCache = {}

local function toEnumItem(inst, className, key, value)
	local ck = className .. "." .. key
	local byValue = enumItemCache[ck]
	if byValue == nil then
		byValue = {}
		enumItemCache[ck] = byValue
	end
	local hit = byValue[value]
	if hit ~= nil then
		return hit or nil
	end

	local resolved = false
	local category
	local okCur, cur = pcall(function() return inst[key] end)
	if okCur and cur ~= nil then
		local okT, et = pcall(function() return cur.EnumType end)
		if okT and et ~= nil then category = et end
	end

	if category then
		local okI, items = pcall(category.GetEnumItems, category)
		if okI and type(items) == "table" then
			local candidates = { value }
			if value % 16777216 == 0 then candidates[2] = value // 16777216 end
			for _, want in ipairs(candidates) do
				for _, it in ipairs(items) do
					if it.Value == want then resolved = it break end
				end
				if resolved then break end
			end
		end
	end

	byValue[value] = resolved
	return resolved or nil
end

local function enumItemOr(v, fallback)
	local t = (typeof or type)(v)
	if t == "EnumItem" then
		return v
	end
	return fallback
end

local function enumKey(e)
	if e == nil then
		return "nil"
	end
	local okN, n = pcall(function() return e.Name end)
	if okN and type(n) == "string" then
		return n
	end
	local okV, v = pcall(function() return e.Value end)
	if okV and v ~= nil then
		return v
	end
	return e
end

local function getInsertService()
	local ok, svc = pcall(function() return game:GetService("InsertService") end)
	if ok and svc then
		return svc
	end
	return nil
end

local function createMeshPart(node, stats)
	local url = node.Properties.MeshContent
	if type(url) ~= "string" or url == "" then
		return nil
	end

	local cf = enumItemOr(node.Properties.CollisionFidelity, Enum.CollisionFidelity.Default)
	local rf = enumItemOr(node.Properties.RenderFidelity, Enum.RenderFidelity.Automatic)

	local byUrl = meshPartCache[url]
	if not byUrl then
		byUrl = {}
		meshPartCache[url] = byUrl
	end
	local cfKey, rfKey = enumKey(cf), enumKey(rf)
	local byCf = byUrl[cfKey]
	if not byCf then
		byCf = {}
		byUrl[cfKey] = byCf
	end

	local cached = byCf[rfKey]
	if cached then
		stats.meshClones = (stats.meshClones or 0) + 1
		return cached:Clone()
	end

	local svc = getInsertService()
	if not svc then
		return nil
	end

	local log = (stats and stats.log) or defaultLog

	if stats.meshCreates == 0 and stats.meshCreateFailures == 0 then
		log("creating MeshParts via InsertService:CreateMeshPartAsync "
			.. "(one yielding request per distinct mesh)...")
	end

	local ok, part = pcall(svc.CreateMeshPartAsync, svc, url, cf, rf)
	if not ok or part == nil then
		stats.meshCreateFailures = (stats.meshCreateFailures or 0) + 1
		if not stats.meshErrors then
			stats.meshErrors = {}
		end
		local msg = tostring(part)
		if not stats.meshErrors[msg] then
			stats.meshErrors[msg] = url
			local distinct = 0
			for _ in pairs(stats.meshErrors) do
				distinct = distinct + 1
			end
			if distinct <= 5 then
				log(("mesh create FAILED (%s) url=%s"):format(msg, url))
			end
		end
		return nil
	end

	byCf[rfKey] = part
	stats.meshCreates = (stats.meshCreates or 0) + 1
	return part:Clone()
end

--============================== REQUIRE SHIM ==================================
-- Roblox will not necessarily compile a ModuleScript that was created at
-- runtime, so require() on one can fail with "Requested module experienced an
-- error while loading" and no line number. We already hold the exact source for
-- every module we injected, and loadstring works, so rescue those requires by
-- compiling the source ourselves. Automatically installed on compile.

local SHIM_SOURCES = {}
local SHIM_CACHE = {}
local SHIM_LOADING = {}
local SHIM_INSTALLED = false
local SHIM_HOOK_NAME = nil
local originalRequire = nil

local function compileModule(inst, src)
	local header = "local script = ...\n"
	local chunk, err = loadstring(header .. src, inst:GetFullName())
	if not chunk then
		return nil, "compile error: " .. tostring(err)
	end
	local ok, result = pcall(chunk, inst)
	if not ok then
		return nil, "runtime error: " .. tostring(result)
	end
	return result
end

local function resolveModule(inst, logFn)
	logFn = logFn or defaultLog
	local cached = SHIM_CACHE[inst]
	if cached ~= nil then
		return cached
	end
	if SHIM_LOADING[inst] then
		error("Requested module was required recursively: " .. inst:GetFullName())
	end

	SHIM_LOADING[inst] = true
	local value, err = compileModule(inst, SHIM_SOURCES[inst])
	SHIM_LOADING[inst] = nil

	if value == nil then
		error(("%s: %s"):format(inst:GetFullName(), tostring(err)))
	end

	SHIM_CACHE[inst] = value
	logFn("compiled injected module from source: " .. inst:GetFullName())
	return value
end

local function installRequireShim(sources, label, options)
	local log = (type(options) == "table" and options.log) or defaultLog
	local warnf = (type(options) == "table" and options.warn) or defaultWarn

	if type(sources) == "table" then
		for inst, src in pairs(sources) do
			SHIM_SOURCES[inst] = src
		end
	end

	if SHIM_INSTALLED then
		return true
	end

	if type(loadstring) ~= "function" then
		warnf("loadstring unavailable - cannot compile injected modules")
		return false
	end

	local hook, hookName = findHookFunction()
	if not hook then
		local count = 0
		for _ in pairs(SHIM_SOURCES) do count = count + 1 end
		warnf(("no hookfunction/replaceclosure available - %d injected module(s) depend on Roblox compiling them"):format(count))
		return false
	end

	local ok, orig = pcall(hook, require, function(target, ...)
		if SHIM_SOURCES[target] ~= nil then
			local realOk, realResult = pcall(originalRequire, target, ...)
			if realOk then
				return realResult
			end
			-- Roblox could not run it. Fall back to the source we injected.
			return resolveModule(target, log)
		end
		return originalRequire(target, ...)
	end)

	if not ok then
		warnf(("hooking require via %s failed: %s"):format(hookName, tostring(orig)))
		return false
	end

	originalRequire = orig
	SHIM_INSTALLED = true
	SHIM_HOOK_NAME = hookName

	local count = 0
	for _ in pairs(SHIM_SOURCES) do count = count + 1 end
	log(("require shim installed via %s (%d injected module(s) recoverable)"):format(hookName, count))
	return true
end

--============================== BUILD INSTANCE =================================

local function buildInstance(node, stats)
	local inst

	local meshApplied = false
	if node.ClassName == "MeshPart" then
		inst = createMeshPart(node, stats)
		meshApplied = inst ~= nil
	end

	local ok = inst ~= nil
	if not ok then
		ok, inst = pcall(Instance.new, node.ClassName)
	end
	if not ok or inst == nil then
		stats.failed[node.ClassName] = (stats.failed[node.ClassName] or 0) + 1
		return nil
	end

	local className = node.ClassName
	local failed = stats.writeFailures[className]
	if not failed then
		failed = {}
		stats.writeFailures[className] = failed
	end

	local props = node.Properties
	for key, value in pairs(props) do
		-- Numeric enum values cannot be assigned to an enum property; swap in the
		-- EnumItem. Non-enum numbers fall straight through untouched.
		if type(value) == "number" then
			local item = toEnumItem(inst, className, key, value)
			if item then value = item end
		end

		if NEVER_WRITABLE[key] then
			stats.neverWritable = stats.neverWritable + 1
		elseif NULL_REF_PROPS[key] and value == -1 then
			-- Null referent: leave the property unset so it can be reconstructed.
			stats.skippedWrites = stats.skippedWrites + 1
		elseif PROPERTY_ALIASES[key] then
			local alias = PROPERTY_ALIASES[key]
			if not failed[alias] and pcall(writeProp, inst, alias, value) then
				stats.writes = stats.writes + 1
			else
				failed[alias] = true
				stats.skippedWrites = stats.skippedWrites + 1
			end
		elseif key == "Source" and inst:IsA("LuaSourceContainer") then
			if typeof(value) == "string" then
				local sourceOk = pcall(function()
					local sss = readGlobal("setscriptsource") or (type(setscriptsource) == "function" and setscriptsource)
					local shp = readGlobal("sethiddenproperty") or (type(sethiddenproperty) == "function" and sethiddenproperty)
					if sss then
						sss(inst, value)
					elseif shp then
						shp(inst, "Source", value)
					else
						inst.Source = value
					end
				end)

				if sourceOk then
					stats.writes = stats.writes + 1

					-- FORCE COMPILATION:
					-- Toggling the script's core properties forces the executor's
					-- background thread or the engine to re-link and compile bytecode.
					pcall(function()
						if inst:IsA("Script") or inst:IsA("LocalScript") then
							inst.Enabled = false
							inst.Enabled = true
						elseif inst:IsA("ModuleScript") then
							-- Triggers compilation linkage hooks inside executor sandboxes
							local currentParent = inst.Parent
							inst.Parent = nil
							inst.Parent = currentParent

							-- Automatically install require shim on compile
							SHIM_SOURCES[inst] = value
							installRequireShim(nil, nil, { log = stats.log or defaultLog, warn = stats.warnf or defaultWarn })
						end
					end)
				else
					failed[key] = true
					stats.skippedWrites = stats.skippedWrites + 1
				end
			end
		elseif MESH_CONTENT_KEYS[key] and meshApplied
				and (key == "MeshContent" or key == "MeshId") then
			-- Already applied by CreateMeshPartAsync. Deliberately left alone.
			stats.writes = stats.writes + 1
		elseif MESH_CONTENT_KEYS[key] and not failed[key] then
			-- MeshPart.MeshId/MeshContent carry NotAccessible, so a plain write is
			-- refused even when the asset itself is public. Try the executor's
			-- protected-write function first, then the plain write.
			local wrote = false
			for _, alias in ipairs(CONTENT_ALIASES[key] or {}) do
				if pcall(writeProp, inst, alias, value) then
					wrote = true
					break
				end
			end
			if not wrote then
				local sh = readGlobal("sethiddenproperty")
				if type(sh) == "function" then
					wrote = pcall(sh, inst, key, value)
				end
			end
			if not wrote then
				wrote = pcall(writeProp, inst, key, value)
			end
			if wrote then
				stats.writes = stats.writes + 1
			else
				failed[key] = true
				stats.skippedWrites = stats.skippedWrites + 1
			end
		elseif key ~= "Name" and not failed[key] then
			if pcall(writeProp, inst, key, value) then
				stats.writes = stats.writes + 1
			else
				failed[key] = true
				stats.skippedWrites = stats.skippedWrites + 1
			end
		end
	end

	if typeof(props.Name) == "string" then
		inst.Name = props.Name
	end

	-- Build the subtree before attaching it, so nothing re-indexes twice.
	for _, childNode in ipairs(node.Children) do
		local child = buildInstance(childNode, stats)
		if child then
			child.Parent = inst
		end
	end

	stats.built = stats.built + 1

	local yieldEvery = (stats and stats.yieldEvery) or 2500
	if yieldEvery > 0 and stats.built % yieldEvery == 0 then
		task.wait()
	end

	return inst
end

--============================== BUILD ==========================================

local function build(parsedData, label, options)
	if type(label) == "table" and options == nil then
		options = label
		label = nil
	end
	label = label or "rbxm"
	local log = (type(options) == "table" and options.log) or defaultLog
	local warnf = (type(options) == "table" and options.warn) or defaultWarn
	local yieldEvery = (type(options) == "table" and options.yieldEvery) or 2500
	local parsedTime = (type(options) == "table" and options.parsedTime)

	local tree
	if type(parsedData) == "table" and parsedData.Tree then
		tree = parsedData.Tree
	elseif type(parsedData) == "table" then
		tree = parsedData
	else
		error(("%s: expected parsed rbxm data with Tree, got %s"):format(label, typeof and typeof(parsedData) or type(parsedData)))
	end

	-- LBGReplicatedStorage.rbxm's root is the ReplicatedStorage *service* itself.
	-- You cannot Instance.new() a service, so unwrap it and take its children.
	local roots, unwrapped = {}, 0
	for _, root in ipairs(tree) do
		if root.IsService then
			unwrapped = unwrapped + 1
			for _, child in ipairs(root.Children or {}) do
				roots[#roots + 1] = child
			end
		else
			roots[#roots + 1] = root
		end
	end

	if parsedTime then
		log(("%s: parsed %d root(s) in %.2fs%s"):format(label, #roots, parsedTime,
			unwrapped > 0 and (" (unwrapped " .. unwrapped .. " service root(s))") or ""))
	end

	local stats = {
		built = 0,
		failed = {},
		writeFailures = {},
		writes = 0,
		skippedWrites = 0,
		neverWritable = 0,
		meshCreates = 0,
		meshClones = 0,
		meshCreateFailures = 0,
		yieldEvery = yieldEvery,
		log = log,
		warnf = warnf,
	}

	log(label .. ": building instances...")
	local t1 = os.clock()
	local instances = {}
	for _, rootNode in ipairs(roots) do
		local inst = buildInstance(rootNode, stats)
		if inst then
			instances[#instances + 1] = inst
		end
	end

	local failedClasses = {}
	for className in pairs(stats.failed) do
		failedClasses[#failedClasses + 1] = className
	end
	if #failedClasses > 0 then
		table.sort(failedClasses)
		warnf(("%s: could not create %d class(es): %s"):format(label, #failedClasses,
			table.concat(failedClasses, ", ")))
	end

	if stats.meshCreates > 0 or stats.meshCreateFailures > 0 then
		log(("%s: meshes: %d created, %d cloned, %d failed"):format(
			label, stats.meshCreates, stats.meshClones, stats.meshCreateFailures))
	end

	log(("%s: built %d instance(s), %d property write(s) in %.2fs"):format(
		label, stats.built, stats.writes, os.clock() - t1))
	if stats.neverWritable > 0 or stats.skippedWrites > 0 then
		log(("%s: skipped %d non-writable serialized propert(y/ies) (%d known, %d learned)"):format(
			label, stats.neverWritable + stats.skippedWrites, stats.neverWritable, stats.skippedWrites))
	end
	return instances
end

--============================== BUILDER FIXES: REPAIR REFERENCES ================
-- The source rbxms contain no object references: every 0x13 value is the null
-- sentinel -1. Reconstruct what the instance hierarchy implies. A Beam's endpoints
-- are the attachments that sit beside it under a shared parent, conventionally A1/A2.

local JOINT_CLASSES = { Motor6D = true, Weld = true, WeldConstraint = true }
local BASE_PARTS = { Part = true, MeshPart = true }

local LIMB_BY_JOINT = {
	Neck = { "Head" },
	["Left Shoulder"] = { "Left Arm", "LeftArm", "Left UpperArm", "LeftUpperArm" },
	["Right Shoulder"] = { "Right Arm", "RightArm", "Right UpperArm", "RightUpperArm" },
	["Left Hip"] = { "Left Leg", "LeftLeg", "Left UpperLeg", "LeftUpperLeg" },
	["Right Hip"] = { "Right Leg", "RightLeg", "Right UpperLeg", "RightUpperLeg" },
	RootJoint = { "Torso", "LowerTorso", "UpperTorso", "HumanoidRootPart" },
	Root = { "Torso", "LowerTorso", "UpperTorso", "HumanoidRootPart" },
	Waist = { "UpperTorso", "Torso" },
}

local function repairReferences(root, label, options)
	if type(label) == "table" and options == nil then
		options = label
		label = nil
	end
	label = label or "repair"
	local log = (type(options) == "table" and options.log) or defaultLog

	if type(root) == "table" and not (typeof and typeof(root) == "Instance") then
		local totalBeams, totalPrimaries = 0, 0
		for _, inst in ipairs(root) do
			local b, p = repairReferences(inst, label, options)
			totalBeams = totalBeams + b
			totalPrimaries = totalPrimaries + p
		end
		return totalBeams, totalPrimaries
	end

	local beams, primaries, joints = 0, 0, 0

	local function visit(inst)
		local cn = inst.ClassName
		if cn == "Beam" or cn == "Trail" then
			if not inst.Attachment0 or not inst.Attachment1 then
				local node, a1, a2 = inst.Parent, nil, nil
				for _ = 1, 4 do
					if not node then break end
					local sibs = {}
					for _, c in ipairs(node:GetChildren()) do
						if c.ClassName == "Attachment" then
							sibs[#sibs + 1] = c
							if c.Name == "A1" then a1 = c
							elseif c.Name == "A2" then a2 = c end
						end
					end
					if not (a1 and a2) and #sibs >= 2 then a1, a2 = sibs[1], sibs[2] end
					if a1 and a2 then break end
					a1, a2 = nil, nil
					node = node.Parent
				end
				if a1 and a2 and pcall(function()
					inst.Attachment0 = a1
					inst.Attachment1 = a2
				end) then
					beams = beams + 1
				end
			end
		elseif JOINT_CLASSES[cn] then
			if not inst.Part0 or not inst.Part1 then
				local parent, p0 = inst.Parent, nil
				local node = parent
				for _ = 1, 4 do
					if not node then break end
					if BASE_PARTS[node.ClassName] then p0 = node break end
					node = node.Parent
				end

				local scope = parent
				while scope and scope.ClassName ~= "Model" do scope = scope.Parent end
				if not scope then scope = parent end

				local p1
				local wanted = LIMB_BY_JOINT[inst.Name]
				if wanted and scope then
					for _, d in ipairs(scope:GetDescendants()) do
						if BASE_PARTS[d.ClassName] and d ~= p0 then
							for _, nm in ipairs(wanted) do
								if d.Name == nm then p1 = d break end
							end
						end
						if p1 then break end
					end
				end
				if not p1 and scope then
					for _, d in ipairs(scope:GetDescendants()) do
						if d ~= inst and d ~= p0 and BASE_PARTS[d.ClassName] then p1 = d break end
					end
				end

				if p0 and p1 and pcall(function()
					inst.Part0 = p0
					inst.Part1 = p1
				end) then
					joints = joints + 1
				end
			end
		elseif cn == "Model" and not inst.PrimaryPart then
			for _, d in ipairs(inst:GetDescendants()) do
				if d.ClassName == "Part" or d.ClassName == "MeshPart" then
					if pcall(function() inst.PrimaryPart = d end) then
						primaries = primaries + 1
					end
					break
				end
			end
		end
		for _, c in ipairs(inst:GetChildren()) do visit(c) end
	end

	visit(root)
	if beams > 0 or primaries > 0 or joints > 0 then
		log(("%s: repaired %d beam/trail endpoint pair(s), %d primary part(s), %d joint(s)"):format(label, beams, primaries, joints))
	end
	return beams, primaries
end

--============================== BUILDER FIXES: SCRIPT AUDIT =====================

local SCRIPT_CLASSES = { ModuleScript = true, Script = true, LocalScript = true }

local function auditScripts(instances, label, options)
	if type(label) == "table" and options == nil then
		options = label
		label = nil
	end
	label = label or "audit"
	local log = (type(options) == "table" and options.log) or defaultLog
	local warnf = (type(options) == "table" and options.warn) or defaultWarn

	if typeof and typeof(instances) == "Instance" then
		instances = { instances }
	end

	local total, empty = 0, {}
	local sources, uncompiled, compiledCount = {}, {}, 0

	local function walk(inst)
		if SCRIPT_CLASSES[inst.ClassName] then
			total = total + 1
			local ok, src = pcall(function() return inst.Source end)
			if not ok or type(src) ~= "string" or #src == 0 then
				empty[#empty + 1] = inst:GetFullName()
			elseif inst.ClassName == "ModuleScript" then
				sources[inst] = src
				local compiled = scriptHasBytecode(inst)
				if compiled == false then
					uncompiled[#uncompiled + 1] = inst:GetFullName()
				elseif compiled == true then
					compiledCount = compiledCount + 1
				end
			end
		end
		for _, c in ipairs(inst:GetChildren()) do walk(c) end
	end

	for _, inst in ipairs(instances) do walk(inst) end

	if total == 0 then
		return 0, 0, sources
	end

	if #empty == 0 then
		log(("%s: all %d script(s) have source"):format(label, total))
	else
		warnf(("%s: %d of %d script(s) have EMPTY source - require() on these fails"):format(
			label, #empty, total))
		for i = 1, math.min(10, #empty) do
			warnf("  empty source: " .. empty[i])
		end
		if #empty > 10 then
			warnf(("  ... and %d more"):format(#empty - 10))
		end
	end

	if #uncompiled > 0 then
		warnf(("%s: %d ModuleScript(s) have source but NO bytecode - the engine did not compile them"):format(
			label, #uncompiled))
		for i = 1, math.min(5, #uncompiled) do
			warnf("  uncompiled: " .. uncompiled[i])
		end
	elseif compiledCount > 0 then
		log(("%s: %d ModuleScript(s) confirmed compiled"):format(label, compiledCount))
	end

	return #empty, total, sources
end

--============================== BUILDER FIXES: DIAGNOSE MODULES =================

local DIAGNOSE_MODULES = false

local function diagnoseModules(instances, label, options)
	if type(label) == "table" and options == nil then
		options = label
		label = nil
	end
	label = label or "diagnose"
	local log = (type(options) == "table" and options.log) or defaultLog
	local warnf = (type(options) == "table" and options.warn) or defaultWarn

	if typeof and typeof(instances) == "Instance" then
		instances = { instances }
	end

	local tested, bad = 0, {}

	local function walk(inst)
		if inst.ClassName == "ModuleScript" then
			tested = tested + 1
			local ok, err = pcall(require, inst)
			if not ok then
				bad[#bad + 1] = inst:GetFullName() .. "  ->  " .. tostring(err)
			end
		end
		for _, c in ipairs(inst:GetChildren()) do walk(c) end
	end

	for _, inst in ipairs(instances) do walk(inst) end

	log(("%s: required %d module(s), %d failed"):format(label, tested, #bad))
	for i = 1, math.min(15, #bad) do
		warnf("  " .. bad[i])
	end
	if #bad > 15 then
		warnf(("  ... and %d more"):format(#bad - 15))
	end

	return #bad
end

--============================== BUILDER PARENTING ===============================

local function parentAll(instances, target, skipExisting, label, options)
	local log = (type(options) == "table" and options.log) or defaultLog
	local warnf = (type(options) == "table" and options.warn) or defaultWarn
	local added, skipped = 0, 0

	for _, inst in ipairs(instances) do
		if skipExisting and target:FindFirstChild(inst.Name) then
			skipped = skipped + 1
		else
			inst.Parent = target
			added = added + 1
		end
	end

	log(("parented %d into %s%s"):format(added, target:GetFullName(),
		skipped > 0 and (" (skipped " .. skipped .. " existing)") or ""))

	-- References cannot come from the file, so rebuild them once the tree exists.
	for _, inst in ipairs(instances) do
		repairReferences(inst, label or target.Name, options)
	end

	local _, _, sources = auditScripts(instances, label or target:GetFullName(), options)
	installRequireShim(sources, label or target:GetFullName(), options)
	if DIAGNOSE_MODULES then
		diagnoseModules(instances, label or target:GetFullName(), options)
	end

	return added
end

local function replaceChild(parent, name, instances, options)
	local log = (type(options) == "table" and options.log) or defaultLog
	local existing = parent:FindFirstChild(name)
	if existing then
		existing:Destroy()
		log("destroyed old " .. parent:GetFullName() .. "." .. name)
	end

	if #instances == 1 and instances[1].Name == name then
		instances[1].Parent = parent
		log("installed " .. parent:GetFullName() .. "." .. name)
		return instances[1]
	end

	local folder = Instance.new("Folder")
	folder.Name = name
	for _, inst in ipairs(instances) do
		inst.Parent = folder
	end
	folder.Parent = parent
	log("installed " .. parent:GetFullName() .. "." .. name .. " (wrapped folder)")
	return folder
end

--============================== EXPORT =========================================

local lxm = {
	parse = parse,
	build = build,
	parentAll = parentAll,
	replaceChild = replaceChild,
	repairReferences = repairReferences,
	auditScripts = auditScripts,
	installRequireShim = installRequireShim,
	diagnoseModules = diagnoseModules,
	DIAGNOSE_MODULES = false,
}

setmetatable(lxm, {
	__call = function(_, raw)
		return parse(raw)
	end,
})

local genv = (getgenv and getgenv()) or _G
genv.lxm = lxm
genv.Lxm = lxm

return lxm
