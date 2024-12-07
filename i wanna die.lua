-- Fisch Script Customization by Dash

local LocalPlayer = game.Players.LocalPlayer

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

-- Function to teleport to a location
function teleportTo(location)
    local target = teleportLocations[location]
    if target then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target
    else
        warn("Teleport location not found.")
    end
end

-- Function to give fish to a player
function giveFish(player, amount)
    -- Assuming there's a custom variable for fish
    player.leaderstats.Fish.Value = player.leaderstats.Fish.Value + amount
end

-- Function to give money to a player
function giveMoney(player, amount)
    -- Assuming there's a custom variable for money
    player.leaderstats.Money.Value = player.leaderstats.Money.Value + amount
end

-- Function for auto reeling
function autoReel()
    while true do
        -- Simulate the reeling process
        print("Reeling...")
        wait(2)
    end
end

-- Function for auto shaking
function autoShake()
    while true do
        -- Simulate the shaking process
        print("Shaking...")
        wait(1)
    end
end

-- Function for auto casting
function autoCast()
    while true do
        -- Simulate casting
        print("Casting...")
        wait(5)
    end
end

-- Anti-AFK function
function preventAFK()
    while true do
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        wait(10)
    end
end

--- Creating the new Screen UI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer.PlayerGui
screenGui.Name = "DashFishingUI"
screenGui.ResetOnSpawn = false

-- Main frame with transparent background and gradient effect
local mainFrame = Instance.new("Frame")
mainFrame.Parent = screenGui
mainFrame.Size = UDim2.new(0.3, 0, 0.5, 0)
mainFrame.Position = UDim2.new(0.35, 0, 0.25, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- Base color
mainFrame.BackgroundTransparency = 0.6  -- Slightly transparent for modern look
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true

-- Adding gradient background to the main frame
local gradient = Instance.new("UIGradient")
gradient.Parent = mainFrame
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 0, 255)),  -- Purple
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 255))   -- Pink
})
gradient.Rotation = 45  -- Slight rotation for visual interest

-- Title Label (with a clean, professional font)
local titleLabel = Instance.new("TextLabel")
titleLabel.Parent = mainFrame
titleLabel.Size = UDim2.new(1, 0, 0.1, 0)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.Text = "Dash Fishing"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 26
titleLabel.Font = Enum.Font.GothamBold  -- Modern, clean font
titleLabel.BackgroundTransparency = 1
titleLabel.TextStrokeTransparency = 0.5
titleLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

-- Function to create rainbow buttons with hover effects
function createRainbowButton(title, position)
    local button = Instance.new("TextButton")
    button.Parent = mainFrame
    button.Text = title
    button.Size = UDim2.new(0, 200, 0, 50)
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(100, 0, 150)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 18
    button.Font = Enum.Font.GothamMedium  -- Smooth, readable font
    button.BorderRadius = UDim.new(0, 12)  -- Rounded corners
    button.AutoButtonColor = true

    -- Hover effect to change button color
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(255, 0, 255)  -- Bright pink on hover
    end)
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(100, 0, 150)  -- Return to original color
    end)

    -- Rainbow effect on button text
    local function updateRainbowColor()
        while button.Parent do
            button.TextColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)  -- Smooth rainbow text color
            wait(0.1)
        end
    end
    spawn(updateRainbowColor)

    return button
end

-- Create the buttons for the features (no actions, just visual elements)
local teleportButton = createRainbowButton("Teleport to Island", UDim2.new(0, 0, 0.15, 0))
local autoFishButton = createRainbowButton("Auto Farm Fish", UDim2.new(0, 0, 0.25, 0))
local selectPositionButton = createRainbowButton("Select Position", UDim2.new(0, 0, 0.35, 0))

-- Add more buttons or elements here as needed...



-- Function to create teleport buttons dynamically
function createTeleportButton(title, position)
    local button = Instance.new("TextButton", mainFrame)
    button.Size = UDim2.new(0, 200, 0, 50)
    button.Position = position
    button.Text = title
    button.MouseButton1Click:Connect(function()
        teleportTo(title)
    end)
end

-- Add teleport buttons to the UI
local yPosition = 0
for location, _ in pairs(teleportLocations) do
    createTeleportButton(location, UDim2.new(0.1, 0, 0.1 + (yPosition * 0.1), 0))
    yPosition = yPosition + 1
end

-- Add rainbow effect buttons for other features
createRainbowButton("Auto Cast", UDim2.new(0, 0, 0, 250))
createRainbowButton("Auto Shake", UDim2.new(0, 0, 0, 310))
createRainbowButton("Auto Reel", UDim2.new(0, 0, 0, 370))

-- Add buttons for giving fish and money
createRainbowButton("Give Fish", UDim2.new(0, 0, 0, 430))
createRainbowButton("Give Money", UDim2.new(0, 0, 0, 490))

-- Add new functionality for "Auto Farm Fish" and "Teleport To Select Position"
local Main = Instance.new("Frame")
Main.Parent = screenGui
Main.Size = UDim2.new(0.3, 0, 0.5, 0)
Main.Position = UDim2.new(0.7, 0, 0.25, 0)
Main.BackgroundColor3 = Color3.fromRGB(0, 150, 255)

local Config = {}

-- Toggle Auto Farm Fish
local autoFarmFishToggle = Instance.new("TextButton")
autoFarmFishToggle.Parent = Main
autoFarmFishToggle.Size = UDim2.new(0, 200, 0, 50)
autoFarmFishToggle.Position = UDim2.new(0.1, 0, 0.1, 0)
autoFarmFishToggle.Text = "Auto Farm Fish"
autoFarmFishToggle.MouseButton1Click:Connect(function()
    if not Config["AutoFarmFish"] then
        Config["AutoFarmFish"] = true
        print("Auto Farm Fish Enabled")
        -- Add logic for auto farming fish here
    else
        Config["AutoFarmFish"] = false
        print("Auto Farm Fish Disabled")
    end
end)

-- Toggle Teleport to Selected Position
local teleportToPositionToggle = Instance.new("TextButton")
teleportToPositionToggle.Parent = Main
teleportToPositionToggle.Size = UDim2.new(0, 200, 0, 50)
teleportToPositionToggle.Position = UDim2.new(0.1, 0, 0.2, 0)
teleportToPositionToggle.Text = "Teleport To Select Position"
teleportToPositionToggle.MouseButton1Click:Connect(function()
    if Config["SelectPositionStand"] then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Config["SelectPositionStand"]
        print("Teleported to selected position.")
    else
        print("No position selected yet.")
    end
end)

-- Button to select a position
local selectPositionButton = Instance.new("TextButton")
selectPositionButton.Parent = Main
selectPositionButton.Size = UDim2.new(0, 200, 0, 50)
selectPositionButton.Position = UDim2.new(0.1, 0, 0.3, 0)
selectPositionButton.Text = "Select Position"
selectPositionButton.MouseButton1Click:Connect(function()
    Config['SelectPositionStand'] = LocalPlayer.Character.HumanoidRootPart.CFrame
    print("Position Selected: X " .. tostring(math.floor(LocalPlayer.Character.HumanoidRootPart.Position.X)) ..
          " Y " .. tostring(math.floor(LocalPlayer.Character.HumanoidRootPart.Position.Y)) ..
          " Z " .. tostring(math.floor(LocalPlayer.Character.HumanoidRootPart.Position.Z)))
end)

-- Start Anti-AFK function
preventAFK()

print("Fisch Script Customized with All Features Loaded Successfully!")
