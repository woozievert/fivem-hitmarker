RegisterNetEvent('hitmarker:client:hit')
RegisterNetEvent('audio:client:play')

AddEventHandler('hitmarker:client:hit', function(bone)
    if bone == 31086 then
        SendNUIMessage({
            type = 'play',
            audio = CONFIG.HEADAUDIO,
            volume = CONFIG.HEADVOLUME,
            loop = false
        })
    else
        SendNUIMessage({
            type = 'play',
            audio = CONFIG.AUDIO,
            volume = CONFIG.VOLUME,
            loop = false
        })
    end
end)

-- Custom Audio Play Event
-- Arg: audio: string(Audio File Name), volume: number(Audio Play Volume), loop: boolean(is Audio loop?)
AddEventHandler('audio:client:play', function(audio, volume, loop)
    SendNUIMessage({
        type = 'play',
        audio = audio,
        volume = volume,
        loop = loop
    })
end)

AddEventHandler('gameEventTriggered', function(name, data)
    if name == "CEventNetworkEntityDamage" then
        if data[1] ~= data[2] and data[2] == PlayerPedId() then
            if IsPedAPlayer(data[1]) and IsPedAPlayer(data[2]) then
                TriggerServerEvent('hitmarker:server:hit', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data[2])), GetPedLastDamageBone(data[1]))
            end
        end
    end
end)
