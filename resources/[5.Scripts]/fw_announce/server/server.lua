RegisterNetEvent('fw_announce:Notification')
AddEventHandler('fw_announce:Notification', function(data)
	local xPlayers = ESX.GetExtendedPlayers()
	for _, xPlayer in pairs(xPlayers) do
		lib.notify(xPlayer.source, data)
	end
end)