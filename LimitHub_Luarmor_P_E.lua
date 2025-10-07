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

local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()

if game.PlaceId == 126884695634066 then
--Garden
api.script_id = "2ffaf0f8243f858ce92ded27693c46a0"
elseif game.PlaceId == 109983668079237 or game.PlaceId == 96342491571673 then
--Brainrot
api.script_id = "2fba8939469e00f99ecb49e540a3da35"
elseif game.PlaceId == 121864768012064 then
--Fish It
api.script_id = "9a6a7880a47ab2347e0a79c814ea30e0"
elseif game.PlaceId == 126509999114328 then 
--99 Night in Forest
api.script_id = "0cfb55c04fc0efb5b474b8e79aa8fce3"
elseif game.PlaceId == 79546208627805 then
--99 Night in Forest Lobby
Notify("[Lobby] Please Enter in Game First")
elseif game.PlaceId == 131716211654599 or game.PlaceId == 16732694052 then
--Fisch
api.script_id = "4a114837bbfcc0fc1ff0b9d6ad06622b"
elseif game.PlaceId == 127742093697776 then
--Plant Vs Brainrot
api.script_id = "3dd94b29e27405d7de6957d0afc82280"
else
Notif("Game Not Supported")
return
end

local Linkvertise = "https://ads.luarmor.net/get_key?for=Freemium_x_Linkvertise-gSsbDpqCwoQa"
local Lootlabs = "https://ads.luarmor.net/get_key?for=Freemium_x_Lootslab-xHkQRXjEIpzu"
local KeyLimit = "LimitHub_Premium_Key.txt"
local screenGui = Instance.new("ScreenGui", game.CoreGui)


-- Validasi key Luarmor
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

-- Cek apakah ada key tersimpan & valid
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

    -- Utility: rounded + stroke
    local function ApplyUI(frame)
        local uicorner = Instance.new("UICorner", frame)
        uicorner.CornerRadius = UDim.new(0, 6)

        local stroke = Instance.new("UIStroke", frame)
        stroke.Color = colors.Stroke
        stroke.Thickness = 1.2
        stroke.Transparency = 0.4
    end

    local mainFrame = Instance.new("Frame", screenGui)
    mainFrame.Size = UDim2.new(0, 320, 0, 200)
    mainFrame.Position = UDim2.new(0.5, -160, 0.5, -100)
    mainFrame.BackgroundColor3 = colors.Main
    mainFrame.BackgroundTransparency = 0.2
    mainFrame.Name = "MainFrame"
    ApplyUI(mainFrame)

    local title = Instance.new("TextLabel", mainFrame)
    title.Size = UDim2.new(1, 0, 0, 40)
    title.BackgroundTransparency = 1
    title.Text = "Premium"
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

    -- Hanya Check Key di tengah
    local checkKey = Instance.new("TextButton", mainFrame)
    checkKey.Size = UDim2.new(1, -40, 0, 35)
    checkKey.Position = UDim2.new(0, 20, 0, 110)
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
    footer.Position = UDim2.new(0, 0, 0, 155)
    footer.BackgroundTransparency = 1
    footer.Text = "LimitHub | discord.gg/limithub"
    footer.TextColor3 = colors.TextDark
    footer.Font = Enum.Font.Gotham
    footer.TextSize = 12
    footer.TextTransparency = 0.3
    footer.TextStrokeTransparency = 1
    footer.TextWrapped = true


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

-- Eksekusi auto load key
keyIsSaved()
