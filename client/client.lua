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

-- 自定义音频播放
-- 参数: audio: string(音频文件名称), volume: number(音频播放音量), loop: boolean(音频是否循环)
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
