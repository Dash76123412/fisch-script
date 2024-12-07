-- Dash Fishing Script by [Your Name]

-- Teleportation function to predefined locations (islands, rods, relics, etc.)
local teleportLocations = {
    ["Island1"] = CFrame.new(100, 10, 100),  -- Example coordinates
    ["Rod1"] = CFrame.new(200, 10, 150),
    ["Relic1"] = CFrame.new(300, 10, 200),
    -- Add more locations as needed
}

-- Teleport function
function teleportTo(location)
    local targetPosition = teleportLocations[location]
    if targetPosition then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetPosition
    else
        print("Location not found!")
    end
end

-- Function to teleport other players to you
function teleportPlayerToMe(player)
    local myPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    player.Character.HumanoidRootPart.CFrame = CFrame.new(myPosition)
end

-- Give fish and money to a player (including yourself)
function giveFish(player, amount)
    -- Assuming there's a custom variable or system for managing fish
    player.leaderstats.Fish.Value = player.leaderstats.Fish.Value + amount
end

function giveMoney(player, amount)
    -- Assuming there's a custom variable or system for managing money
    player.leaderstats.Money.Value = player.leaderstats.Money.Value + amount
end

-- Auto Reel Function
function autoReel()
    while true do
        -- Simulate the reeling process (example)
        -- Adjust code based on how reeling works in the game
        print("Reeling...")
        wait(2)  -- Adjust timing as needed
    end
end

-- Auto Shake Function
function autoShake()
    while true do
        -- Simulate the shaking process (example)
        print("Shaking...")
        wait(1)  -- Adjust timing as needed
    end
end

-- Auto Cast Function
function autoCast()
    while true do
        -- Simulate the casting process (example)
        print("Casting...")
        wait(5)  -- Adjust timing as needed
    end
end

-- Movement Functions: Freeze, Walk on Water, Walk Speed, and Jump Power
function freezePlayer()
    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
end

function walkOnWater()
    -- Assuming there are parts labeled "Water" in the game
    local waterParts = game.Workspace:GetChildren()
    for _, part in ipairs(waterParts) do
        if part.Name == "Water" then
            part.CanCollide = false
        end
    end
end

function setWalkSpeed(multiplier)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16 * multiplier
end

function setJumpPower(multiplier)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50 * multiplier
end

-- Anti-AFK Function
function preventAFK()
    while true do
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        wait(10)  -- Prevent AFK every 10 seconds
    end
end

-- UI Customization with Purple and Rainbow Effect
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer.PlayerGui
screenGui.Name = "DashFishingMenu"

local mainFrame = Instance.new("Frame")
mainFrame.Parent = screenGui
mainFrame.Size = UDim2.new(0.3, 0, 0.5, 0)
mainFrame.Position = UDim2.new(0.35, 0, 0.25, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(150, 0, 255)  -- Purple color

-- Function to create rainbow buttons
function createRainbowButton(text, position)
    local button = Instance.new("TextButton")
    button.Parent = mainFrame
    button.Text = text
    button.Size = UDim2.new(0, 200, 0, 50)
    button.Position = position
    button.BackgroundColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)  -- Rainbow effect
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
end

-- Add buttons to the UI
createRainbowButton("Teleport to Island", UDim2.new(0, 0, 0, 0))
createRainbowButton("Auto Cast", UDim2.new(0, 0, 0, 60))
createRainbowButton("Give Fish", UDim2.new(0, 0, 0, 120))
createRainbowButton("Give Money", UDim2.new(0, 0, 0, 180))

-- Anti-AFK
preventAFK()
