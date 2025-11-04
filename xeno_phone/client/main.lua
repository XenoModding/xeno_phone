ESX = exports['es_extended']:getSharedObject()

local phoneOpen = false

RegisterCommand('phone', function()
    TogglePhone()
end)

RegisterKeyMapping('phone', 'Öffnet das Handy', 'keyboard', Config.KeyOpen)

function TogglePhone()
    phoneOpen = not phoneOpen
    SetNuiFocus(phoneOpen, phoneOpen)
    SendNUIMessage({
        action = 'toggle',
        show = phoneOpen
    })
end

RegisterNUICallback('close', function(_, cb)
    TogglePhone()
    cb('ok')
end)

RegisterNUICallback('sendMessage', function(data, cb)
    TriggerServerEvent('esx_phone_basic:sendMessage', data.number, data.message)
    cb('ok')
end)

RegisterNetEvent('esx_phone_basic:receiveMessage')
AddEventHandler('esx_phone_basic:receiveMessage', function(sender, message)
    SendNUIMessage({
        action = 'newMessage',
        sender = sender,
        message = message
    })
end)
