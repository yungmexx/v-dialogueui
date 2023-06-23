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

RegisterNetEvent('v-dialogtext')
AddEventHandler('v-dialogtext', function(text)
    IsTextVisible = true
    while IsTextVisible do
        Wait(0)

        splittext1 = string.sub(text, 0, 98)
        splittext2 = string.sub(text, 99)

        -- Draw UI elements
        DrawRect(0.5, 0.92, 0.40, 0.07, 0, 0, 0, 150)
        DrawRect(0.5, 0.965, 0.40, 0.0025, 180, 180, 180, 150)

        DrawAdvancedText(0.5, 0.91, 0.4, tostring(splittext1), 255, 255, 255, CurrentTextOpacity, 6, 0)
        DrawAdvancedText(0.5, 0.93, 0.4, tostring(splittext2), 255, 255, 255, CurrentTextOpacity, 6, 0)
    end
end)

function dialogtext(text, time)
    if IsTextVisible then
        IsTextVisible = false -- Stop displaying current text
        Wait(100) -- Wait for a brief moment before showing the new text
    end
    IsTextVisible = true
    TriggerEvent('v-dialogtext', text) -- Trigger the event with the new text
end

function hidetext()
    IsTextVisible = false
end

-- Example usage
RegisterCommand('dialogtext', function(source, args, rawCommand, time)
    local text = table.concat(args, " ")
    dialogtext(text, time)
end)

RegisterCommand('hidetext', function()
    hidetext()
end)
