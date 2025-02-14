local webhookURL = "DEIN_DISCORD_WEBHOOK_HIER" -- Trage hier deine Discord-Webhook-URL ein

-- Nachricht an Discord senden
function sendDiscordMessage(title, message, color)
    local embed = {
        {
            ["title"] = title,
            ["description"] = message,
            ["color"] = color
        }
    }

    PerformHttpRequest(webhookURL, function(err, text, headers) end, 'POST', json.encode({username = "Job Creator", embeds = embed}), { ['Content-Type'] = 'application/json' })
end

-- Ankündigung bei Job-Erstellung
RegisterNetEvent('jobCreator:announceJob')
AddEventHandler('jobCreator:announceJob', function(jobLabel)
    sendDiscordMessage("Neuer Job erstellt!", jobLabel .. " wurde hinzugefügt und ist jetzt verfügbar!", 65280)
end)
