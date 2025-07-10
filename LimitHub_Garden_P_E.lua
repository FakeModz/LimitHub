local screenGui = Instance.new("ScreenGui", game.CoreGui)
screenGui.Name = "UpdateNotice"
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 380, 0, 140)
mainFrame.Position = UDim2.new(0.5, -190, 0.5, -70)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 31, 55)

local corner = Instance.new("UICorner", mainFrame)
corner.CornerRadius = UDim.new(0, 8)

local stroke = Instance.new("UIStroke", mainFrame)
stroke.Color = Color3.fromRGB(120, 110, 180)
stroke.Thickness = 1.2
stroke.Transparency = 0.3

local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, -30, 0, 60)
title.Position = UDim2.new(0, 15, 0, 10)
title.BackgroundTransparency = 1
title.TextWrapped = true
title.Text = "LimitHub script has been updated.\nPlease join the Discord server!"
title.TextColor3 = Color3.fromRGB(230, 230, 255)
title.Font = Enum.Font.GothamSemibold
title.TextSize = 16

local copyButton = Instance.new("TextButton", mainFrame)
copyButton.Size = UDim2.new(0, 160, 0, 32)
copyButton.Position = UDim2.new(0.5, -80, 1, -45)
copyButton.BackgroundColor3 = Color3.fromRGB(60, 52, 90)
copyButton.Text = "Copy Discord Link"
copyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
copyButton.Font = Enum.Font.GothamBold
copyButton.TextSize = 14

local copyCorner = Instance.new("UICorner", copyButton)
copyCorner.CornerRadius = UDim.new(0, 6)

copyButton.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/limithub")
    copyButton.Text = "Copied!"
    task.wait(3)
    copyButton.Text = "Copy Discord Link"
end)

