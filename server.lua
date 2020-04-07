RegisterServerEvent('gorok_savepos')
AddEventHandler('gorok_savepos', function(posX, posY, posZ, viewAngle)

    local source = source

    local lastPosition = '{' .. posX .. ', ' .. posY .. ', ' .. posZ .. ', ' .. viewAngle .. '}'
    local success = MySQL.Sync.execute('UPDATE users SET `lastpos` = @lastpos WHERE identifier = @username', {['@lastpos'] = lastPosition, ['@username'] = GetPlayerIdentifier(source, 0)})

    print('Saving location for ' .. GetPlayerIdentifier(source, 0))

    if success == 1 then
        print('Erfolgreich gespeichert')
    else
        print('Fehler beim speichern')
    end

end)

RegisterServerEvent('gorok_SpawnPlayer')
AddEventHandler('gorok_SpawnPlayer', function()

    local source = source

    local result = MySQL.Sync.fetchScalar('SELECT lastpos FROM users WHERE identifier = @identifier', {['@identifier'] = GetPlayerIdentifier(source, 0)})
    
    if result ~= nil then 

        local decoded = json.decode(result)

        TriggerClientEvent('gorok_spawnlastpos', source, decoded[1], decoded[2], decoded[3])

    else
        print('Spielerposition konnte nicht geladen werden!')
    end


end)