local function Announce()
	if Config.Announce[ESX.PlayerData.job.name] then
		local data = {}
		for k,v in pairs (Config.Announce[ESX.PlayerData.job.name]) do
			if Config.Context then
				data[#data+1] = {
					title = k,
					onSelect = function()
						TriggerServerEvent('fw_announce:Notification', v)
					end
				}
			else
				data[#data+1] = {
					label = k,
					args = {event = v}
				}
			end
		end
		if Config.Context then
			lib.registerContext({
				id = 'menu_announce',
				title = 'Annonces: '..ESX.PlayerData.job.label,
				options = data
			})
			lib.showContext('menu_announce')
		else
			lib.registerMenu({
				id = 'menu_announce',
				title = 'Annonces: '..ESX.PlayerData.job.label,
				position = Config.Position,
				options = data
			}, function(selected, scrollIndex, args)
				TriggerServerEvent('fw_announce:Notification', args.event)
			end)
			lib.showMenu('menu_announce')
		end
	end
end

RegisterCommand('announce', Announce, false)

RegisterKeyMapping('announce', 'Open Announce Menu', 'keyboard', 'f6')
