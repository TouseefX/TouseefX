-- use sukan emote and stopanims to make the hands fe and play deleted emotes
local player = game.Players.LocalPlayer
local playerGui = player.PlayerGui
local Debris = game:GetService("Debris")
local EmoteFrame = game:GetService("Players").LocalPlayer.PlayerGui.TemporaryUI.EmoteMenuHolder.RadialMenu.Attach["6"]
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
-- if you read this the Miss and Sub Lyics are made using AI (Gemini, Not ChatGPT because he is useless on this) 
-- because its hard to match the timing of these the lyics so that why i used AI
local function MissLyrics()
    wait(31) -- this is the only human wait time
    NotifyModule:Notify("Would you dare look over your shoulder?", 4.001)
    task.wait(4.089)
    NotifyModule:Notify("Do you fear what's coming round the bend", 3.903)
    task.wait(4.093)
    NotifyModule:Notify("Do you know what happens while you're growing older?", 4.016)
    task.wait(4.094)
    NotifyModule:Notify("Would you ever turn your back again?", 3.902)
    task.wait(1.902)
    NotifyModule:Notify("Does it stop your heart?", 1.908)
    task.wait(2.087)
    NotifyModule:Notify("Does your hair turn gray?", 1.912)
    task.wait(4.093)
    NotifyModule:Notify("Don't let me tell you now, it's gonna be o-kay, baby", 3.903)
    task.wait(3.916)
    NotifyModule:Notify("I Miss The Quiet", 3.92)
    task.wait(4.003)
    NotifyModule:Notify("I can't deny it", 3.913)
    task.wait(4.002)
    NotifyModule:Notify("Am I to fight it?", 3.902)
    task.wait(3.916)
    NotifyModule:Notify("Even after all is said and done, I only wanna stay", 3.925)
    task.wait(3.902)
    NotifyModule:Notify("The endless void couldn't fathom", 3.903)
    task.wait(3.903)
    NotifyModule:Notify("The fate I've wished upon a star", 3.903)
    task.wait(3.985)
    NotifyModule:Notify("In your vessel is also very undercoming", 3.916)
    task.wait(3.916)
    NotifyModule:Notify("I'll turn you All, INTO A MARTYR", 3.918)
    task.wait(3.902)
    NotifyModule:Notify("When you're brought to your knees, and there's Nowhere to Run", 3.902)
    task.wait(3.902)
    NotifyModule:Notify("Just let me tell you, baby, here it comes now", 3.916)
    task.wait(3.916)
    NotifyModule:Notify("I Miss The Quiet", 3.903)
    task.wait(3.903)
    NotifyModule:Notify("I can't deny it", 3.902)
    task.wait(3.902)
    NotifyModule:Notify("Am I to Fight it?", 3.902)
    task.wait(3.902)
    NotifyModule:Notify("OR BE DELIGHTEEEEEED?", 3.943)
    task.wait(3.977)
    NotifyModule:Notify("I Miss The Quiet, Yes I Do", 3.903)
    task.wait(3.903)
    NotifyModule:Notify("I CAN'T DENY IT, I KNOW IT'S TRUE, OH BABY", 3.902)
    task.wait(3.902)
    NotifyModule:Notify("I MISS THE QUIEEET", 4.049)
    task.wait(4.049)
    NotifyModule:Notify("Even after all is said and done, we've only just begun", 4.049)
    task.wait(32.433) -- the longest wait
    NotifyModule:Notify("I MISS THE QUIEEET (NOOOOOO!)", 4.504)
    task.wait(6.999)
    NotifyModule:Notify("I can't DENY IT (NOOOOOO!)", 4.090)
    task.wait(3.896)
    NotifyModule:Notify("AM I TO FIGHT IT? (NOOOOOO!)", 3.849)
    task.wait(3.854)
    NotifyModule:Notify("OR BE DELIGHTEEEEEED? (NOOOOOO!)", 4.116)
    task.wait(4.116)
    NotifyModule:Notify("I MISS THE QUIEEET (NOOOOOO!)", 4.117)
    task.wait(4.117)
    NotifyModule:Notify("I CAN'T DENY IT (NOOOOOO!)", 3.555)
    task.wait(3.555)
    NotifyModule:Notify("AM I TO FIGHT IT? (NOOOOOO!)", 3.889)
    task.wait(3.889)
    NotifyModule:Notify("OR BE DELIGHTEEEEEED? (NOOOOOO!)", 2.068)
    task.wait(1.938)
    NotifyModule:Notify("I MISS THE QUIET (NOOOOOO!)", 1.572)
    task.wait(2.179)
    NotifyModule:Notify("Yes I do", 1.817)
    task.wait(1.886)
    NotifyModule:Notify("I CAN'T DENY IT (NOOOOOO!)", 1.765)
    task.wait(2.143)
    NotifyModule:Notify("YOU KNOW IT'S TRUE, OH BABY", 2.125)
    task.wait(2.125)
    NotifyModule:Notify("I MISS THE QUIEEET LITTLE (NOOOOOO!)", 1.898)
    task.wait(2.002)
    NotifyModule:Notify("THINGS I'D DO BEFORE I", 4.116)
    task.wait(4.116)
    NotifyModule:Notify("ENTERED ALL THE VIOLEEEENCE, DEFINING SILVER LINING", 4.397)
    task.wait(3.606)
    NotifyModule:Notify("I MISS THE QUIEEEEEEEEET (NOOOOOO!)", 3.194)
    task.wait(3.076)
    NotifyModule:Notify("YOU CAN'T DENY IT,  YOU KNOW IT'S TRUE, OH BABY (NOOOOOO!)", 4.076)
    task.wait(4.076)
    NotifyModule:Notify("I MISS THE QUIEEET (NOOOOOO!)", 4.077)
    task.wait(6.001)
    NotifyModule:Notify("Even after all is said and done, I'm only having fun", 2.353)
    task.wait(2.353)
    NotifyModule:Notify("I'm only having fun (No No No No)", 2.004)
    task.wait(2.420)
    NotifyModule:Notify("I'm only having fun (No No No No)", 1.39)
    task.wait(2.420)
    NotifyModule:Notify("I'm only having fun (No No No No)", 1.417)
    task.wait(2.417)
    NotifyModule:Notify("I'm only having", 1.417)
    task.wait(2.417)
    NotifyModule:Notify("FUNNN", 1.417)
end

local function StopAnimation()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    local animator = humanoid:FindFirstChildOfClass("Animator") or humanoid:WaitForChild("Animator")
    -- Unfreeze And Stop Head Following
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
    -- if used sukan emote (people will see the hands but you cant)
    local THand = character:FindFirstChild("PlayerEmoteHand")
    if THand then
        THand:Destroy()
    end
    
    local THand2 = character:FindFirstChild("PlayerEmoteHand")
    if THand2 then
        THand2:Destroy()
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
    -- if the sound trys to espace (this happens to me a lot)
    local Youcanrunbutyoucanthide = character.HumanoidRootPart:FindFirstChild("Sound")
    if Youcanrunbutyoucanthide then
        Youcanrunbutyoucanthide:Stop()
        Youcanrunbutyoucanthide:Destroy()
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

local function RemoveEmoteButton()
    local EmoteButton = EmoteFrame:FindFirstChild("TextButton")
    if EmoteButton then
        EmoteButton:Destroy()
   end
end

-- this is for emotes function scripts
local function Subterfuge()
    RemoveEmoteButton()
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
    Debris:AddItem(character:FindFirstChild("PlayerEmoteHand"), 80)
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

local function SillyBilly()
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
    sound.SoundId = "rbxassetid://77601084987544"
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
    Debris:AddItem(character:FindFirstChild("SillyBillyMicrophone"), 44)
    -- unfreeze because something happend
    animationTrack.Stopped:Connect(function()
        stopFollowingHead()
        humanoid.PlatformStand = false
        if bodyVelocity and bodyVelocity.Parent then
            bodyVelocity:Destroy()
        end
    end)
end

local function Sillyofit()
    RemoveEmoteButton()
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
    sound.SoundId = "rbxassetid://120176009143091"
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
    Debris:AddItem(character:FindFirstChild("SillyBillyMicrophone"), 44)
    -- unfreeze because something happend
    animationTrack.Stopped:Connect(function()
        stopFollowingHead()
        humanoid.PlatformStand = false
        if bodyVelocity and bodyVelocity.Parent then
            bodyVelocity:Destroy()
        end
    end)
end

local Sillys = {
  SillyBilly,
  Sillyofit,
  -- thick of it its good
}

local function SillyOfBilly()
  local randomIndex = math.random(1, #Sillys)
  local randomFunction = Sillys[randomIndex]
  randomFunction()
end

local function MissQuiet()
    RemoveEmoteButton()
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
    animationTrack.Looped = false
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
    Debris:AddItem(character:FindFirstChild("PlayerEmoteHand"), 240)
    Debris:AddItem(character:FindFirstChild("EmoteHatAsset"), 240) -- lighting is in the hat now
    -- unfreeze because something happend.
    MissLyrics()
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

local function NewTick()
    RemoveEmoteButton()
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
    Debris:AddItem(character:FindFirstChild("PlayerEmoteHand"), 999)
end

local function OldTick()
    RemoveEmoteButton()
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
    sound.SoundId = "rbxassetid://79383274437776"
    sound.Parent = character:WaitForChild("HumanoidRootPart")
    sound.Volume = 1
    sound.Looped = true
    sound.RollOffMode = Enum.RollOffMode.Linear
    sound.MaxDistance = 50
    sound:Play()
    startFollowingHead()
    Debris:AddItem(character:FindFirstChild("PlayerEmoteHand"), 999)
end

local ticks = {
  NewTick,
  OldTick,
  -- I Miss The Old, Wait isn't this The White Hat Guy Line
}

local function Tick()
  local randomIndex = math.random(1, #ticks)
  local randomFunction = ticks[randomIndex]
  randomFunction()
end

local function Pick()
    RemoveEmoteButton()
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.PlatformStand = true
    humanoid:Move(Vector3.zero)

    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
    bodyVelocity.Velocity = Vector3.zero
    bodyVelocity.Parent = character:WaitForChild("HumanoidRootPart")
    -- if emote script is gone and deleted so we use SillyBilly in case
    local emoteScript = game:GetService("ReplicatedStorage").Assets.Emotes:FindFirstChild("ThePhone")
    if emoteScript then
        local emoteScript = require(game:GetService("ReplicatedStorage").Assets.Emotes.ThePhone) 
        emoteScript.Created({Character = character})
    else
        local emoteScript = require(game:GetService("ReplicatedStorage").Assets.Emotes._SillyBilly)
        emoteScript.Created({Character = character})
    end
    
    local animation = Instance.new("Animation")
    animation.AnimationId = "rbxassetid://112887456905366"
    local animationTrack = humanoid:LoadAnimation(animation)
    animationTrack.Looped = false
    animationTrack:Play()

    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://107281579144976"
    sound.Parent = character:WaitForChild("HumanoidRootPart")
    sound.Volume = 1
    sound.Looped = false
    sound.RollOffMode = Enum.RollOffMode.Linear
    sound.MaxDistance = 50
    sound:Play()
    
    local args = {
        [1] = "PlayEmote",
        [2] = "Animations",
        [3] = "ThePhone"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
    
    Debris:AddItem(character:FindFirstChild("Phone"), 240)
    startFollowingHead()
    
    local SillyMic = character:FindFirstChild("SillyBillyMicrophone")
    if SillyMic then
       SillyMic:Destroy()
    end
    
    animationTrack.Stopped:Connect(function()
        stopFollowingHead()
         local Phone = character:FindFirstChild("Phone")
         if Phone then
            Phone:Destroy()
        end
        humanoid.PlatformStand = false
        if bodyVelocity and bodyVelocity.Parent then
            bodyVelocity:Destroy()
        end
    end)
end
-- emotes script functions stops here
local function onCharacterAdded(character)
    wait(0.1)
end

player.CharacterAdded:Connect(onCharacterAdded)

if player.Character then
    onCharacterAdded(player.Character)
end

local function createButton(ButtonName, parent, text, position, color, onClick)
    local button = Instance.new("TextButton")
    button.Name = ButtonName
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

local function createEmoteButton(onClick)
    local EmoteFrame = game:GetService("Players").LocalPlayer.PlayerGui.TemporaryUI.EmoteMenuHolder.RadialMenu.Attach["6"]
    local button = Instance.new("TextButton", EmoteFrame)
    button.Size = UDim2.new(0.705655515, 1, 0.705655217, 1)
    button.Position = UDim2.new(0.153545171, 0, 0.356493711, 0)
    button.Text = ""
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = Color3.new(1, 1, 1)
    button.BackgroundTransparency = 1 -- Set transparency to 1 (fully transparent)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 16

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 5)
    buttonCorner.Parent = button

    button.MouseButton1Down:Connect(onClick)

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
    mainFrame:Destroy()
    screenGui:Destroy()
end)

-- Create Buttons
createButton("Subterfuge", mainFrame, "Subterfuge", UDim2.new(0.1, 0, 0.1, 0), Color3.fromRGB(30, 60, 90), function()
    Subterfuge()
end)

createButton("MissTheQuiet", mainFrame, "Miss The Quiet", UDim2.new(0.1, 0, 0.24, 0), Color3.fromRGB(0, 0, 255), function()
    MissQuiet()
end)

createButton("SillyBilly", mainFrame, "Silly Billy", UDim2.new(0.1, 0, 0.38, 0), Color3.fromRGB(255, 105, 180), function()
    SillyOfBilly()
end)

createButton("TickTock", mainFrame, "Tick Tock", UDim2.new(0.1, 0, 0.52, 0), Color3.fromRGB(255, 105, 180), function()
    Tick()
end)

createButton("PickThePhone", mainFrame, "Pick Up The Phone", UDim2.new(0.1, 0, 0.66, 0), Color3.fromRGB(255, 105, 180), function()
    Pick()
end)
-- Last Button
createButton("StopEmote", mainFrame, "Stop Emote", UDim2.new(0.1, 0, 0.80, 0), Color3.fromRGB(255, 50, 50), function()
    StopAnimation()
end)

-- make a emote button in the emote tab (forsaken emote tab not this one)
-- re-execute script if this does not work
updateEmotes("_SillyBilly")

local EmoteFrame = game:GetService("Players").LocalPlayer.PlayerGui.TemporaryUI.EmoteMenuHolder.RadialMenu.Attach["6"]
local PlayerGui = game:GetService("Players").LocalPlayer.PlayerGui

local SillyBillyButton = Instance.new("TextButton", EmoteFrame)
SillyBillyButton.Size = UDim2.new(0.705655515, 1, 0.705655217, 1) -- Set the desired size
SillyBillyButton.Position = UDim2.new(0.153545171, 0, 0.356493711, 0) -- Set the desired position
SillyBillyButton.Text = ""
SillyBillyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SillyBillyButton.BackgroundColor3 = Color3.new(1, 1, 1) -- set to white for transparency to work correctly.
SillyBillyButton.BackgroundTransparency = 1 -- Set transparency to 1 (fully transparent)
SillyBillyButton.Font = Enum.Font.GothamBold
SillyBillyButton.TextSize = 16

local SillyCorner = Instance.new("UICorner")
SillyCorner.CornerRadius = UDim.new(0, 5)
SillyCorner.Parent = SillyBillyButton

SillyBillyButton.MouseButton1Down:Connect(function()
    SillyOfBilly()
end)

-- Restored "Made by: Ice" Label
local creditLabel = Instance.new("TextLabel", mainFrame)
creditLabel.Size = UDim2.new(0.8, 0, 0.08, 0)
creditLabel.Position = UDim2.new(0.1, 0, 0.92, 0)
creditLabel.Text = "Forsaken Emotes"
creditLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
creditLabel.BackgroundTransparency = 1
creditLabel.Font = Enum.Font.GothamBold
creditLabel.TextSize = 14
creditLabel.TextXAlignment = Enum.TextXAlignment.Center

NotifyModule:Notify("Script Redited By Unmcon ", 5)
NotifyModule:Notify("Gui Made By Ice", 5)
NotifyModule:Notify("Animations Are FE but Sounds Are Not", 5)
wait(4)
NotifyModule:Notify("To make hands fe use sukan emote then stopanims then play a deleted emote", 5)
