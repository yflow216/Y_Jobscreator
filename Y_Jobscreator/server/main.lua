ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Überprüfung auf Admin-Rechte
function isAdmin(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    return xPlayer and (xPlayer.getGroup() == 'admin' or xPlayer.getGroup() == 'superadmin')
end

-- Neuen Job erstellen
RegisterServerEvent('jobCreator:createJob')
AddEventHandler('jobCreator:createJob', function(job)
    if isAdmin(source) then
        saveJobToDB(job)
        TriggerClientEvent('esx:showNotification', source, 'Job erstellt: ' .. job.label)
        TriggerEvent('jobCreator:announceJob', job.label)
    else
        TriggerClientEvent('esx:showNotification', source, 'Keine Admin-Rechte!')
    end
end)

-- Alle Jobs beim Serverstart laden
AddEventHandler('onMySQLReady', function()
    loadAllJobs()
end)
