-- Create the main screen GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui
ScreenGui.Name = "CustomMenu"

-- Main frame with purple background
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0.5, 0, 0.75, 0)  -- Adjust the size of the frame
MainFrame.Position = UDim2.new(0.25, 0, 0.125, 0)  -- Center the frame
MainFrame.BackgroundColor3 = Color3.fromRGB(128, 0, 128)  -- Purple background
MainFrame.BackgroundTransparency = 0.2  -- Slight transparency for aesthetic effect
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true

-- Add a title bar with a close button
local TitleBar = Instance.new("Frame")
TitleBar.Parent = MainFrame
TitleBar.Size = UDim2.new(1, 0, 0.1, 0)  -- Title bar at the top
TitleBar.BackgroundColor3 = Color3.fromRGB(75, 0, 130)  -- Purple color for title bar
TitleBar.BorderSizePixel = 0

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Parent = TitleBar
TitleLabel.Text = "Dash Hub v1.6"
TitleLabel.Size = UDim2.new(1, 0, 1, 0)
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 18
TitleLabel.TextXAlignment = Enum.TextXAlignment.Center
TitleLabel.TextYAlignment = Enum.TextYAlignment.Center
TitleLabel.BackgroundTransparency = 1

local CloseButton = Instance.new("TextButton")
CloseButton.Parent = TitleBar
CloseButton.Size = UDim2.new(0, 50, 1, 0)  -- Close button on the right
CloseButton.Position = UDim2.new(1, -50, 0, 0)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
CloseButton.TextSize = 18
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()  -- Close the menu when clicked
end)

-- Rainbow glow effect for tabs
local function rainbowGlow(object)
    -- This function applies a rainbow glow effect to the object's text color
    local colors = {Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 165, 0), Color3.fromRGB(255, 255, 0), Color3.fromRGB(0, 255, 0), Color3.fromRGB(0, 0, 255), Color3.fromRGB(75, 0, 130), Color3.fromRGB(238, 130, 238)}
    local i = 1
    while true do
        object.TextColor3 = colors[i]
        i = i % #colors + 1
        wait(0.5)  -- Change color every 0.5 seconds for rainbow effect
    end
end

-- Create the sections with rainbow effect on titles
local function createSection(title, position)
    local Section = Instance.new("Frame")
    Section.Parent = MainFrame
    Section.Size = UDim2.new(1, 0, 0.2, 0)
    Section.Position = position
    Section.BackgroundColor3 = Color3.fromRGB(50, 50, 50)  -- Dark gray for sections
    Section.BorderSizePixel = 0

    local SectionTitle = Instance.new("TextLabel")
    SectionTitle.Parent = Section
    SectionTitle.Text = title
    SectionTitle.Size = UDim2.new(1, 0, 0.2, 0)
    SectionTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    SectionTitle.TextSize = 18
    SectionTitle.TextXAlignment = Enum.TextXAlignment.Left
    SectionTitle.TextYAlignment = Enum.TextYAlignment.Center
    SectionTitle.BackgroundTransparency = 1
    
    -- Apply rainbow glow effect to section titles
    rainbowGlow(SectionTitle)

    return Section
end

-- Create "General" Section
local GeneralSection = createSection("General", UDim2.new(0, 0, 0.1, 0))

-- Create toggle buttons for the "General" section with rainbow text effect
local function createToggleButton(parent, title, position)
    local ToggleButton = Instance.new("TextButton")
    ToggleButton.Parent = parent
    ToggleButton.Size = UDim2.new(1, 0, 0.2, 0)
    ToggleButton.Position = position
    ToggleButton.Text = title
    ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleButton.BackgroundColor3 = Color3.fromRGB(100, 0, 255)
    ToggleButton.TextSize = 16
    ToggleButton.MouseButton1Click:Connect(function()
        print(title .. " toggled!")  -- Toggle functionality (to be implemented)
    end)

    -- Apply rainbow glow effect to the button text
    rainbowGlow(ToggleButton)

    return ToggleButton
end

-- Create toggle buttons inside "General" section
createToggleButton(GeneralSection, "Auto Farm Fish", UDim2.new(0, 0, 0.2, 0))
createToggleButton(GeneralSection, "Teleport To Select Position", UDim2.new(0, 0, 0.4, 0))

-- Create "Seller" Section
local SellerSection = createSection("Seller", UDim2.new(0, 0, 0.3, 0))

-- Create toggle buttons for "Seller" section
createToggleButton(SellerSection, "Auto Sell Fish", UDim2.new(0, 0, 0.2, 0))
createToggleButton(SellerSection, "Sell All Fish", UDim2.new(0, 0, 0.4, 0))

-- Create "Info Fish" Section
local InfoFishSection = createSection("Info Fish", UDim2.new(0, 0, 0.5, 0))

-- Create info buttons for "Info Fish" section
local function createInfoButton(parent, title, position)
    local InfoButton = Instance.new("TextButton")
    InfoButton.Parent = parent
    InfoButton.Size = UDim2.new(1, 0, 0.2, 0)
    InfoButton.Position = position
    InfoButton.Text = title
    InfoButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    InfoButton.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
    InfoButton.TextSize = 16
    InfoButton.MouseButton1Click:Connect(function()
        print(title .. " info requested!")  -- Info functionality (to be implemented)
    end)

    -- Apply rainbow glow effect to the button text
    rainbowGlow(InfoButton)

    return InfoButton
end

-- Create info buttons inside "Info Fish" section
createInfoButton(InfoFishSection, "Get Fish Info", UDim2.new(0, 0, 0.2, 0))
createInfoButton(InfoFishSection, "Select Fish", UDim2.new(0, 0, 0.4, 0))

