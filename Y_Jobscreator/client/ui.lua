RegisterCommand('jobcreator', function()
    SetNuiFocus(true, true)
    SendNUIMessage({ action = 'open' })
end, false)

RegisterNUICallback('createJob', function(data)
    TriggerServerEvent('jobCreator:createJob', data)
end)

RegisterNUICallback('close', function()
    SetNuiFocus(false, false)
end)
