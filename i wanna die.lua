-- Fisch Script Customization by Dash

local LocalPlayer = game.Players.LocalPlayer
-- Ensure that a ScreenGui is being created and attached to PlayerGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DashFishingUI"
screenGui.Parent = game.Players.LocalPlayer.PlayerGui
screenGui.ResetOnSpawn = false

-- Create Main Frame with rounded corners and transparent background
local mainFrame = Instance.new("Frame")
mainFrame.Parent = screenGui
mainFrame.Size = UDim2.new(0.4, 0, 0.6, 0)
mainFrame.Position = UDim2.new(0.3, 0, 0.2, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BackgroundTransparency = 0.7
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.BorderRadius = UDim.new(0, 12)

-- Title Label
local titleLabel = Instance.new("TextLabel")
titleLabel.Parent = mainFrame
titleLabel.Size = UDim2.new(1, 0, 0.1, 0)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.Text = "Dash Fishing"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 22
titleLabel.Font = Enum.Font.GothamBold
titleLabel.BackgroundTransparency = 1
titleLabel.TextStrokeTransparency = 0.5
titleLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

-- Minimize Button
local minimizeButton = Instance.new("TextButton")
minimizeButton.Parent = titleLabel
minimizeButton.Size = UDim2.new(0.1, 0, 1, 0)
minimizeButton.Position = UDim2.new(1, -30, 0, 0)
minimizeButton.Text = "-"
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
minimizeButton.Font = Enum.Font.Gotham
minimizeButton.TextSize = 18
minimizeButton.BorderSizePixel = 0
minimizeButton.BorderRadius = UDim.new(0, 8)

local isMinimized = false
minimizeButton.MouseButton1Click:Connect(function()
    if isMinimized then
        mainFrame.Visible = true
        isMinimized = false
    else
        mainFrame.Visible = false
        isMinimized = true
    end
end)

-- Add basic draggable functionality
local dragging = false
local dragStartPos = Vector2.new()

titleLabel.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStartPos = input.Position - mainFrame.Position
    end
end)

titleLabel.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        mainFrame.Position = UDim2.new(0, input.Position.X - dragStartPos.X, 0, input.Position.Y - dragStartPos.Y)
    end
end)

titleLabel.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- Make sure everything is visible
screenGui.Enabled = true
mainFrame.Visible = true

-- Table of teleportation locations
local teleportLocations = {
    ["Sunstone Island"] = CFrame.new(-913.6306, 137.2935, -1129.8995),
    ["Roslit Bay"] = CFrame.new(-1501.6755, 133, 416.207),
    ["Random Islands"] = CFrame.new(237.6945, 139.3498, 43.1034),
    ["Moosewood"] = CFrame.new(433.7972, 147.0700, 261.8022),
    ["Executive Headquarters"] = CFrame.new(-36.4620, -246.5500, 205.7712),
    ["Enchant Room"] = CFrame.new(1310.0481, -805.2922, -162.3451),
    ["Statue of Sovereignty"] = CFrame.new(22.0987, 159.0147, -1039.8544),
    ["Mushgrove Swamp"] = CFrame.new(2442.8059, 130.9041, -686.1649),
    ["Snowcap Island"] = CFrame.new(2589.5349, 134.9249, 2333.0994),
    ["Terrapin Island"] = CFrame.new(152.3716, 154.9102, 2000.9171),
    ["Enchant Relic"] = CFrame.new(1309.2784, -802.4270, -83.3640),
    ["Best Spot"] = CFrame.new(1447.8507, 131.5000, -7649.6450),
}

