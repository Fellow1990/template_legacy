function Notification(source, notif_type, message)
    if source and notif_type and message then
        TriggerClientEvent('esx:showNotification', source, message)
    end
end