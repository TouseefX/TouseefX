-- URL Verison loadstring(game:HttpGet("https://raw.githubusercontent.com/TouseefX/TouseefX/main/RobloxHacks/robloxhubnew.lua"))()
local Instances = {
	Main = Instance.new("ScreenGui"),
	Drag = Instance.new("Frame"),
	MainGUI = Instance.new("Frame"),
	Nameless = Instance.new("TextButton"),
	ChatBypass = Instance.new("TextButton"),
	MoreUNC = Instance.new("TextButton"),
	FeSound = Instance.new("TextButton"),
	Title = Instance.new("TextLabel"),
	RC7 = Instance.new("TextButton"),
	Add_Require = Instance.new("TextButton"),
	CoolKid = Instance.new("TextButton"),
	ScriptsSS = Instance.new("TextLabel"),
	MairoExe = Instance.new("TextButton"),
	SSPLeak = Instance.new("TextButton"),
	H0lpgui = Instance.new("TextButton"),
	ServerAdmin = Instance.new("TextButton"),
	FeBypass = Instance.new("TextButton"),
}

Instances.Main.Name = "Main"
Instances.Main.Parent = game.Players.LocalPlayer.PlayerGui
-- change it to game.CoreGui if you don't want resetonspawn

Instances.Drag.Name = "Drag"
Instances.Drag.Parent = Instances.Main
Instances.Drag.Size = UDim2.new(0, 492, 0, 16)
Instances.Drag.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.Drag.Position = UDim2.new(0.300727606, 0, 0.282747597, 0)
Instances.Drag.BorderSizePixel = 0
Instances.Drag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

Instances.MainGUI.Name = "MainGUI"
Instances.MainGUI.Parent = Instances.Drag
Instances.MainGUI.Size = UDim2.new(0, 492, 0, 271)
Instances.MainGUI.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.MainGUI.Position = UDim2.new(-8.54740283e-05, 0, 0.970247269, 0)
Instances.MainGUI.BorderSizePixel = 0
Instances.MainGUI.BackgroundColor3 = Color3.fromRGB(170, 0, 0)

Instances.Nameless.Name = "Nameless"
Instances.Nameless.Parent = Instances.MainGUI
Instances.Nameless.Size = UDim2.new(0, 162, 0, 23)
Instances.Nameless.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.Nameless.Position = UDim2.new(0.024390243, 0, 0.151291519, 0)
Instances.Nameless.BorderSizePixel = 0
Instances.Nameless.BackgroundColor3 = Color3.fromRGB(170, 85, 1)
Instances.Nameless.TextColor3 = Color3.fromRGB(0, 0, 0)
Instances.Nameless.Text = "FeBypass Nameless Admin"
Instances.Nameless.TextSize = 14
Instances.Nameless.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
Instances.Nameless.MouseButton1Down:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/FD2Team/Nameless-Admin-No-Byfron-Kick/main/Source",true))()
end)

Instances.ChatBypass.Name = "ChatBypass (WITHOUT ANTI CHAT LOGGING)"
Instances.ChatBypass.Parent = Instances.MainGUI
Instances.ChatBypass.Size = UDim2.new(0, 151, 0, 23)
Instances.ChatBypass.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.ChatBypass.Position = UDim2.new(0.390243888, 0, 0.151291519, 0)
Instances.ChatBypass.BorderSizePixel = 0
Instances.ChatBypass.BackgroundColor3 = Color3.fromRGB(170, 85, 0)
Instances.ChatBypass.TextColor3 = Color3.fromRGB(0, 0, 0)
Instances.ChatBypass.Text = "Fe ChatBypass(WAS NO ANTI LOGGING)"
Instances.ChatBypass.TextSize = 14
Instances.ChatBypass.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
Instances.ChatBypass.MouseButton1Down:Connect(function()
	loadstring(game:HttpGet("https://github.com/MrSuno/Filtering-Disabled/blob/main/main.lua?raw=true"))()
end)

Instances.MoreUNC.Name = "MoreUNC"
Instances.MoreUNC.Parent = Instances.MainGUI
Instances.MoreUNC.Size = UDim2.new(0, 141, 0, 23)
Instances.MoreUNC.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.MoreUNC.Position = UDim2.new(0.713414609, 0, 0.151291519, 0)
Instances.MoreUNC.BorderSizePixel = 0
Instances.MoreUNC.BackgroundColor3 = Color3.fromRGB(170, 85, 1)
Instances.MoreUNC.TextColor3 = Color3.fromRGB(0, 0, 0)
Instances.MoreUNC.Text = "MoreUNC"
Instances.MoreUNC.TextSize = 14
Instances.MoreUNC.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
Instances.MoreUNC.MouseButton1Down:Connect(function()
	loadstring(game:HttpGet('https://pastebin.com/raw/JPw0jeLZ'))()
end)

Instances.FeSound.Name = "FeSound"
Instances.FeSound.Parent = Instances.MainGUI
Instances.FeSound.Size = UDim2.new(0, 162, 0, 23)
Instances.FeSound.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.FeSound.Position = UDim2.new(0.024390243, 0, 0.33948338, 0)
Instances.FeSound.BorderSizePixel = 0
Instances.FeSound.BackgroundColor3 = Color3.fromRGB(170, 85, 1)
Instances.FeSound.TextColor3 = Color3.fromRGB(0, 0, 0)
Instances.FeSound.Text = "Fe Sound Annoying"
Instances.FeSound.TextSize = 14
Instances.FeSound.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
Instances.FeSound.MouseButton1Down:Connect(function()
	loadstring(game:HttpGet(('https://pastebin.com/raw/egMM7sEC'),true))()
end)

Instances.Title.Name = "Title"
Instances.Title.Parent = Instances.MainGUI
Instances.Title.Size = UDim2.new(0, 492, 0, 16)
Instances.Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.Title.Position = UDim2.new(0, 0, -0.0590405911, 0)
Instances.Title.BorderSizePixel = 0
Instances.Title.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Instances.Title.TextColor3 = Color3.fromRGB(0, 0, 0)
Instances.Title.Text = "Touseef's Powerful ScriptHub"
Instances.Title.TextSize = 14
Instances.Title.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)

Instances.RC7.Name = "RC7"
Instances.RC7.Parent = Instances.MainGUI
Instances.RC7.Size = UDim2.new(0, 151, 0, 23)
Instances.RC7.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.RC7.Position = UDim2.new(0.390243888, 0, 0.33948338, 0)
Instances.RC7.BorderSizePixel = 0
Instances.RC7.BackgroundColor3 = Color3.fromRGB(170, 85, 0)
Instances.RC7.TextColor3 = Color3.fromRGB(0, 0, 0)
Instances.RC7.Text = "RC7 Fe Bypass"
Instances.RC7.TextSize = 14
Instances.RC7.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
Instances.RC7.MouseButton1Down:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/CoreGui/Scripts/main/RC7"))()
end)

Instances.Add_Require.Name = "Add Require"
Instances.Add_Require.Parent = Instances.MainGUI
Instances.Add_Require.Size = UDim2.new(0, 141, 0, 23)
Instances.Add_Require.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.Add_Require.Position = UDim2.new(0.713414609, 0, 0.33948338, 0)
Instances.Add_Require.BorderSizePixel = 0
Instances.Add_Require.BackgroundColor3 = Color3.fromRGB(170, 85, 1)
Instances.Add_Require.TextColor3 = Color3.fromRGB(0, 0, 0)
Instances.Add_Require.Text = "Add Require Function"
Instances.Add_Require.TextSize = 14
Instances.Add_Require.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
Instances.Add_Require.MouseButton1Down:Connect(function()
	getgenv().require = function(scr) if typeof(scr) ~= 'Instance' or scr.ClassName ~= 'ModuleScript' then error'attempt to require a non-ModuleScript' end if CheckRL(scr) then error'attempt to require a core ModuleScript' end local oIdentity = syn.get_thread_identity() syn.set_thread_identity(2) local g, res = pcall(Req, scr) syn.set_thread_identity(oIdentity) if not g then error(res) end return res end
end)

Instances.CoolKid.Name = "CoolKid"
Instances.CoolKid.Parent = Instances.MainGUI
Instances.CoolKid.Size = UDim2.new(0, 141, 0, 23)
Instances.CoolKid.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.CoolKid.Position = UDim2.new(0.0447154455, 0, 0.671586692, 0)
Instances.CoolKid.BorderSizePixel = 0
Instances.CoolKid.BackgroundColor3 = Color3.fromRGB(170, 85, 1)
Instances.CoolKid.TextColor3 = Color3.fromRGB(0, 0, 0)
Instances.CoolKid.Text = "C00lkidd GUI FE"
Instances.CoolKid.TextSize = 14
Instances.CoolKid.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
Instances.CoolKid.MouseButton1Down:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/C00lHamoot/c00lgui-1/36410b4f949d3a10e8b39fc7cdcc8cfb67aefe25/c00l%20gui"))()
end)

Instances.ScriptsSS.Name = "ScriptsSS"
Instances.ScriptsSS.Parent = Instances.MainGUI
Instances.ScriptsSS.Size = UDim2.new(0, 491, 0, 16)
Instances.ScriptsSS.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.ScriptsSS.Position = UDim2.new(8.54120008e-05, 0, 0.542435408, 0)
Instances.ScriptsSS.BorderSizePixel = 0
Instances.ScriptsSS.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Instances.ScriptsSS.TextColor3 = Color3.fromRGB(0, 0, 0)
Instances.ScriptsSS.Text = "Scripts By C00lkid (execute Fe Bypass And Make Sure is Working By Seeing Logs that get started)"
Instances.ScriptsSS.TextSize = 14
Instances.ScriptsSS.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)

Instances.MairoExe.Name = "MairoExe"
Instances.MairoExe.Parent = Instances.MainGUI
Instances.MairoExe.Size = UDim2.new(0, 141, 0, 23)
Instances.MairoExe.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.MairoExe.Position = UDim2.new(0.380081296, 0, 0.671586692, 0)
Instances.MairoExe.BorderSizePixel = 0
Instances.MairoExe.BackgroundColor3 = Color3.fromRGB(170, 85, 1)
Instances.MairoExe.TextColor3 = Color3.fromRGB(0, 0, 0)
Instances.MairoExe.Text = "MarioExe SS Fe Bypass Exec"
Instances.MairoExe.TextSize = 14
Instances.MairoExe.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
Instances.MairoExe.MouseButton1Down:Connect(function()
	loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Mario-exe-premium-9389"))()
end)

Instances.SSPLeak.Name = "SSPLeak"
Instances.SSPLeak.Parent = Instances.MainGUI
Instances.SSPLeak.Size = UDim2.new(0, 141, 0, 23)
Instances.SSPLeak.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.SSPLeak.Position = UDim2.new(0.713414609, 0, 0.671586692, 0)
Instances.SSPLeak.BorderSizePixel = 0
Instances.SSPLeak.BackgroundColor3 = Color3.fromRGB(170, 85, 1)
Instances.SSPLeak.TextColor3 = Color3.fromRGB(0, 0, 0)
Instances.SSPLeak.Text = "Secret Service panel Leaked"
Instances.SSPLeak.TextSize = 14
Instances.SSPLeak.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
Instances.SSPLeak.MouseButton1Down:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/MagnumIceCream/SecretServicePanel/6fefdf531e86404fb41b7812e7e84b69c7ea728f/ShakesSSP"))()
end)

Instances.H0lpgui.Name = "H0lpgui"
Instances.H0lpgui.Parent = Instances.MainGUI
Instances.H0lpgui.Size = UDim2.new(0, 141, 0, 23)
Instances.H0lpgui.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.H0lpgui.Position = UDim2.new(0.0447154455, 0, 0.833948314, 0)
Instances.H0lpgui.BorderSizePixel = 0
Instances.H0lpgui.BackgroundColor3 = Color3.fromRGB(170, 85, 1)
Instances.H0lpgui.TextColor3 = Color3.fromRGB(0, 0, 0)
Instances.H0lpgui.Text = "H0lpgui"
Instances.H0lpgui.TextSize = 14
Instances.H0lpgui.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
Instances.H0lpgui.MouseButton1Down:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/C00lHamoot/H0lpgui/main/H0lpgui%20by%20me"))()
end)

Instances.ServerAdmin.Name = "ServerAdmin"
Instances.ServerAdmin.Parent = Instances.MainGUI
Instances.ServerAdmin.Size = UDim2.new(0, 141, 0, 23)
Instances.ServerAdmin.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.ServerAdmin.Position = UDim2.new(0.380081296, 0, 0.833948314, 0)
Instances.ServerAdmin.BorderSizePixel = 0
Instances.ServerAdmin.BackgroundColor3 = Color3.fromRGB(170, 85, 1)
Instances.ServerAdmin.TextColor3 = Color3.fromRGB(0, 0, 0)
Instances.ServerAdmin.Text = "ServerAdmin"
Instances.ServerAdmin.TextSize = 14
Instances.ServerAdmin.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
Instances.ServerAdmin.MouseButton1Down:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ONEReverseCard/My-Scripts/main/Netless%20Server%20Admin.md"))()
end)

Instances.FeBypass.Name = "FeBypass"
Instances.FeBypass.Parent = Instances.MainGUI
Instances.FeBypass.Size = UDim2.new(0, 141, 0, 23)
Instances.FeBypass.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.FeBypass.Position = UDim2.new(0.713414609, 0, 0.833948314, 0)
Instances.FeBypass.BorderSizePixel = 0
Instances.FeBypass.BackgroundColor3 = Color3.fromRGB(170, 85, 1)
Instances.FeBypass.TextColor3 = Color3.fromRGB(0, 0, 0)
Instances.FeBypass.Text = "Execute FeBypass"
Instances.FeBypass.TextSize = 14
Instances.FeBypass.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
Instances.FeBypass.MouseButton1Down:Connect(function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/FreeRobloxScripts1/Haxker_6666666-Hub/main/loader'))()
end)

local UserInputService = game:GetService("UserInputService")

local gui = Instances.Drag

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
