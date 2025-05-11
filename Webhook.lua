return function()
    local function Abeceded(nama)
        local player = game:GetService("Players").LocalPlayer
        local success, result = pcall(function()
            local currencyFolder = player:WaitForChild("PlayerGui")
                :WaitForChild("ScreenGui")
                :WaitForChild("HUD")
                :WaitForChild("Left")
                :WaitForChild("Currency")
            local target = currencyFolder:WaitForChild(nama)
            local frame = target:WaitForChild("Frame")
            local label = frame:WaitForChild("Label")
            if label:IsA("TextLabel") then
                return label.Text
            else
                return nil
            end
        end)
        if success then
            return result
        else
            warn("Failed to get label text:", result)
            return nil
        end
    end
    return Abeceded
end
