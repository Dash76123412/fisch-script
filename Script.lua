-- Creating the ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui
ScreenGui.Name = "CustomMenu"

-- Main Frame for the Menu
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0.5, 0, 0.75, 0)
MainFrame.Position = UDim2.new(0.25, 0, 0.125, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Dark background for contrast
MainFrame.BackgroundTransparency = 0.3
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true

-- Title Bar with Close Button
local TitleBar = Instance.new("Frame")
TitleBar.Parent = MainFrame
TitleBar.Size = UDim2.new(1, 0, 0.1, 0)
TitleBar.BackgroundColor3 = Color3.fromRGB(60, 60, 60) -- Darker title bar
TitleBar.BorderSizePixel = 0

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Parent = TitleBar
TitleLabel.Text = "Dash Hub v1.6"
TitleLabel.Size = UDim2.new(1, 0, 1, 0)
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 20
TitleLabel.TextXAlignment = Enum.TextXAlignment.Center
TitleLabel.TextYAlignment = Enum.TextYAlignment.Center
TitleLabel.BackgroundTransparency = 1

local CloseButton = Instance.new("TextButton")
CloseButton.Parent = TitleBar
CloseButton.Size = UDim2.new(0, 50, 1, 0)
CloseButton.Position = UDim2.new(1, -50, 0, 0)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseButton.TextSize = 18
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Rainbow Glow Effect for Buttons and Tabs
local function rainbowGlow(object)
    local colors = {Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 165, 0), Color3.fromRGB(255, 255, 0), Color3.fromRGB(0, 255, 0), Color3.fromRGB(0, 0, 255), Color3.fromRGB(75, 0, 130), Color3.fromRGB(238, 130, 238)}
    local i = 1
    while true do
        object.TextColor3 = colors[i]
        i = i % #colors + 1
        wait(0.5)
    end
end

-- Create a Side Panel for Navigation
local SidePanel = Instance.new("Frame")
SidePanel.Parent = MainFrame
SidePanel.Size = UDim2.new(0.2, 0, 1, 0)
SidePanel.Position = UDim2.new(0, 0, 0, 0)
SidePanel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SidePanel.BorderSizePixel = 0

-- Add Tab Buttons in the Side Panel
local function createTabButton(parent, title, position)
    local TabButton = Instance.new("TextButton")
    TabButton.Parent = parent
    TabButton.Size = UDim2.new(1, 0, 0.1, 0)
    TabButton.Position = position
    TabButton.Text = title
    TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    TabButton.TextSize = 18
    TabButton.MouseButton1Click:Connect(function()
        print(title .. " clicked")
    end)

    -- Apply rainbow effect to tab button
    rainbowGlow(TabButton)
    return TabButton
end

-- Create the tabs
createTabButton(SidePanel, "General", UDim2.new(0, 0, 0, 0))
createTabButton(SidePanel, "Seller", UDim2.new(0, 0, 0.1, 0))
createTabButton(SidePanel, "Info Fish", UDim2.new(0, 0, 0.2, 0))

-- Add Sections Below Side Panel with Titles and Options
local function createSection(title, position)
    local Section = Instance.new("Frame")
    Section.Parent = MainFrame
    Section.Size = UDim2.new(0.8, 0, 0.3, 0)
    Section.Position = position
    Section.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    Section.BorderSizePixel = 0

    local SectionTitle = Instance.new("TextLabel")
    SectionTitle.Parent = Section
    SectionTitle.Text = title
    SectionTitle.Size = UDim2.new(1, 0, 0.1, 0)
    SectionTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    SectionTitle.TextSize = 18
    SectionTitle.TextXAlignment = Enum.TextXAlignment.Left
    SectionTitle.TextYAlignment = Enum.TextYAlignment.Center
    SectionTitle.BackgroundTransparency = 1
    rainbowGlow(SectionTitle)

    return Section
end

-- Create General, Seller, and Info Fish Sections
local GeneralSection = createSection("General", UDim2.new(0.2, 0, 0, 0.1))
local SellerSection = createSection("Seller", UDim2.new(0.2, 0, 0.3, 0.1))
local InfoFishSection = createSection("Info Fish", UDim2.new(0.2, 0, 0.6, 0.1))

-- Add Buttons to Each Section
local function createButton(parent, title, position)
    local Button = Instance.new("TextButton")
    Button.Parent = parent
    Button.Size = UDim2.new(1, 0, 0.2, 0)
    Button.Position = position
    Button.Text = title
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.BackgroundColor3 = Color3.fromRGB(80, 0, 255)
    Button.TextSize = 16
    Button.MouseButton1Click:Connect(function()
        print(title .. " activated!")
    end)
    rainbowGlow(Button)
    return Button
end

-- Create buttons inside the "General" Section
createButton(GeneralSection, "Auto Farm Fish", UDim2.new(0, 0, 0.2, 0))
createButton(GeneralSection, "Teleport to Position", UDim2.new(0, 0, 0.4, 0))

-- Create buttons inside the "Seller" Section
createButton(SellerSection, "Auto Sell Fish", UDim2.new(0, 0, 0.2, 0))
createButton(SellerSection, "Sell All Fish", UDim2.new(0, 0, 0.4, 0))

-- Create buttons inside the "Info Fish" Section
createButton(InfoFishSection, "Get Fish Info", UDim2.new(0, 0, 0.2, 0))
createButton(InfoFishSection, "Select Fish", UDim2.new(0, 0, 0.4, 0))

