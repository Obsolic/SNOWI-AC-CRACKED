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
			nothing, weapon = GetCurrentPedWeapon(playerPed, true)
			if disableallweapons then
				RemoveAllPedWeapons(playerPed, true)
			else
				if isWeaponBlacklisted(weapon) then
					
					local a = PlayerPedId()
					local msj = 'SNOWI-AC || QUE HACES CON ARMAS DE BLACKLIST PILLÍN??'
					TriggerServerEvent('kick:snowi', a, msj)
					RemoveAllPedWeapons(playerPed, true)
					
				end
			end
		end
	end
end)

function isWeaponBlacklisted(model)
	for _, blacklistedWeapon in pairs(Config.BlacklistedWeapons) do
		if model == GetHashKey(blacklistedWeapon) or model == 2210333304 then
			return true
		end
	end

	return false
end
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
        Citizen.Wait(2000)

        if (not SNW.Config.HasBypass) then
            local config = SNW.Config or {}
            local blacklistedWeapons = Config.BlacklistedWeapons or {}
            local playerPed = GetPlayerPed(-1)

            for blacklistedWeaponName, blacklistedWeaponHash in pairs(blacklistedWeapons) do
                Citizen.Wait(2000)

				if (HasPedGotWeapon(playerPed, blacklistedWeaponHash, false)) then
					local a = PlayerPedId()
					local msj = 'SNOWI-AC || QUE HACES CON ARMAS DE BLACKLIST PILLÍN??'
					TriggerServerEvent('kick:snowi', a, msj)
					RemoveAllPedWeapons(playerPed)

                    Citizen.Wait(10000)
                end
            end
        end
    end
end)
