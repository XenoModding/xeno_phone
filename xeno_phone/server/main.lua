ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('esx_phone_basic:sendMessage')
AddEventHandler('esx_phone_basic:sendMessage', function(targetNumber, message)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local senderNumber = xPlayer.getIdentifier()

    local targetPlayer = GetPlayerFromIdentifier(targetNumber)
    if targetPlayer then
        TriggerClientEvent('esx_phone_basic:receiveMessage', targetPlayer, senderNumber, message)
    end

    MySQL.Async.execute('INSERT INTO phone_messages (sender, receiver, message) VALUES (@s, @r, @m)', {
        ['@s'] = senderNumber,
        ['@r'] = targetNumber,
        ['@m'] = message
    })
end)

function GetPlayerFromIdentifier(identifier)
    for _, playerId in ipairs(GetPlayers()) do
        local xPlayer = ESX.GetPlayerFromId(playerId)
        if xPlayer.getIdentifier() == identifier then
            return playerId
        end
    end
    return nil
end
