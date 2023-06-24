local CurrentTextOpacity = 255
local IsTextVisible = false

function DrawAdvancedText(x, y, sc, text, r, g, b, a, font, jus)
    SetTextFont(font)
    SetTextScale(sc, sc)
    SetTextJustification(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y - 0.005)
end

local function DrawUIElements()
    DrawRect(0.5, 0.92, 0.40, 0.07, 0, 0, 0, 150)
    DrawRect(0.5, 0.965, 0.40, 0.0025, 180, 180, 180, 150)
end

local function HideText()
    IsTextVisible = false
end

local function ShowText(text)
    if IsTextVisible then
        Wait(100) -- Wait for a brief moment before showing the new text
    end
    IsTextVisible = true
    TriggerEvent('v-dialogue:showtext', text) -- Trigger the event with the new text
end

RegisterNetEvent('v-dialogue:showtext', function(text)
    IsTextVisible = true
    local splittext1 = string.sub(text, 0, 98)
    local splittext2 = string.sub(text, 99)

    -- Draw UI elements
    DrawUIElements()

    DrawAdvancedText(0.5, 0.91, 0.4, tostring(splittext1), 255, 255, 255, CurrentTextOpacity, 6, 0)
    DrawAdvancedText(0.5, 0.93, 0.4, tostring(splittext2), 255, 255, 255, CurrentTextOpacity, 6, 0)
end)

RegisterNetEvent('v-hidetext', HideText)

-- Example usage
--[[
RegisterCommand('dialogtext', function(source, args, rawCommand)
    local text = table.concat(args, " ")
    ShowText(text)
end)

RegisterCommand('hidetext', HideText)

RegisterCommand('testest', function()
    TriggerEvent('v-dialogue:showtext', "This is an Example")
    Wait(1000)
    TriggerEvent('v-hidetext')
end)
--]]
