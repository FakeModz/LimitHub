local screenGui = Instance.new("ScreenGui", game.CoreGui)
screenGui.Name = "UpdateNotice"
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 380, 0, 160)
mainFrame.Position = UDim2.new(0.5, -190, 0.5, -80)
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

local copyDiscordBtn = Instance.new("TextButton", mainFrame)
copyDiscordBtn.Size = UDim2.new(0.5, -25, 0, 32)
copyDiscordBtn.Position = UDim2.new(0, 20, 0, 100)
copyDiscordBtn.BackgroundColor3 = Color3.fromRGB(60, 52, 90)
copyDiscordBtn.Text = "Copy Discord Link"
copyDiscordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
copyDiscordBtn.Font = Enum.Font.GothamBold
copyDiscordBtn.TextSize = 14
local corner1 = Instance.new("UICorner", copyDiscordBtn)
corner1.CornerRadius = UDim.new(0, 6)

local copyLoaderBtn = Instance.new("TextButton", mainFrame)
copyLoaderBtn.Size = UDim2.new(0.5, -25, 0, 32)
copyLoaderBtn.Position = UDim2.new(0.5, 5, 0, 100)
copyLoaderBtn.BackgroundColor3 = Color3.fromRGB(60, 52, 90)
copyLoaderBtn.Text = "Copy New Loader"
copyLoaderBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
copyLoaderBtn.Font = Enum.Font.GothamBold
copyLoaderBtn.TextSize = 14
local corner2 = Instance.new("UICorner", copyLoaderBtn)
corner2.CornerRadius = UDim.new(0, 6)

copyDiscordBtn.MouseButton1Click:Connect(function()
	setclipboard("https://discord.gg/limithub")
	copyDiscordBtn.Text = "Copied!"
	task.wait(3)
	copyDiscordBtn.Text = "Copy Discord Link"
end)

copyLoaderBtn.MouseButton1Click:Connect(function()
	setclipboard("loadstring(game:HttpGet('https://raw.githubusercontent.com/FakeModz/LimitHub/refs/heads/main/LimitHub_Luarmor_E.lua'))()")
	copyLoaderBtn.Text = "Copied!"
	task.wait(3)
	copyLoaderBtn.Text = "Copy New Loader"
end)
