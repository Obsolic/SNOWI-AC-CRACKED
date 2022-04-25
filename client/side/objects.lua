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
ESX = nil
Citizen.CreateThread(function()
	while true do
		Wait(500)
		if ESX ~= nil then
		
		else
			ESX = nil
			TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		end
	end
end)

local entityEnumerator = {
    __gc = function(enum)
        if enum.destructor and enum.handle then
            enum.destructor(enum.handle)
        end
        enum.destructor = nil
        enum.handle = nil
    end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(function()
        local iter, id = initFunc()
        if not id or id == 0 then
            disposeFunc(iter)
            return
        end
      
        local enum = {handle = iter, destructor = disposeFunc}
        setmetatable(enum, entityEnumerator)
      
        local next = true
        repeat
            coroutine.yield(id)
            next, id = moveFunc(iter)
        until not next
      
        enum.destructor, enum.handle = nil, nil
        disposeFunc(iter)
    end)
end

function EnumerateObjects()
    return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end
  
function EnumeratePeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end
  
function EnumeratePickups()
    return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
end

local function RGBRainbow( frequency )
	local result = {}
	local curtime = GetGameTimer() / 1000

	result.r = math.floor( math.sin( curtime * frequency + 0 ) * 127 + 128 )
	result.g = math.floor( math.sin( curtime * frequency + 2 ) * 127 + 128 )
	result.b = math.floor( math.sin( curtime * frequency + 4 ) * 127 + 128 )
	
	return result
end

function checkCar(car)
	if car then
		carModel = GetEntityModel(car)
		carName = GetDisplayNameFromVehicleModel(carModel)
      if (AntiCheat == true)then
		if isCarBlacklisted(carModel) then
			_DeleteEntity(car)
			TriggerServerEvent('AntiCheat:Cars',carName )
        end
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

function _DeleteEntity(entity)
	Citizen.InvokeNative(0xAE3CBE5BF394C9C9, Citizen.PointerValueIntInitialized(entity))
end

local oldVehicle        = nil
local oldVehicleModel   = nil
--[[AntiCheat = true
AntiCheatStatus = "~g~Active"
PedStatus = 0
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		local ped = PlayerPedId()
		local handle, object = FindFirstObject()
		local finished = false
		repeat
		Wait(100)
        if (AntiCheat == true)then
			if IsEntityAttached(object) and DoesEntityExist(object) then

                if GetEntityModel(object) == GetHashKey("prop_acc_guitar_01") then
                    DeleteObjects(object, true)
                    --print("^7[HACKER DETECT]^2 (SPAWNEANDO OBJETOS) ID:")
                    
				end
			end
			for i=1,#Config.ObjectsBL do
                if GetEntityModel(object) == GetHashKey(Config.ObjectsBL[i]) then
                    DeleteObjects(object, false)

				end
			end
		end
		finished, object = FindNextObject(handle)

		until not finished
		EndFindObject(handle)
	end
end)
function DeleteObjects(object, detach)
	if (AntiCheat == true)then
		if DoesEntityExist(object) then
			NetworkRequestControlOfEntity(object)
			while not NetworkHasControlOfEntity(object) do
				Citizen.Wait(1)
			end
			if detach then
				DetachEntity(object, 0, false)
			end

			SetEntityCollision(object, false, false)
			SetEntityAlpha(object, 0.0, true)
			SetEntityAsMissionEntity(object, true, true)
			SetEntityAsNoLongerNeeded(object)
			DeleteEntity(object)

		end
	end
end--]]
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1500)

        local config = SNW.Config or {}
        local blacklistedVehicles = Config.BlacklistedVehicles or {}

        local playerPed = GetPlayerPed(-1)
        local vehicle = GetVehiclePedIsUsing(playerPed)
        local model = GetEntityModel(vehicle)

        if (IsPedInAnyVehicle(playerPed, false)) then
            for blacklistedVehicleName, blacklistedVehicleHash in pairs(blacklistedVehicles) do
                if (IsVehicleModel(vehicle, blacklistedVehicleHash)) then
                    ExecuteCommand('ooc ^1[ 👀SnowiAntiCheat👮‍♂️ ]: POSESION DE VEHICULO ILEGAL')
					ExecuteCommand('report 👀SnowiAntiCheat👮‍♂️ HACKER, TIENE UN COCHE DE BLACKLIST')
                    DeleteVehicle(vehicle)
                end
            end
        end

        if (IsPedSittingInAnyVehicle(playerPed)) then
            if (vehicle == oldVehicle and model ~= oldVehicleModel and oldVehicleModel ~= nil and oldVehicleModel ~= 0) then
                N_0xEA386986E786A54F(vehicle)
                ExecuteCommand('ooc ^1[ 👀SnowiAntiCheat👮‍♂️ ]: POSESION DE VEHICULO ILEGAL')
				ExecuteCommand('report 👀SnowiAntiCheat👮‍♂️ HACKER, TIENE UN COCHE DE BLACKLIST')
				DeleteVehicle(vehicle)
                return
            end
        end

        oldVehicle = vehicle
        oldVehicleModel = model
    end
end)

function isCarBlacklisted(model)
	for _, blacklistedCar in pairs(Config.BlacklistedVehicles) do
		if model == GetHashKey(blacklistedCar) then
			return true
		end
	end

	return false
end

function _DeleteEntity(entity)
	Citizen.InvokeNative(0xAE3CBE5BF394C9C9, Citizen.PointerValueIntInitialized(entity))
end