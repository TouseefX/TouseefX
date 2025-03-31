-- use sukan emote and stopanims to make the hands fe and play deleted emotes
local player = game.Players.LocalPlayer
local playerGui = player.PlayerGui
local NotifyModule:NotifyModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/PeaPattern/notif-lib/main/main.lua"))()
-- some large scripts inside functionality
local function updateEmotes(name)
    local emotesValue = player.PlayerData.Equipped.Emotes.Value
    local emotesList = {}

    for value in string.gmatch(emotesValue, "[^|]+") do
        table.insert(emotesList, value)
    end

    if #emotesList >= 6 then
        emotesList[6] = name
    end
    
    player.PlayerData.Equipped.Emotes.Value = table.concat(emotesList, "|")
end

local character = player.Character or player.CharacterAdded:Wait()
local head = character:WaitForChild("Head")
local camera = Workspace.CurrentCamera

local originalCameraSubject = camera.CameraSubject
local cameraFollowing = false

local function stopFollowingHead()
    cameraFollowing = false
    camera.CameraSubject = originalCameraSubject
end

local function startFollowingHead()
    if not cameraFollowing then
        cameraFollowing = true
        camera.CameraSubject = head
    end
end

local function SubSing()
    wait(2)
    NotifyModule:Notify("Noise, oh I hear the voice", 4.994)
    wait(5.094)
    NotifyModule:Notify("Say", 2.135)
    wait(2.705)
    NotifyModule:Notify("would you like to play?", 3.909)
    wait(2.167)
    NotifyModule:Notify("we’ll keep on zooming", 1.087)
    wait(2.074)
    NotifyModule:Notify("Why not spread your arms and fly?", 1.323)
    wait(1.423)
    NotifyModule:Notify("you haven’t got a thing", 1.423)
    wait(1.529)
    NotifyModule:Notify("Cause I'm right by your side", 1.262)
    wait(1.233)
    NotifyModule:Notify("I always", 1.128)
    wait(1.041)
    NotifyModule:Notify("SEEK!", 0.833)
    wait(1.944)
    NotifyModule:Notify("AND YOU", 1.638)
    wait(1.689)
    NotifyModule:Notify("NEVER HIDE!", 1.249)
    wait(0.251)
    NotifyModule:Notify("What’s wrong now, you’re looking grim", 1.150)
    wait(1.184)
    NotifyModule:Notify("Not seen a hedgehog with those eyes?", 1.370)
    wait(1.733)
    NotifyModule:Notify("Might it be, your", 0.674)
    wait(0.685)
    NotifyModule:Notify("Old pal Sonic", 0.743)
    wait(0.743)
    NotifyModule:Notify("hard for you to recognize?", 0.817)
    wait(1.333)
    NotifyModule:Notify("If you think a fake’s", 1.504)
    wait(0.534)
    NotifyModule:Notify("the one who's singing", 0.856)
    wait(1.809)
    NotifyModule:Notify("I'll remind you", 1.678)
    wait(1.678)
    NotifyModule:Notify("that you might be forgetting just a thing", 2.336)
    wait(1.777)
    NotifyModule:Notify("I MAKE!", 2.336)
    wait(2.510)
    NotifyModule:Notify("YOU", 1.719)
    wait(0.719)
    NotifyModule:Notify("PLAY", 2.806)
    wait(1.899)
    NotifyModule:Notify("ALONG", 1.054)
    wait(2.399)
    NotifyModule:Notify("IN TIME", 1.369)
    wait(1.369)
    NotifyModule:Notify("WITH ME", 0.940)
    wait(0.940)
    NotifyModule:Notify("SOON I", 1.678)
    wait(1.525)
    NotifyModule:Notify("BREAK", 3.061)
    wait(2.061)
    NotifyModule:Notify("THAT SPACE", 2.389)
    wait(2.389)
    NotifyModule:Notify("YOUR HEART", 2.538)
    wait(3.538)
    NotifyModule:Notify("I SHALL SET FREE", 1.061)
    wait(1.455)
    NotifyModule:Notify("SO FOLLOW ME", 0.562)
    wait(1.573)
    NotifyModule:Notify("You’re Not Very Good at This", 0.300)
    wait(1.940)
    NotifyModule:Notify("ARE YOU?", 0.562)
end

local function StopAnimation()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    local animator = humanoid:FindFirstChildOfClass("Animator") or humanoid:WaitForChild("Animator")
    
    local BV = character.HumanoidRootPart:FindFirstChild("BodyVelocity")
    if BV then
        humanoid.PlatformStand = false
        BV:Destroy()
    end
    
    stopFollowingHead()
    -- Find and destroy some hands
    local Hands = character:FindFirstChild("PlayerEmoteHand")
    if Hands then
        Hands:Destroy()
    end
    -- there are 2 hands
    local Hand = character:FindFirstChild("PlayerEmoteHand")
    if Hand then
        Hand:Destroy()
    end
    -- remove assets for these emotes don't worry about sillymic i killed silly billy ok?
    local SillyMic = character:FindFirstChild("SillyBillyMicrophone")
    if SillyMic then
        SillyMic:Destroy()
    end

    local MissHat = character:FindFirstChild("EmoteHatAsset")
    if MissHat then
        MissHat:Destroy()
    end
    
    local Phone = character:FindFirstChild("Phone")
    if Phone then
       Phone:Destroy()
    end
    -- Find and stop/destroy animation and sound
    for i,v in pairs(animator:GetPlayingAnimationTracks()) do					
			if v.Name == "Animation" then					
				  v:Stop()	
			end	
	end
    
    local sound = character.HumanoidRootPart:FindFirstChild("Sound")
    if sound then
        sound:Stop()
        sound:Destroy()
    end
end

local function sern()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    
    local sem = character.HumanoidRootPart:FindFirstChild("PlayerEmoteSFX")
    if sem then
       character.HumanoidRootPart.PlayerEmoteSFX:Stop() -- stop tick tock music for you only
    end
end

local function nothingness()
    print("not needed")
end

-- this is for emotes function scripts
local function Subterfuge()
    updateEmotes("_Subterfuge")
    -- freeze your robloz character
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.PlatformStand = true
    humanoid:Move(Vector3.zero)
 
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
    bodyVelocity.Velocity = Vector3.zero
    bodyVelocity.Parent = character:WaitForChild("HumanoidRootPart")
    -- getting some emotes stuffs
    local emoteScript = require(game:GetService("ReplicatedStorage").Assets.Emotes._Subterfuge) --the script had been chanced his name in new update
    emoteScript.Created({Character = character})
 
    local animation = Instance.new("Animation")
    animation.AnimationId = "rbxassetid://87482480949358"
    local animationTrack = humanoid:LoadAnimation(animation)
    animationTrack:Play()
    sern()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://132297506693854"
    sound.Parent = character:WaitForChild("HumanoidRootPart")
    sound.Volume = 5
    sound.Looped = false
    sound.RollOffMode = Enum.RollOffMode.Linear
    sound.MaxDistance = 50
    sound:Play()
    
    local args = {
        [1] = "PlayEmote",
        [2] = "Animations",
        [3] = "_Subterfuge"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
    -- the emote script is broken so hands can't disappear
    startFollowingHead()
    game:GetService("Debris"):AddItem(character:FindFirstChild("PlayerEmoteHand"), 80)
    SubSing()
    animationTrack.Stopped:Connect(function()
        stopFollowingHead()
         local Hand = character:FindFirstChild("PlayerEmoteHand")
         if Hand then
            Hand:Destroy()
        end
        local HandT = character:FindFirstChild("PlayerEmoteHand")
        if HandT then
           HandT:Destroy()
        end
        humanoid.PlatformStand = false
        if bodyVelocity and bodyVelocity.Parent then
            bodyVelocity:Destroy()
        end
    end)
end

local function SillyBilly(id) -- id for soundid because there are 2 verisons of silly billy
    updateEmotes("_SillyBilly")
    -- freeze your robloz character
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.PlatformStand = true
    humanoid:Move(Vector3.zero)

    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
    bodyVelocity.Velocity = Vector3.zero
    bodyVelocity.Parent = character:WaitForChild("HumanoidRootPart")
    -- getting some emotes stuffs
    local emoteScript = require(game:GetService("ReplicatedStorage").Assets.Emotes._SillyBilly) --the script had been chanced his name in new update
    emoteScript.Created({Character = character})

    local animation = Instance.new("Animation")
    animation.AnimationId = "rbxassetid://107464355830477"
    local animationTrack = humanoid:LoadAnimation(animation)
    animationTrack:Play()

    local sound = Instance.new("Sound")
    sound.SoundId = id
    sound.Parent = character:WaitForChild("HumanoidRootPart")
    sound.Volume = 1
    sound.Looped = false
    sound.RollOffMode = Enum.RollOffMode.Linear
    sound.MaxDistance = 50
    sound:Play()

    local args = {
        [1] = "PlayEmote",
        [2] = "Animations",
        [3] = "_SillyBilly"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
    
    startFollowingHead()
    game:GetService("Debris"):AddItem(character:FindFirstChild("SillyBillyMicrophone"), 44)
    -- unfreeze because something happend
    animationTrack.Stopped:Connect(function()
        stopFollowingHead()
        humanoid.PlatformStand = false
        if bodyVelocity and bodyVelocity.Parent then
            bodyVelocity:Destroy()
        end
    end)
end

local function MissQuiet()
    updateEmotes("_MissTheQuiet")
    -- freeze your robloz character
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.PlatformStand = true
    humanoid:Move(Vector3.zero)

    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
    bodyVelocity.Velocity = Vector3.zero
    bodyVelocity.Parent = character:WaitForChild("HumanoidRootPart")
    -- getting some emotes stuffs
    local emoteScript = require(game:GetService("ReplicatedStorage").Assets.Emotes._MissTheQuiet) --the script had been chanced his name in new update
    emoteScript.Created({Character = character})
    -- emoteScript adds the lighting itself
    local animation = Instance.new("Animation")
    animation.AnimationId = "rbxassetid://100986631322204"
    local animationTrack = humanoid:LoadAnimation(animation)
    animationTrack:Play()
    sern()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://131936418953291"
    sound.Parent = character:WaitForChild("HumanoidRootPart")
    sound.Volume = 1
    sound.Looped = false
    sound.RollOffMode = Enum.RollOffMode.Linear
    sound.MaxDistance = 50
    sound:Play()

    local args = {
        [1] = "PlayEmote",
        [2] = "Animations",
        [3] = "_MissTheQuiet"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
    -- the emote script is broken so hands can't disappear
    startFollowingHead()
    game:GetService("Debris"):AddItem(character:FindFirstChild("PlayerEmoteHand"), 240)
    game:GetService("Debris"):AddItem(character:FindFirstChild("EmoteHatAsset"), 240) -- lighting is in the hat now
    -- unfreeze because something happend.
    NotifyModule:Notify("lyices soon because this is gonna be the longest script", 5)
    wait(242) -- to fix the bug where animation still plays
    animationTrack:Stop()
    animationTrack.Stopped:Connect(function()
        stopFollowingHead()
         if Hand then
            Hand:Destroy()
        end
        local THand = character:FindFirstChild("PlayerEmoteHand")
        if THand then
           THand:Destroy()
        end
        humanoid.PlatformStand = false
        if bodyVelocity and bodyVelocity.Parent then
            bodyVelocity:Destroy()
        end
    end)
end

local function Tick()
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.PlatformStand = true
    humanoid:Move(Vector3.zero)

    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
    bodyVelocity.Velocity = Vector3.zero
    bodyVelocity.Parent = character:WaitForChild("HumanoidRootPart")
    -- emote script is gone and deleted so we use subtetfuge script
    local emoteScript = require(game:GetService("ReplicatedStorage").Assets.Emotes._Subterfuge) --the script had been chanced his name in new update
    emoteScript.Created({Character = character})
    
    local animation = Instance.new("Animation")
    animation.AnimationId = "rbxassetid://118204083671442"
    local animationTrack = humanoid:LoadAnimation(animation)
    animationTrack.Looped = true
    animationTrack:Play()
    sern()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://104213462628762"
    sound.Parent = character:WaitForChild("HumanoidRootPart")
    sound.Volume = 1
    sound.Looped = true
    sound.RollOffMode = Enum.RollOffMode.Linear
    sound.MaxDistance = 50
    sound:Play()
    startFollowingHead()
    game:GetService("Debris"):AddItem(character:FindFirstChild("PlayerEmoteHand"), 240)
end

local function LC()
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.PlatformStand = true
    humanoid:Move(Vector3.zero)

    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
    bodyVelocity.Velocity = Vector3.zero
    bodyVelocity.Parent = character:WaitForChild("HumanoidRootPart")
    -- if emote script is gone and deleted so we use SillyBilly in case
    local emoteScript = require(game:GetService("ReplicatedStorage").Assets.Emotes._SillyBilly)
    emoteScript.Created({Character = character})
    
    local animation = Instance.new("Animation")
    animation.AnimationId = "rbxassetid://112887456905366"
    local animationTrack = humanoid:LoadAnimation(animation)
    animationTrack.Looped = true
    animationTrack:Play()

    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://107281579144976"
    sound.Parent = character:WaitForChild("HumanoidRootPart")
    sound.Volume = 1
    sound.Looped = true
    sound.RollOffMode = Enum.RollOffMode.Linear
    sound.MaxDistance = 50
    sound:Play()
    
    local args = {
        [1] = "PlayEmote",
        [2] = "Animations",
        [3] = "ThePhone"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
    
    game:GetService("Debris"):AddItem(character:FindFirstChild("Phone"), 240)
    
    startFollowingHead()
    
    local SillyMic = character:FindFirstChild("SillyBillyMicrophone")
    if SillyMic then
       SillyMic:Destroy()
    end
end
-- emotes script functions stops here
-- this was the old way to play emotes
-- Subterfuge()
-- SillyBilly()
-- MissQuiet()
-- Tick()
-- LC()
-- gui was born so um bye bye see you later
local function onCharacterAdded(character)
    wait(0.1)
end

player.CharacterAdded:Connect(onCharacterAdded)

if player.Character then
    onCharacterAdded(player.Character)
end

local function createButton(parent, text, position, color, onClick)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.8, 0, 0.12, 0)
    button.Position = position
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = color
    button.Font = Enum.Font.GothamBold
    button.TextSize = 16
    button.Parent = parent

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 5)
    buttonCorner.Parent = button

    button.MouseButton1Click:Connect(onClick)

    return button
end

local Playersgui = game:GetService("Players")
local playergui = Playersgui.LocalPlayer
-- Smaller GUI
local screenGui = Instance.new("ScreenGui", playergui:WaitForChild("PlayerGui"))
local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 200, 0, 280)
mainFrame.Position = UDim2.new(0.5, -100, 0.5, -140)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
mainFrame.BackgroundTransparency = 0.2
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 10)
uiCorner.Parent = mainFrame

-- Close Button
local closeButton = Instance.new("TextButton", mainFrame)
closeButton.Size = UDim2.new(0, 25, 0, 25)
closeButton.Position = UDim2.new(1, -30, 0, 5)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 16

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 5)
closeCorner.Parent = closeButton

closeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

-- Create Buttons
createButton(mainFrame, "Subterfuge", UDim2.new(0.1, 0, 0.1, 0), Color3.fromRGB(30, 60, 90), function()
    Subterfuge()
end)

createButton(mainFrame, "Miss The Quiet", UDim2.new(0.1, 0, 0.24, 0), Color3.fromRGB(0, 0, 255), function()
    MissQuiet()
end)

createButton(mainFrame, "Silly Billy", UDim2.new(0.1, 0, 0.38, 0), Color3.fromRGB(255, 105, 180), function()
    SillyBilly("rbxassetid://77601084987544")
end)

createButton(mainFrame, "Tick Tock", UDim2.new(0.1, 0, 0.52, 0), Color3.fromRGB(255, 105, 180), function()
    Tick()
end)

createButton(mainFrame, "Pick Up The Phone", UDim2.new(0.1, 0, 0.66, 0), Color3.fromRGB(255, 105, 180), function()
    LC()
end)

createButton(mainFrame, "Stop Emote", UDim2.new(0.1, 0, 0.80, 0), Color3.fromRGB(255, 50, 50), function()
    StopAnimation()
end)

-- Restored "Made by: Ice" Label
local creditLabel = Instance.new("TextLabel", mainFrame)
creditLabel.Size = UDim2.new(0.8, 0, 0.08, 0)
creditLabel.Position = UDim2.new(0.1, 0, 0.92, 0)
creditLabel.Text = "Credits In script page info"
creditLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
creditLabel.BackgroundTransparency = 1
creditLabel.Font = Enum.Font.GothamBold
creditLabel.TextSize = 14
creditLabel.TextXAlignment = Enum.TextXAlignment.Center

NotifyModule:Notify("Script Redited By Unmcon ", 5)
NotifyModule:Notify("Gui Made By Ice", 5)
NotifyModule:Notify("Animations Are FE but Sounds Are Not", 5)
wait(1)
NotifyModule:Notify("To make hands fe use sukan emote then stopanims then play a deleted emote", 5)
