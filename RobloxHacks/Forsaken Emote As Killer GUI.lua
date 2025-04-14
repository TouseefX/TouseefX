--emote settings 
local Solt1 = "StockDance"
local Solt2 = "Brickbattler"
local Solt3 = "Drumsticks"
local Solt4 = "CaliforniaGirls"
local Solt5 = "Hotdog"
local Solt6 = "Wave"

local function PlayEmote(Emote)
    local args = {
        [1] = "PlayEmote";
        [2] = "Animations";
        [3] = Emote;
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Modules", 9e9):WaitForChild("Network", 9e9):WaitForChild("RemoteEvent", 9e9):FireServer(unpack(args))
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
closeButton.Name = "Close"
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
createButton("1", mainFrame, "1", UDim2.new(0.1, 0, 0.1, 0), Color3.fromRGB(30, 60, 90), function()
    PlayEmote(Solt1)
end)

createButton("2", mainFrame, "2", UDim2.new(0.1, 0, 0.24, 0), Color3.fromRGB(0, 0, 255), function()
    PlayEmote(Solt2)
end)

createButton("3", mainFrame, "3", UDim2.new(0.1, 0, 0.38, 0), Color3.fromRGB(255, 105, 180), function()
    PlayEmote(Solt3)
end)

createButton("4", mainFrame, "4", UDim2.new(0.1, 0, 0.52, 0), Color3.fromRGB(255, 105, 180), function()
    PlayEmote(Solt4)
end)

createButton("5", mainFrame, "5", UDim2.new(0.1, 0, 0.66, 0), Color3.fromRGB(255, 105, 180), function()
    PlayEmote(Solt5)
end)
-- Last Button
createButton("6", mainFrame, "6", UDim2.new(0.1, 0, 0.80, 0), Color3.fromRGB(255, 50, 50), function()
    PlayEmote(Solt6)
end)

-- Restored "Made by: Ice" Label
local creditLabel = Instance.new("TextLabel", mainFrame)
creditLabel.Size = UDim2.new(0.8, 0, 0.08, 0)
creditLabel.Position = UDim2.new(0.1, 0, 0.92, 0)
creditLabel.Text = "Emote As Killer"
creditLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
creditLabel.BackgroundTransparency = 1
creditLabel.Font = Enum.Font.GothamBold
creditLabel.TextSize = 14
creditLabel.TextXAlignment = Enum.TextXAlignment.Center

NotifyModule:Notify("Gui Made By Ice", 5)