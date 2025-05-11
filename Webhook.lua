local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function getCoinText()
    local success, result = pcall(function()
        local label = LocalPlayer.PlayerGui.ScreenGui.HUD.Left.Currency.Coins.Frame.Label
        return label.Text
    end)
    return success and result or "N/A"
end

local function getSeasonData()
    local success, name, point = pcall(function()
        local top = LocalPlayer.PlayerGui.ScreenGui.Competitive.Frame:FindFirstChild("Top")
        local stars = top.Stars.Bar
        local seasonName, seasonPoint
        for _, v in ipairs(top:GetChildren()) do
            if v:IsA("TextLabel") then
                seasonName = v.Text
            end
        end
        for _, v in ipairs(stars:GetChildren()) do
            if v:IsA("TextLabel") then
                seasonPoint = v.Text
            end
        end
        return seasonName, seasonPoint
    end)
    return success and name or "Unknown", success and point or "Unknown"
end

_G.SendPet = function(WEBHOOK_URL, PetMmk, Type, Chances)
    local SisaCoin = getCoinText()
    local embed = {
        title = "Wow, "..(Type or "Unknown").." Pet's!",
        description = "**Hey "..LocalPlayer.Name.."!**\nHatched: **"..tostring(PetMmk).."**\nChance: **"..tostring(Chances).."**\nCoins: **"..SisaCoin.."**",
        color = 0xFF0000,
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
        footer = {
            text = "Join dsc.gg/limithub",
            icon_url = "https://cdn.discordapp.com/attachments/1145197738418516109/1364187108150870068/images.jpg"
        },
        thumbnail = {
            url = "https://cdn.discordapp.com/attachments/1142101945503461396/1368131112676888596/silly-egg.png"
        }
    }
    local payload = {
        username = "dsc.gg/limithub",
        avatar_url = "https://cdn.discordapp.com/attachments/1142101945503461396/1367557636979163247/ChatGPT_Image.png",
        content = "@everyone",
        embeds = {embed}
    }
    pcall(function()
        (syn and syn.request or http_request)({
            Url = WEBHOOK_URL,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = HttpService:JSONEncode(payload)
        })
    end)
end

_G.SendQuest = function(WEBHOOK_URL, QuestName, Bar)
    local SeasonName, SeasonPoint = getSeasonData()
    local embed = {
        title = SeasonName,
        description = "**--["..LocalPlayer.Name.."]--**\nQuest: **"..tostring(QuestName).."**\nProgress: **".. tostring(Bar).."**\nTotal Points: **"..tostring(SeasonPoint).."**",
        color = 0xFF0000,
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
        footer = {
            text = "dsc.gg/limithub | Today [" ..os.date("%H:%M:%S").. "]",
            icon_url = "https://cdn.discordapp.com/attachments/1145197738418516109/1364187108150870068/images.jpg"
        },
        thumbnail = {
            url = "https://cdn.discordapp.com/attachments/1123448225450426368/1366625804200579082/3478581.png"
        }
    }
    local payload = {
        username = "dsc.gg/limithub",
        avatar_url = "https://cdn.discordapp.com/attachments/1142101945503461396/1367557636979163247/ChatGPT_Image.png",
        content = "Auto Quest Completed!",
        embeds = {embed}
    }
    pcall(function()
        (syn and syn.request or http_request)({
            Url = WEBHOOK_URL,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = HttpService:JSONEncode(payload)
        })
    end)
end

_G.SendOnline = function(WEBHOOK_URL, Job)
    local payload = {
        username = "dsc.gg/limithub",
        avatar_url = "https://cdn.discordapp.com/attachments/1142101945503461396/1367557636979163247/ChatGPT_Image.png",
        content = "["..os.date("%H:%M:%S").."] ["..LocalPlayer.Name.."] Status: "..Job.." ✅"
    }
    pcall(function()
        (syn and syn.request or http_request)({
            Url = WEBHOOK_URL,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = HttpService:JSONEncode(payload)
        })
    end)
end
