--LEAKED BY Topic#0999 https://discord.gg/MPrc3nRaS2
--LEAKED BY Topic#0999 https://discord.gg/MPrc3nRaS2
--LEAKED BY Topic#0999 https://discord.gg/MPrc3nRaS2
--LEAKED BY Topic#0999 https://discord.gg/MPrc3nRaS2
--LEAKED BY Topic#0999 https://discord.gg/MPrc3nRaS2
--LEAKED BY Topic#0999 https://discord.gg/MPrc3nRaS2
--LEAKED BY Topic#0999 https://discord.gg/MPrc3nRaS2
--LEAKED BY Topic#0999 https://discord.gg/MPrc3nRaS2
--LEAKED BY Topic#0999 https://discord.gg/MPrc3nRaS2
--LEAKED BY Topic#0999 https://discord.gg/MPrc3nRaS2
--LEAKED BY Topic#0999 https://discord.gg/MPrc3nRaS2
--LEAKED BY Topic#0999 https://discord.gg/MPrc3nRaS2
--LEAKED BY Topic#0999 https://discord.gg/MPrc3nRaS2
--LEAKED BY Topic#0999 https://discord.gg/MPrc3nRaS2
--LEAKED BY Topic#0999 https://discord.gg/MPrc3nRaS2
--LEAKED BY Topic#0999 https://discord.gg/MPrc3nRaS2
--LEAKED BY Topic#0999 https://discord.gg/MPrc3nRaS2
--LEAKED BY Topic#0999 https://discord.gg/MPrc3nRaS2
--LEAKED BY Topic#0999 https://discord.gg/MPrc3nRaS2
local oldVehicle        = nil
local oldVehicleModel   = nil

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2000)

        local config = SNW.Config or {}
        local blacklistedVehicles = Config.BlacklistedVehicles or {}

        local playerPed = GetPlayerPed(-1)
        local vehicle = GetVehiclePedIsUsing(playerPed)
        local model = GetEntityModel(vehicle)

        if (IsPedInAnyVehicle(playerPed, false)) then
            for blacklistedVehicleName, blacklistedVehicleHash in pairs(blacklistedVehicles) do
                if (IsVehicleModel(vehicle, blacklistedVehicleHash)) then
                    ExecuteCommand('ooc ^1[ 👀SnowiAntiCheat👮‍♂️ ]: POSESION DE VEHICULO ILEGAL')
					--ExecuteCommand('me ^1[ 👀SnowiAntiCheat👮‍♂️ ]: HACKER DETECTADO, POSESION DE VEHICULO ILEGAL')
					ExecuteCommand('report 👀SnowiAntiCheat👮‍♂️ HACKER, TIENE UN COCHE DE BLACKLIST')
                    DeleteVehicle(vehicle)
                    --TriggerServerEvent('snowianticheat:banPlayer', 'hash')
                end
            end
        end

        if (IsPedSittingInAnyVehicle(playerPed)) then
            if (vehicle == oldVehicle and model ~= oldVehicleModel and oldVehicleModel ~= nil and oldVehicleModel ~= 0) then
                N_0xEA386986E786A54F(vehicle)
                ExecuteCommand('ooc ^1[ 👀SnowiAntiCheat👮‍♂️ ]: POSESION DE VEHICULO ILEGAL')
                --ExecuteCommand('me ^1[ 👀SnowiAntiCheat👮‍♂️ ]: HACKER DETECTADO, POSESION DE VEHICULO ILEGAL')
                ExecuteCommand('report 👀SnowiAntiCheat👮‍♂️ HACKER, TIENE UN COCHE DE BLACKLIST')
                --SNW.TriggerServerEvent('snowianticheat:banPlayer', 'hash')
                --SNW.TriggerServerEvent('snowianticheat:banPlayer', 'hash')
                return
            end
        end

        oldVehicle = vehicle
        oldVehicleModel = model
    end
end)

--LEAKED BY Topic#0999 https://discord.gg/MPrc3nRaS2
--LEAKED BY Topic#0999 https://discord.gg/MPrc3nRaS2
--LEAKED BY Topic#0999 https://discord.gg/MPrc3nRaS2
--LEAKED BY Topic#0999 https://discord.gg/MPrc3nRaS2
--LEAKED BY Topic#0999 https://discord.gg/MPrc3nRaS2
--LEAKED BY Topic#0999 https://discord.gg/MPrc3nRaS2
--LEAKED BY Topic#0999 https://discord.gg/MPrc3nRaS2
--LEAKED BY Topic#0999 https://discord.gg/MPrc3nRaS2
--LEAKED BY Topic#0999 https://discord.gg/MPrc3nRaS2
--LEAKED BY Topic#0999 https://discord.gg/MPrc3nRaS2
--LEAKED BY Topic#0999 https://discord.gg/MPrc3nRaS2
--LEAKED BY Topic#0999 https://discord.gg/MPrc3nRaS2
--LEAKED BY Topic#0999 https://discord.gg/MPrc3nRaS2
--LEAKED BY Topic#0999 https://discord.gg/MPrc3nRaS2
--LEAKED BY Topic#0999 https://discord.gg/MPrc3nRaS2
--LEAKED BY Topic#0999 https://discord.gg/MPrc3nRaS2
--LEAKED BY Topic#0999 https://discord.gg/MPrc3nRaS2
--LEAKED BY Topic#0999 https://discord.gg/MPrc3nRaS2
--LEAKED BY Topic#0999 https://discord.gg/MPrc3nRaS2

Citizen.CreateThread(function()
	while true do
		Wait(2000)

		playerPed = GetPlayerPed(-1)
		if playerPed then
			checkCar(GetVehiclePedIsIn(playerPed, false))

			x, y, z = table.unpack(GetEntityCoords(playerPed, true))
			for _, blacklistedCar in pairs(Config.BlacklistedVehicles) do
				checkCar(GetClosestVehicle(x, y, z, 100.0, GetHashKey(blacklistedCar), 70))
			end
		end
	end
end)

--function checkCar(car)
function checkCar(vehicle)
	if vehicle then
        --carModel = GetEntityModel(car)
        vehicleModel = GetEntityModel(vehicle)
		vehicleName = GetDisplayNameFromVehicleModel(vehicleModel)

		if isCarBlacklisted(vehicleModel) then
            --_DeleteEntity(car)
            _DeleteEntity(vehicle)
			sendForbiddenMessage("ESTE VEHICULO ES DE BLACKLIST!")
		end
	end
end

function isCarBlacklisted(model)
	for _, blacklistedCar in pairs(Config.BlacklistedVehicles) do
		if model == GetHashKey(blacklistedCar) then
			return true
		end
	end

	return false
end