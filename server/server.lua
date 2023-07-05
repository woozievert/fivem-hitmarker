RegisterNetEvent('hitmarker:server:hit')

AddEventHandler('hitmarker:server:hit', function(player, bone)
    TriggerClientEvent('hitmarker:client:hit', player, bone)
end)

AddEventHandler('audio:server:play', function(player, audio, volume, loop)
    TriggerClientEvent('audio:client:play', player, audio, volume, loop)
end)
