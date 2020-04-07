
function Notify(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, true)
end

local saverRunning = false


local AutoSaveTimer = 10000 -- ms

function requestSave()

    posX, posY, posZ = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
    local viewAngle = GetEntityHeading(GetPlayerPed(-1))

    TriggerServerEvent('gorok_savepos', posX, posY, posZ, viewAngle)
    Notify('Spielerposition gespeichert')

end

function AutoSave()

    Citizen.CreateThread(function()

        saverRunning = true

        while true do 
            Citizen.Wait(AutoSaveTimer)
            requestSave()
        end
    
    end)

end

RegisterNetEvent('gorok_notify')
AddEventHandler('gorok_notify', function(message)
    Notify(message)
end)

RegisterNetEvent('gorok_spawnlastpos')
AddEventHandler('gorok_spawnlastpos', function(posX, posZ, posY)

    print('Spielerposition geladen')
    SetEntityCoords(GetPlayerPed(-1), posX, posZ, posY, 1, 0, 0, 1)

    if saverRunning then
        return
    else
        AutoSave()
    end

end)

RegisterNetEvent('playerSpawned')
AddEventHandler('playerSpawned', function()

    TriggerServerEvent('gorok_SpawnPlayer')

end)