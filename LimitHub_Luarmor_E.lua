local function Notif(text)
    pcall(function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "LimitHub",
            Text = text,
            Icon = "rbxassetid://123767073052336",
            Duration = 5
        })
    end)
end

local Linkvertise = "https://ads.luarmor.net/get_key?for=Linkvertise-sGGORVOOzylG"
local Lootlabs = "https://ads.luarmor.net/get_key?for=Lootlabs-mAfbLFkpKwsn"
local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()

if game.PlaceId == 126884695634066 then
--Garden
api.script_id = "c7e7c28da728c6863a012ed2bd46f183"
elseif game.PlaceId == 109983668079237 or game.PlaceId == 96342491571673 then
--Brainrot
api.script_id = "6f0b98e1fcdc5802e05d12fb3160357e"
elseif game.PlaceId == 121864768012064 then
--Fish It
api.script_id = "f35449c1f3c63953383043ebbce06761"
elseif game.PlaceId == 126509999114328 then 
--99 Night in Forest
api.script_id = "5b3e111bc8d15db9ab8ca5fd1d165980"
elseif game.PlaceId == 79546208627805 then
--99 Night in Forest Lobby
Notify("[Lobby] Please Enter in Game First")
elseif game.PlaceId == 131716211654599 or game.PlaceId == 16732694052 then
--Fisch
api.script_id = "dff2d7e144df4f300dc3c35ab2b95e6e"
elseif game.PlaceId == 127742093697776 then
--Plant Vs Brainrot
api.script_id = "d59fe42f0c7c96327ea4f2c4633e3725"
else
Notif("Game Not Supported") 
return
end


local KeyLimit = "LimitHubKey.txt"
local screenGui = Instance.new("ScreenGui", game.CoreGui)


local function checkKeyLuarmor(key)
    local status = api.check_key(key)
    print(status)
    if status.code == "KEY_VALID" then
        screenGui:Destroy()
        writefile(KeyLimit, key)
        script_key = key
        Notif("Key Valid")
        task.wait(1)
        api.load_script()
        return true
    elseif status.code == "KEY_HWID_LOCKED" then
        Notif("HWID Locked. Reset for other device!")
    elseif status.code == "KEY_INCORRECT" then
        Notif("Key Invalid.")
        elseif status.code == "KEY_EXPIRED" then
        Notif("Key Expired Please Renew.")
    else
        Notif("Failed: " .. status.message .. " | Code: " .. status.code)
    end
    return false
end


local function keyIsSaved()
    if isfile(KeyLimit) then
        local savedKey = readfile(KeyLimit)
        local status = api.check_key(savedKey)
        if status.code == "KEY_VALID" then
            screenGui:Destroy()
            Notif("Auto Load Key: " .. status.message)
            script_key = savedKey
            task.wait(1)
            api.load_script()
            return true
        elseif status.code == "KEY_HWID_LOCKED" then
            Notif("HWID Locked. Reset for other device!")
        elseif status.code == "KEY_INCORRECT" then
            Notif("Saved key invalid.")
            elseif status.code == "KEY_EXPIRED" then
        Notif("Saved Key Expired Please Renew.")
        else
            Notif("Failed: " .. status.message .. " | Code: " .. status.code)
        end
    end
    return false
end


screenGui.Name = "KeyUI"
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.ResetOnSpawn = false

local colors = {
    Main = Color3.fromRGB(35, 31, 55),
    Second = Color3.fromRGB(60, 52, 90),
    Stroke = Color3.fromRGB(120, 110, 180),
    Divider = Color3.fromRGB(90, 80, 130),
    Text = Color3.fromRGB(230, 230, 255),
    TextDark = Color3.fromRGB(160, 160, 200)
}

local function ApplyUI(frame)
    local uicorner = Instance.new("UICorner", frame)
    uicorner.CornerRadius = UDim.new(0, 6)

    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = colors.Stroke
    stroke.Thickness = 1.2
    stroke.Transparency = 0.4
end

local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 320, 0, 240)
mainFrame.Position = UDim2.new(0.5, -160, 0.5, -120)
mainFrame.BackgroundColor3 = colors.Main
mainFrame.BackgroundTransparency = 0.2
mainFrame.Name = "MainFrame"
ApplyUI(mainFrame)

local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "Key System"
title.TextColor3 = colors.Text
title.Font = Enum.Font.GothamSemibold
title.TextSize = 18

local divider = Instance.new("Frame", mainFrame)
divider.Size = UDim2.new(1, -40, 0, 1)
divider.Position = UDim2.new(0, 20, 0, 42)
divider.BackgroundColor3 = colors.Divider
divider.BackgroundTransparency = 0.3
divider.BorderSizePixel = 0

local keyBox = Instance.new("TextBox", mainFrame)
keyBox.Size = UDim2.new(1, -40, 0, 36)
keyBox.Position = UDim2.new(0, 20, 0, 60)
keyBox.BackgroundColor3 = colors.Second
keyBox.BackgroundTransparency = 0.2
keyBox.BorderSizePixel = 0
keyBox.TextColor3 = colors.Text
keyBox.PlaceholderText = "Enter Key"
keyBox.PlaceholderColor3 = colors.TextDark
keyBox.Font = Enum.Font.Gotham
keyBox.TextSize = 14
ApplyUI(keyBox)

local lootlabsBtn = Instance.new("TextButton", mainFrame)
lootlabsBtn.Size = UDim2.new(0.5, -25, 0, 30)
lootlabsBtn.Position = UDim2.new(0, 20, 0, 110)
lootlabsBtn.BackgroundColor3 = colors.Second
lootlabsBtn.BackgroundTransparency = 0.2
lootlabsBtn.BorderSizePixel = 0
lootlabsBtn.TextColor3 = colors.Text
lootlabsBtn.Text = "Lootlabs"
lootlabsBtn.Font = Enum.Font.GothamBold
lootlabsBtn.TextSize = 13
ApplyUI(lootlabsBtn)

local linkvertiseBtn = Instance.new("TextButton", mainFrame)
linkvertiseBtn.Size = UDim2.new(0.5, -25, 0, 30)
linkvertiseBtn.Position = UDim2.new(0.5, 5, 0, 110)
linkvertiseBtn.BackgroundColor3 = colors.Second
linkvertiseBtn.BackgroundTransparency = 0.2
linkvertiseBtn.BorderSizePixel = 0
linkvertiseBtn.TextColor3 = colors.Text
linkvertiseBtn.Text = "Linkvertise"
linkvertiseBtn.Font = Enum.Font.GothamBold
linkvertiseBtn.TextSize = 13
ApplyUI(linkvertiseBtn)

local checkKey = Instance.new("TextButton", mainFrame)
checkKey.Size = UDim2.new(0, 180, 0, 32)
checkKey.Position = UDim2.new(0.5, -90, 0, 155)
checkKey.BackgroundColor3 = colors.Second
checkKey.BackgroundTransparency = 0.2
checkKey.BorderSizePixel = 0
checkKey.TextColor3 = colors.Text
checkKey.Text = "Check Key"
checkKey.Font = Enum.Font.GothamBold
checkKey.TextSize = 14
ApplyUI(checkKey)

local footer = Instance.new("TextLabel", mainFrame)
footer.Size = UDim2.new(1, 0, 0, 20)
footer.Position = UDim2.new(0, 0, 0.85, 0)
footer.BackgroundTransparency = 1
footer.Text = "LimitHub | discord.gg/limithub"
footer.TextColor3 = colors.TextDark
footer.Font = Enum.Font.Gotham
footer.TextSize = 12
footer.TextTransparency = 0.3
footer.TextYAlignment = Enum.TextYAlignment.Center
footer.TextWrapped = false


lootlabsBtn.MouseButton1Click:Connect(function()
    setclipboard(Lootlabs)
    lootlabsBtn.Text = "Copied!"
    task.wait(3)
    lootlabsBtn.Text = "Lootlabs"
end)

linkvertiseBtn.MouseButton1Click:Connect(function()
    setclipboard(Linkvertise)
    linkvertiseBtn.Text = "Copied!"
    task.wait(3)
    linkvertiseBtn.Text = "Linkvertise"
end)
 
checkKey.MouseButton1Click:Connect(function()
    local inputKey = keyBox.Text
    if inputKey == "" or #inputKey < 30 then
        keyBox.PlaceholderText = "Key invalid!"
        keyBox.Text = ""
        return
    end

    local valid = checkKeyLuarmor(inputKey)
    if valid then
        screenGui:Destroy()
    else
        keyBox.Text = ""
        keyBox.PlaceholderText = "Key Invalid!"
    end
end)

keyIsSaved()
