local isHandcuffed, handcuffTimer = false, {}
dragStatus = {}
dragStatus.isDragged =  false

AddEventHandler('handcuff', function(data)
	local valid = false
	local count = exports.ox_inventory:Search('count', Config.Items)
	if count then
		for name, count in pairs(count) do
			if count ~= 0 then
				valid = true
			end
		end
	end
	if valid then
		TriggerServerEvent('fw_interact:handcuff', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
	else
		lib.notify({
			description = Config.RequiredItem,
			style = {
				backgroundColor = '#000000',
				color = '#ffffff'
			},
			icon = 'people-robbery',
			type = 'error'
		})
	end
end)


RegisterNetEvent('fw_interact:handcuff')
AddEventHandler('fw_interact:handcuff', function()
	isHandcuffed = not isHandcuffed
	if isHandcuffed then
		RequestAnimDict('mp_arresting')
		while not HasAnimDictLoaded('mp_arresting') do
			Wait(100)
		end
		TaskPlayAnim(cache.ped, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
		RemoveAnimDict('mp_arresting')
		SetEnableHandcuffs(cache.ped, true)
		DisablePlayerFiring(cache.ped, true)
		SetCurrentPedWeapon(cache.ped, `WEAPON_UNARMED`, true)
		SetPedCanPlayGestureAnims(cache.ped, false)
		DisplayRadar(false)
		if Config.EnableHandcuffTimer then
			if handcuffTimer.active then
				ESX.ClearTimeout(handcuffTimer.task)
			end
			StartHandcuffTimer()
		end
	else
		dragStatus.isDragged = false
		if Config.EnableHandcuffTimer and handcuffTimer.active then
			ESX.ClearTimeout(handcuffTimer.task)
		end
		ClearPedSecondaryTask(cache.ped)
		SetEnableHandcuffs(cache.ped, false)
		DisablePlayerFiring(cache.ped, false)
		SetPedCanPlayGestureAnims(cache.ped, true)
		DisplayRadar(true)
	end
end)

RegisterNetEvent('fw_interact:unrestrain')
AddEventHandler('fw_interact:unrestrain', function()
	if isHandcuffed then
		isHandcuffed = false
		ClearPedSecondaryTask(cache.ped)
		SetEnableHandcuffs(cache.ped, false)
		DisablePlayerFiring(cache.ped, false)
		SetPedCanPlayGestureAnims(cache.ped, true)
		FreezeEntityPosition(cache.ped, false)
		DisplayRadar(true)
		if Config.EnableHandcuffTimer and handcuffTimer.active then
			ESX.ClearTimeout(handcuffTimer.task)
		end
	end
end)

CreateThread(function()
	while true do
		Wait(0)
		if isHandcuffed then
			DisableControlAction(0, 1, true)
			DisableControlAction(0, 2, true)
			DisableControlAction(0, 24, true)
			DisableControlAction(0, 257, true)
			DisableControlAction(0, 25, true)
			DisableControlAction(0, 263, true)
			DisableControlAction(0, 45, true)
			DisableControlAction(0, 22, true)
			DisableControlAction(0, 44, true)
			DisableControlAction(0, 37, true)
			DisableControlAction(0, 23, true)
			DisableControlAction(0, 288,  true)
			DisableControlAction(0, 289, true)
			DisableControlAction(0, 170, true)
			DisableControlAction(0, 167, true)
			DisableControlAction(0, 0, true)
			DisableControlAction(0, 26, true)
			DisableControlAction(0, 73, true)
			DisableControlAction(2, 199, true)
			DisableControlAction(0, 59, true)
			DisableControlAction(0, 71, true)
			DisableControlAction(0, 72, true)
			DisableControlAction(2, 36, true)
			DisableControlAction(0, 47, true)
			DisableControlAction(0, 264, true)
			DisableControlAction(0, 257, true)
			DisableControlAction(0, 140, true)
			DisableControlAction(0, 141, true)
			DisableControlAction(0, 142, true)
			DisableControlAction(0, 143, true)
			DisableControlAction(0, 75, true)
			DisableControlAction(27, 75, true)
			if IsEntityPlayingAnim(cache.ped, 'mp_arresting', 'idle', 3) ~= 1 then
				ESX.Streaming.RequestAnimDict('mp_arresting', function()
					TaskPlayAnim(cache.ped, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
					RemoveAnimDict('mp_arresting')
				end)
			end
		else
			Wait(500)
		end
	end
end)

AddEventHandler('escort', function(data)
	TriggerServerEvent('fw_interact:escort', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
end)

RegisterNetEvent('fw_interact:escort')-- escort 
AddEventHandler('fw_interact:escort', function(dragger)
	if isHandcuffed or IsPedDeadOrDying(cache.ped, true) then
		dragStatus.isDragged = not dragStatus.isDragged
		dragStatus.dragger = dragger
	end
end)

CreateThread(function()
	local wasDragged
	while true do
		if isHandcuffed then
			TaskPlayAnim(cache.ped, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
		end
		if dragStatus.isDragged then
			Sleep = 50
			
			local targetPed = GetPlayerPed(GetPlayerFromServerId(dragStatus.dragger))
			if DoesEntityExist(targetPed) and IsPedOnFoot(targetPed) and (isHandcuffed or IsPedDeadOrDying(cache.ped, true)) then
				if not wasDragged then
					if Config.npwd then 
						exports.npwd:setPhoneDisabled(true)
					end
					AttachEntityToEntity(ESX.PlayerData.ped, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
					SetEntityCollision(ESX.PlayerData.ped, 1, 1)
					wasDragged = true
				else
					Wait(1000)
				end
			else
				wasDragged = false
				dragStatus.isDragged = false
				DetachEntity(ESX.PlayerData.ped, true, false)
				if Config.npwd then 
					exports.npwd:setPhoneDisabled(false)
				end
			end
		elseif wasDragged then
			wasDragged = false
			DetachEntity(ESX.PlayerData.ped, true, false)
			if Config.npwd then 
				exports.npwd:setPhoneDisabled(false)
			end
			
		end	
		Wait(1500)
	end
end)

function StartHandcuffTimer()
	if Config.EnableHandcuffTimer and handcuffTimer.active then
		ESX.ClearTimeout(handcuffTimer.task)
	end

	handcuffTimer.active = true

	handcuffTimer.task = ESX.SetTimeout(Config.HandcuffTimer, function()
		lib.notify({
			description = Config.Unrestrained_timer,
			style = {
				backgroundColor = '#000000',
				color = '#ffffff'
			},
			icon = 'handcuffs',
			type = 'inform'
		})
		TriggerEvent('fw_interact:unrestrain')
		handcuffTimer.active = false
	end)
end

-- Open inventory
AddEventHandler('search', function(data)
	if IsEntityPlayingAnim(data.entity, "missminuteman_1ig_2", "handsup_base", 3) or IsEntityPlayingAnim(data.entity, "mp_arresting", "idle", 3) or IsPedDeadOrDying(data.entity) then
		exports.ox_inventory:openInventory('player', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
	else
		lib.notify({
			description = Config.ShowNotificationText,
			style = {
				backgroundColor = '#000000',
				color = '#ffffff'
			},
			icon = 'people-robbery',
			type = 'error'
		})
	end
end)

-- Put in vehicle
AddEventHandler('putveh', function(data)
	TriggerServerEvent('fw_interact:putInVehicle', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
end)

RegisterNetEvent('fw_interact:putInVehicle')
AddEventHandler('fw_interact:putInVehicle', function()
	if isHandcuffed then
		local vehicle, distance = ESX.Game.GetClosestVehicle()
		if vehicle and distance < 5 then
			local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)
			for i=maxSeats - 1, 0, -1 do
				if IsVehicleSeatFree(vehicle, i) then
					freeSeat = i
					break
				end
			end
			if freeSeat then
				TaskWarpPedIntoVehicle(cache.ped, vehicle, freeSeat)
				dragStatus.isDragged = false
			end
		end
	end
end)

AddEventHandler('outveh', function(data)
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	if closestPlayer ~= -1 and closestDistance <= 3.0 then
		TriggerServerEvent('fw_interact:OutVehicle', GetPlayerServerId(closestPlayer))
	end
end)

RegisterNetEvent('fw_interact:OutVehicle')
AddEventHandler('fw_interact:OutVehicle', function()
	if IsPedSittingInAnyVehicle(cache.ped) then
		local vehicle = GetVehiclePedIsIn(cache.ped, false)
		TaskLeaveVehicle(cache.ped, vehicle, 64)
	end
end)

AddEventHandler('id', function(data)
	TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)), GetPlayerServerId(PlayerId()))
end)

AddEventHandler('id-driver', function(data)
	TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)), GetPlayerServerId(PlayerId()), 'driver')
end)

RegisterNetEvent('billing', function(data)
	local player = ESX.Game.GetClosestPlayer()
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'unemployed' then
		lib.notify({
			description = Config.Unemployed,
			style = {
				backgroundColor = '#000000',
				color = '#ffffff'
			},
			icon = 'fa-x',
			type = 'error'
		})
	else
		local input = lib.inputDialog(Config.billing_title, {Config.input})
		if input then
			local lockerNumber = tonumber(input[1])
			TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_'..ESX.PlayerData.job.name, (ESX.PlayerData.job.label), lockerNumber)
		end
	end
end)

exports.ox_target:addGlobalPlayer({
	{
		event = "search",
		icon = Config.search_img,
		label = Config.search,
		num = 1
	},
	{
		event = "handcuff",
		icon = Config.handcuff_img,
		label = Config.handcuff,
		num = 2
	},
	{
		event = "escort",
		icon = Config.escort_img,
		label = Config.escort,
		num = 3
	},
	{
		event = "putveh",
		icon = Config.putveh_img,
		label = Config.putveh,
		num = 4
	},
	{
		event = "id",
		icon = Config.ID_img,
		label = Config.ID,
		num = 5
	},
	{
		event = "id-driver",
		icon = Config.ID_driver_img,
		label = Config.ID_driver,
		num = 6
	},
	{
		event = "billing",
		icon = Config.billing_img,
		label = Config.billing,
		num = 7
	},
})

exports.ox_target:addGlobalVehicle({
	{
		event = "outveh",
		icon = Config.outveh_img,
		label = Config.outveh,
		num = 1
	},
})
