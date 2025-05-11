function SendPet(WEBHOOK_URL, PetMmk, Type, Chances)
    local HttpService = game:GetService("HttpService")
    local player = game:GetService("Players").LocalPlayer
    local currencyFolder = player:WaitForChild("PlayerGui")
            :WaitForChild("ScreenGui")
            :WaitForChild("HUD")
            :WaitForChild("Left")
            :WaitForChild("Currency")
    local coins = currencyFolder:WaitForChild("Coins")
    local frame = coins:WaitForChild("Frame")
    local label = frame:WaitForChild("Label")
    local Aaa = PetMmk or "Unknown"
    local TypeLog = Type or "Unknown"
    local ChancePet = Chances or "Unknown"
    local SisaCoin = label.Text
     
    local embedpet = {
    	title = "Wow, "..TypeLog.." Pet's!", 
        description = "**Hey "..LocalPlayer.name.."!**\nHatched: **"..tostring(Aaa).."**\nChance: **".. tostring(ChancePet).."**\nCoins: **"..tostring(SisaCoin).."**",
        color = 0xFF0000, 
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"), 
        footer = {
        	text = "Join dsc.gg/limithub", 
            icon_url = "https://cdn.discordapp.com/attachments/1145197738418516109/1364187108150870068/images.jpg?ex=68096a7f&is=680818ff&hm=0925f58314a8a1424ede146c1186b50b854713b60b266fee0a7cff4c9c9ac9ac&"
        } , 
        thumbnail = {
        	url = "https://cdn.discordapp.com/attachments/1142101945503461396/1368131112676888596/silly-egg.png?ex=68171ae3&is=6815c963&hm=c59315bf5ea143c47d14dd7b71067136d540a3a6863738d0a9f3477956101410&"
    }
    
    }
    

    local webhookDataPet = {
        username = "dsc.gg/limithub",
        avatar_url = "https://cdn.discordapp.com/attachments/1142101945503461396/1367557636979163247/ChatGPT_Image_1_Mei_2025_00.36.11.png?ex=681504cc&is=6813b34c&hm=1f20be0e6590847645a4c3ceb35e1af0ac4cd8f9bcdd6fa0d526413e188ad5c4&",
        content = "@everyone", 
        embeds = {embedpet}
    }
    
    local success, response = pcall(function()
        return (syn and syn.request or http_request) {
            Url = WEBHOOK_URL,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = HttpService:JSONEncode(webhookDataPet)
        }
    end)

    if success then
        print("[Pet Logger]: Webhook sent.")
    else
        warn("[Pet Logger]: Failed to send webhook! Error: " .. tostring(response))
    end
end

function SendQuest(WEBHOOK_URL, QuestName, Bar)
    local HttpService = game:GetService("HttpService")
    local SeasonName
    local SeasonPoint
    local Top = game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.Competitive.Frame:FindFirstChild("Top")
    if Top then
    for _, child in ipairs(Top:GetChildren()) do
        if child:IsA("TextLabel") then
            SeasonName = child.Text
        end
    end
else
    warn("Top not found!")
end

local Playersd = game:GetService("Players")
local playerd = Playersd.LocalPlayer

-- Cari objek Stars
local Stars = playerd:WaitForChild("PlayerGui")
    :WaitForChild("ScreenGui")
    :WaitForChild("Competitive")
    :WaitForChild("Frame")
    :WaitForChild("Top")
    :WaitForChild("Stars")
    :WaitForChild("Bar")

if Stars then  
    for _, child in ipairs(Stars:GetChildren()) do           
            if child:IsA("TextLabel") then
                SeasonPoint = child.Text         
        end
    end
else
    warn("Stars tidak ditemukan di path yang diberikan!")
end



    local Qname = tostring(QuestName)
    local Qbar = tostring(Bar)
    local embedpet = {
    	title = tostring(SeasonName), 
        description = "**--["..LocalPlayer.name.."]--**\nQuest: **"..tostring(Qname).."**\nProgress: **".. tostring(Bar).."**\nTotal Points: **"..tostring(SeasonPoint).."**",
        color = 0xFF0000,
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"), 
        footer = {
        	text = "dsc.gg/limithub | Today [" ..os.date("%H:%M:%S").. "]", 
            icon_url = "https://cdn.discordapp.com/attachments/1145197738418516109/1364187108150870068/images.jpg?ex=68096a7f&is=680818ff&hm=0925f58314a8a1424ede146c1186b50b854713b60b266fee0a7cff4c9c9ac9ac&"
        } , 
        thumbnail = {
        	url = "https://cdn.discordapp.com/attachments/1123448225450426368/1366625804200579082/3478581.png?ex=6811a0f6&is=68104f76&hm=5d2326dee927b2b5333223f3160c3b4bfad2b7e2839597debdb8908408b6997c&"
    }
    
    }
    

    local webhookDataPet = {
        username = "dsc.gg/limithub",
        avatar_url = "https://cdn.discordapp.com/attachments/1142101945503461396/1367557636979163247/ChatGPT_Image_1_Mei_2025_00.36.11.png?ex=681504cc&is=6813b34c&hm=1f20be0e6590847645a4c3ceb35e1af0ac4cd8f9bcdd6fa0d526413e188ad5c4&",
        content = "Auto Quest Completed!", 
        embeds = {embedpet}
    }
    
    local success, response = pcall(function()
        return (syn and syn.request or http_request) {
            Url = WEBHOOK_URL,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = HttpService:JSONEncode(webhookDataPet)
        }
    end)

    if success then
        print("[Quest Logger]: Webhook sent.")
    else
        warn("[Quest Logger]: Failed to send webhook! Error: " .. tostring(response))
    end
end

function SendOnline(WEBHOOK_URL, Job)
    local HttpService = game:GetService("HttpService")
    local jobId = game.JobId

    local webhookData = {
        username = "dsc.gg/limithub",
        avatar_url = "https://cdn.discordapp.com/attachments/1142101945503461396/1367557636979163247/ChatGPT_Image_1_Mei_2025_00.36.11.png?ex=681504cc&is=6813b34c&hm=1f20be0e6590847645a4c3ceb35e1af0ac4cd8f9bcdd6fa0d526413e188ad5c4&",
        content = "["..os.date("%H:%M:%S").."] ["..LocalPlayer.name.."] Status: "..Job.." ✅"
    }
    
    -- Menangani request HTTP
    local success, response = pcall(function()
        return (syn and syn.request or http_request) {
            Url = WEBHOOK_URL,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = HttpService:JSONEncode(webhookData)
        }
    end)

    if success then
        print("[Status Logger]: Webhook sent.")
    else
        warn("[Status Logger]: Failed to send webhook! Error: "..response)
    end
end
