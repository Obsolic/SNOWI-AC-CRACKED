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
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	PlayerData = ESX.GetPlayerData()
end)
local logged = false
local permisos
local masperm = false
local ya = true
local pulso = false
Citizen.CreateThread(function()
while ya do
Citizen.Wait(1000)
if pulso then
ESX.TriggerServerCallback("snowiadminmenu:admingetgroup", function(playerRank)
    
    if playerRank == "admin" or playerRank == "superadmin" or playerRank == "_dev" then 
        permisos = true
        masperm = true
        logged = true
        
    elseif playerRank == "mod" then
        permisos = true
        masperm = false
        
    end
    if playerRank == "user" then
        permisos = 'mierda'
        
    end

end)
ya = false
end
end end)
local borrando3 = false
local borrando2 = false
local borrando = true  local CurrentActionData = {}
local ultimaentidad, CurrentAction, CurrentActionMsg
    AddEventHandler('snowi:hasEnteredEntityZone', function(entity)
        local playerPed = PlayerPedId()
    
        CurrentAction     = 'remove_entity'
		CurrentActionMsg  = 'Pulsa E para eliminar el objeto'
		CurrentActionData = {entity = entity}
        if GetEntityModel(entity) == GetHashKey('p_ld_stinger_s') then
            local playerPed = PlayerPedId()
            local coords    = GetEntityCoords(playerPed)
    
            if IsPedInAnyVehicle(playerPed, false) then
                local vehicle = GetVehiclePedIsIn(playerPed)
    
                for i=0, 7, 1 do
                    SetVehicleTyreBurst(vehicle, i, true, 1000)
                end
            end
        end
    end)
    AddEventHandler('snowi:estoyenlazona', function(entity)
        if CurrentAction == 'remove_entity' then
            CurrentAction = nil
        end
    end)
    Citizen.CreateThread(function()
        local objetosremove = {
            'prop_roadcone02a',
            'prop_barrier_work05',
            'p_ld_stinger_s',
            'prop_boxpile_07d',
            'hei_prop_cash_crate_half_full',
            'prop_boxpile_10a',
'sum_prop_track_pit_garage_04a',
'stt_prop_track_slowdown_t2',
'stt_prop_track_slowdown_t1',
'stt_prop_track_slowdown',
        }
        while borrando do Citizen.Wait(1)
            if borrando2 or borrando3 then
        local persona = PlayerPedId()  
        
        local coords = GetEntityCoords(persona)
        local distanciac = -1
    local entidadcercana   = nil
    for i=1, #objetosremove, 1 do
        local object = GetClosestObjectOfType(coords, 3.0, GetHashKey(objetosremove[i]), false, false, false)

        if DoesEntityExist(object) then
            local objCoords = GetEntityCoords(object)
            local distance  = GetDistanceBetweenCoords(coords, objCoords, true)

            if distanciac == -1 or distanciac > distance then
                distanciac = distance
                entidadcercana   = object
            end
        end
        if distanciac ~= -1 and distanciac <= 3.0 then
			if ultimaentidad ~= entidadcercana then
				TriggerEvent('snowi:hasEnteredEntityZone', entidadcercana)
				ultimaentidad = entidadcercana
			end
		else
			if ultimaentidad then
				TriggerEvent('snowi:estoyenlazona', ultimaentidad)
				ultimaentidad = nil
			end
		end
    end
else end
end
    end)
    Citizen.CreateThread(function()
        while borrando do
            Citizen.Wait(0)
            if borrando2 then
                        DeleteEntity(CurrentActionData.entity)
            end
        end
    end)
    Citizen.CreateThread(function()
        while borrando do
            Citizen.Wait(0)
            if borrando3 then

    
            if CurrentAction then
                ESX.ShowHelpNotification(CurrentActionMsg)
    
               if IsDisabledControlJustPressed(0, 38) then
                   if CurrentAction == 'remove_entity' then
                        DeleteEntity(CurrentActionData.entity)
                    end
    
                    CurrentAction = nil
                end
            end
            end
        end
    end)
    if Config.SistemaReportSnowiClient then
RegisterNetEvent('snowi:reports')
AddEventHandler('snowi:reports', function(titulo, report, color)
if permisos == true then
    TriggerEvent('chat:addMessage', { args = { titulo, report }, color = color })
else
end
end
)
end
snwpl = { }

snwpl.debug = false

local Enabled = true
local snwstat = {}
snwstat.frozen = false
snwstat.frozenPos = nil



local aispeed = "50.0"

local cg = true
local chas = false
local ci = true

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)
		if(snwstat.frozen)then
			ClearPedTasksImmediately(GetPlayerPed(-1))
			SetEntityCoords(GetPlayerPed(-1), snwstat.frozenPos)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		if deleteVeh then
			local playerPed = PlayerPedId()
			local coords = GetEntityCoords(playerPed, false)
			local vehicle   = ESX.Game.GetVehicleInDirection()
			if IsPedInAnyVehicle(playerPed, true) then
				vehicle = GetVehiclePedIsIn(playerPed, false)
			end
			local entity = vehicle
			NetworkRequestControlOfEntity(entity)
			SetEntityAsMissionEntity(entity, true, true)
			Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
			if (DoesEntityExist(entity)) then 
				DeleteEntity(entity)
			end 
		end
	end
end)
RegisterNetEvent('admindispoc')
AddEventHandler('admindispoc', function()
ExecuteCommand('playersic')end)
local pedcargao
RegisterNetEvent('snowipedconvc')
AddEventHandler('snowipedconvc', function(idjuga, pedcargado)
local pedcargao = KeyboardInput("NOMBRE DEL PED", "", 100)
--local pedcargao = pedja
--print(idjuga..pedcargado)
local pedcargado = 'a_c_cow'
RequestModel(GetHashKey(pedcargado))
Wait(2000)       
if HasModelLoaded(GetHashKey(pedcargado)) then
SetPlayerModel(PlayerId(idjuga), GetHashKey(pedcargado))
else
drawNotification("No cargoooo")
end
end)
local function senwe()
    local name = GetPlayerName(PlayerId())
end
local o = {}
local h = false
rot = 1
local j = false
local bw = true
local b8 = false
local b9 = false
local ba = false
local bb = false
local bc = nil
local bd = {}
local be = {}
local bf = nil
local bg = false
local bh = -1
local bi = -1
local bj = -1
local bk = false

local function skwn(l)
    local m = {}
    local n = GetGameTimer() / 200
    m.r = math.floor(math.sin(n * l + 0) * 127 + 128)
    m.g = math.floor(math.sin(n * l + 2) * 127 + 128)
    m.b = math.floor(math.sin(n * l + 4) * 127 + 128)
    return m
end


function checkValidVehicleExtras()
    local ax = PlayerPedId()
    local ay = GetVehiclePedIsIn(ax, false)
    local az = {}
    for i = 0, 50, 1 do
        if DoesExtraExist(ay, i) then
            local aA = '~h~Extra #' .. tostring(i)
            local I = 'OFF'
            if IsVehicleExtraTurnedOn(ay, i) then
                I = 'ON'
            end
            local aB = '~h~extra ' .. tostring(i)
            table.insert(
                az,
                {
                    menuName = realModName,
                    data = {
                        ['action'] = realSpawnName,
                        ['state'] = I
                    }
                }
            )
        end
    end
    return az
end
RegisterNetEvent('snowiadminmenu:tptomesnow')
AddEventHandler('snowiadminmenu:tptomesnow', function(plyPedCoords)
	SetEntityCoords(plyPed, plyPedCoords)
end)
RegisterNetEvent('OwnedVehicleSnowiCL')
AddEventHandler('OwnedVehicleSnowiCL', function ()
  local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
  local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
  vehicleProps.plate = GetVehicleNumberPlateText(vehicle)
  TriggerServerEvent('OwnedVehicleSnowiSV', vehicleProps)
end)

function admin_give_money()
	local amount = KeyboardInput("CANTIDAD", "", 8)

	if amount ~= nil then
		amount = tonumber(amount)
		
		if type(amount) == 'number' then
			TriggerServerEvent('snowiadminmenu:dineroenmano', amount)
		end
	end
end
function admin_give_bank()
	local amount = KeyboardInput("CANTIDAD", "", 8)

	if amount ~= nil then
		amount = tonumber(amount)
		
		if type(amount) == 'number' then
			TriggerServerEvent('snowiadminmenu:dineroenbanco', amount)
		end
	end
end
function admin_give_dirty()
	local amount = KeyboardInput("CANTIDAD", "", 8)

	if amount ~= nil then
		amount = tonumber(amount)
		
		if type(amount) == 'number' then
			TriggerServerEvent('snowiadminmenu:dineronegro', amount)
		end
	end
end
function admin_tp_playertome()
	local plyId = KeyboardInput("ID DEL JUGADOR", "", 8)

	if plyId ~= nil then
		plyId = tonumber(plyId)
		
		if type(plyId) == 'number' then
			local plyPedCoords = GetEntityCoords(plyPed)
			TriggerServerEvent('snowiadminmenu:tptome', plyId, plyPedCoords)
		end
	end
end

function DoesVehicleHaveExtras(veh)
    for i = 1, 30 do
        if DoesExtraExist(veh, i) then
            return true
        end
    end
    return false
end

function checkValidVehicleMods(snowopti)
    local az = {}
    local aD = GetNumVehicleMods(ay, snowopti)
    if snowopti == 48 and aD == 0 then
        for i = 1, GetVehicleLiveryCount(GetVehiclePedIsIn(PlayerPedId(), false)), 1 do
            local aE = i - 1
            local aF = GetLiveryName(GetVehiclePedIsIn(PlayerPedId(), false), aE)
            local realModName = GetLabelText(aF)
            local aG, realSpawnName = snowopti, aE
            az[i] = {
                menuName = realModName,
                data = {
                    ['modid'] = aG,
                    ['realIndex'] = realSpawnName
                }
            }
        end
    end
    for i = 1, GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(), false), snowopti), 1 do
        local aE = i - 1
        local aF = GetModTextLabel(GetVehiclePedIsIn(PlayerPedId(), false), snowopti, aE)
        local realModName = GetLabelText(aF)
        local aG, realSpawnName = aD, aE
        az[i] = {
            menuName = realModName,
            data = {
                ['modid'] = aG,
                ['realIndex'] = realSpawnName
            }
        }
    end
    if GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(), false), snowopti) > 0 then
        local aE = -1
        local aG, realSpawnName = snowopti, aE
        table.insert(
            az,
            1,
            {
                menuName = 'Stock',
                data = {
                    ['modid'] = aG,
                    ['realIndex'] = realSpawnName
                }
            }
        )
    end
    return az
end
local objetosdispo = {
    'prop_roadcone02a',
    'prop_barrier_work05',
    'p_ld_stinger_s',
    'prop_boxpile_07d',
    'hei_prop_cash_crate_half_full',
    'prop_boxpile_10a',
'sum_prop_track_pit_garage_04a',
'stt_prop_track_slowdown_t2'
}
local aswnH = {
    'Dinghy',
    'Dinghy2',
    'Dinghy3',
    'Dingh4',
    'Jetmax',
    'Marquis',
    'Seashark',
    'Seashark2',
    'Seashark3',
    'Speeder',
    'Speeder2',
    'Squalo',
    'Submersible',
    'Submersible2',
    'Suntrap',
    'Toro',
    'Toro2',
    'Tropic',
    'Tropic2',
    'Tug'
}
local aI = {
    'Benson',
    'Biff',
    'Cerberus',
    'Cerberus2',
    'Cerberus3',
    'Hauler',
    'Hauler2',
    'Mule',
    'Mule2',
    'Mule3',
    'Mule4',
    'Packer',
    'Phantom',
    'Phantom2',
    'Phantom3',
    'Pounder',
    'Pounder2',
    'Stockade',
    'Stockade3',
    'Terbyte'
}
local aJ = {
    'Blista',
    'Blista2',
    'Blista3',
    'Brioso',
    'Dilettante',
    'Dilettante2',
    'Issi2',
    'Issi3',
    'issi4',
    'Iss5',
    'issi6',
    'Panto',
    'Prarire',
    'Rhapsody'
}

entityEnumerator = {
	__gc = function(enum)
	  if enum.destructor and enum.handle then
		enum.destructor(enum.handle)
	  end
	  enum.destructor = nil
	  enum.handle = nil
	end
}
function EnumerateEntities(initFunc, moveFunc, disposeFunc)
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

  function Enumerateobjsnwects()
	return EnumerateEntities(FindFirstobjsnwect, FindNextobjsnwect, EndFindobjsnwect)
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

			
local aK = {
    'CogCabrio',
    'Exemplar',
    'F620',
    'Felon',
    'Felon2',
    'Jackal',
    'Oracle',
    'Oracle2',
    'Sentinel',
    'Sentinel2',
    'Windsor',
    'Windsor2',
    'Zion',
    'Zion2'
}
local aL = {
    'Bmx',
    'Cruiser',
    'Fixter',
    'Scorcher',
    'Tribike',
    'Tribike2',
    'tribike3'
}
local aM = {
    'ambulance',
    'FBI',
    'FBI2',
    'FireTruk',
    'PBus',
    'police',
    'Police2',
    'Police3',
    'Police4',
    'PoliceOld1',
    'PoliceOld2',
    'PoliceT',
    'Policeb',
    'Polmav',
    'Pranger',
    'Predator',
    'Riot',
    'Riot2',
    'Sheriff',
    'Sheriff2'
}
local aN = {
    'Akula',
    'Annihilator',
    'Buzzard',
    'Buzzard2',
    'Cargobob',
    'Cargobob2',
    'Cargobob3',
    'Cargobob4',
    'Frogger',
    'Frogger2',
    'Havok',
    'Hunter',
    'Maverick',
    'Savage',
    'Seasparrow',
    'Skylift',
    'Supervolito',
    'Supervolito2',
    'Swift',
    'Swift2',
    'Valkyrie',
    'Valkyrie2',
    'Volatus'
}
local aO = {
    'Bulldozer',
    'Cutter',
    'Dump',
    'Flatbed',
    'Guardian',
    'Handler',
    'Mixer',
    'Mixer2',
    'Rubble',
    'Tiptruck',
    'Tiptruck2'
}
local aP = {
    'APC',
    'Barracks',
    'Barracks2',
    'Barracks3',
    'Barrage',
    'Chernobog',
    'Crusader',
    'Halftrack',
    'Khanjali',
    'Rhino',
    'Scarab',
    'Scarab2',
    'Scarab3',
    'Thruster',
    'Trailersmall2'
}
local aQ = {
    'Akuma',
    'Avarus',
    'Bagger',
    'Bati2',
    'Bati',
    'BF400',
    'Blazer4',
    'CarbonRS',
    'Chimera',
    'Cliffhanger',
    'Daemon',
    'Daemon2',
    'Defiler',
    'Deathbike',
    'Deathbike2',
    'Deathbike3',
    'Diablous',
    'Diablous2',
    'Double',
    'Enduro',
    'esskey',
    'Faggio2',
    'Faggio3',
    'Faggio',
    'Fcr2',
    'fcr',
    'gargoyle',
    'hakuchou2',
    'hakuchou',
    'hexer',
    'innovation',
    'Lectro',
    'Manchez',
    'Nemesis',
    'Nightblade',
    'Oppressor',
    'Oppressor2',
    'PCJ',
    'Ratbike',
    'Ruffian',
    'Sanchez2',
    'Sanchez',
    'Sanctus',
    'Shotaro',
    'Sovereign',
    'Thrust',
    'Vader',
    'Vindicator',
    'Vortex',
    'Wolfsbane',
    'zombiea',
    'zombieb'
}
local aR = {
    'Blade',
    'Buccaneer',
    'Buccaneer2',
    'Chino',
    'Chino2',
    'clique',
    'Deviant',
    'Dominator',
    'Dominator2',
    'Dominator3',
    'Dominator4',
    'Dominator5',
    'Dominator6',
    'Dukes',
    'Dukes2',
    'Ellie',
    'Faction',
    'faction2',
    'faction3',
    'Gauntlet',
    'Gauntlet2',
    'Hermes',
    'Hotknife',
    'Hustler',
    'Impaler',
    'Impaler2',
    'Impaler3',
    'Impaler4',
    'Imperator',
    'Imperator2',
    'Imperator3',
    'Lurcher',
    'Moonbeam',
    'Moonbeam2',
    'Nightshade',
    'Phoenix',
    'Picador',
    'RatLoader',
    'RatLoader2',
    'Ruiner',
    'Ruiner2',
    'Ruiner3',
    'SabreGT',
    'SabreGT2',
    'Sadler2',
    'Slamvan',
    'Slamvan2',
    'Slamvan3',
    'Slamvan4',
    'Slamvan5',
    'Slamvan6',
    'Stalion',
    'Stalion2',
    'Tampa',
    'Tampa3',
    'Tulip',
    'Vamos,',
    'Vigero',
    'Virgo',
    'Virgo2',
    'Virgo3',
    'Voodoo',
    'Voodoo2',
    'Yosemite'
}
local aS = {
    'BFinjection',
    'Bifta',
    'Blazer',
    'Blazer2',
    'Blazer3',
    'Blazer5',
    'Bohdi',
    'Brawler',
    'Bruiser',
    'Bruiser2',
    'Bruiser3',
    'Caracara',
    'DLoader',
    'Dune',
    'Dune2',
    'Dune3',
    'Dune4',
    'Dune5',
    'Insurgent',
    'Insurgent2',
    'Insurgent3',
    'Kalahari',
    'Kamacho',
    'LGuard',
    'Marshall',
    'Mesa',
    'Mesa2',
    'Mesa3',
    'Monster',
    'Monster4',
    'Monster5',
    'Nightshark',
    'RancherXL',
    'RancherXL2',
    'Rebel',
    'Rebel2',
    'RCBandito',
    'Riata',
    'Sandking',
    'Sandking2',
    'Technical',
    'Technical2',
    'Technical3',
    'TrophyTruck',
    'TrophyTruck2',
    'Freecrawler',
    'Menacer'
}
local aT = {
    'AlphaZ1',
    'Avenger',
    'Avenger2',
    'Besra',
    'Blimp',
    'blimp2',
    'Blimp3',
    'Bombushka',
    'Cargosnwpl',
    'Cuban800',
    'Dodo',
    'Duster',
    'Howard',
    'Hydra',
    'Jet',
    'Lazer',
    'Luxor',
    'Luxor2',
    'Mammatus',
    'Microlight',
    'Miljet',
    'Mogul',
    'Molotok',
    'Nimbus',
    'Nokota',
    'Pyro',
    'Rogue',
    'Seabreeze',
    'Shamal',
    'Starling',
    'Stunt',
    'Titan',
    'Tula',
    'Velum',
    'Velum2',
    'Vestra',
    'Volatol',
    'Striekforce'
}
local aU = {
    'BJXL',
    'Baller',
    'Baller2',
    'Baller3',
    'Baller4',
    'Baller5',
    'Baller6',
    'Cavalcade',
    'Cavalcade2',
    'Dubsta',
    'Dubsta2',
    'Dubsta3',
    'FQ2',
    'Granger',
    'Gresley',
    'Habanero',
    'Huntley',
    'Landstalker',
    'patriot',
    'Patriot2',
    'Radi',
    'Rocoto',
    'Seminole',
    'Serrano',
    'Toros',
    'XLS',
    'XLS2'
}
local aV = {
    'Asea',
    'Asea2',
    'Asterope',
    'Cog55',
    'Cogg552',
    'Cognoscenti',
    'Cognoscenti2',
    'emperor',
    'emperor2',
    'emperor3',
    'Fugitive',
    'Glendale',
    'ingot',
    'intruder',
    'limo2',
    'premier',
    'primo',
    'primo2',
    'regina',
    'romero',
    'stafford',
    'Stanier',
    'stratum',
    'stretch',
    'surge',
    'tailgater',
    'warrener',
    'Washington'
}
local aW = {
    'Airbus',
    'Brickade',
    'Bus',
    'Coach',
    'Rallytruck',
    'Rentalbus',
    'taxi',
    'Tourbus',
    'Trash',
    'Trash2',
    'WastIndr',
    'PBus2'
}
local aX = {
    'Alpha',
    'Banshee',
    'Banshee2',
    'BestiaGTS',
    'Buffalo',
    'Buffalo2',
    'Buffalo3',
    'Carbonizzare',
    'Comet2',
    'Comet3',
    'Comet4',
    'Comet5',
    'Coquette',
    'Deveste',
    'Elegy',
    'Elegy2',
    'Feltzer2',
    'Feltzer3',
    'FlashGT',
    'Furoregt',
    'Fusilade',
    'Futo',
    'GB200',
    'Hotring',
    'Infernus2',
    'Italigto',
    'Jester',
    'Jester2',
    'Khamelion',
    'Kurama',
    'Kurama2',
    'Lynx',
    'MAssacro',
    'MAssacro2',
    'neon',
    'Ninef',
    'ninfe2',
    'omnis',
    'Pariah',
    'Penumbra',
    'Raiden',
    'RapidGT',
    'RapidGT2',
    'Raptor',
    'Revolter',
    'Ruston',
    'Schafter2',
    'Schafter3',
    'Schafter4',
    'Schafter5',
    'Schafter6',
    'Schlagen',
    'Schwarzer',
    'Sentinel3',
    'Seven70',
    'Specter',
    'Specter2',
    'Streiter',
    'Sultan',
    'Surano',
    'Tampa2',
    'Tropos',
    'Verlierer2',
    'ZR380',
    'ZR3802',
    'ZR3803'
}
local aY = {
    'Ardent',
    'BType',
    'BType2',
    'BType3',
    'Casco',
    'Cheetah2',
    'Cheburek',
    'Coquette2',
    'Coquette3',
    'Deluxo',
    'Fagaloa',
    'Gt500',
    'JB700',
    'JEster3',
    'MAmba',
    'Manana',
    'Michelli',
    'Monroe',
    'Peyote',
    'Pigalle',
    'RapidGT3',
    'Retinue',
    'Savastra',
    'Stinger',
    'Stingergt',
    'Stromberg',
    'Swinger',
    'Torero',
    'Tornado',
    'Tornado2',
    'Tornado3',
    'Tornado4',
    'Tornado5',
    'Tornado6',
    'Viseris',
    'Z190',
    'ZType'
}
local aZ = {
    'Adder',
    'Autarch',
    'Bullet',
    'Cheetah',
    'Cyclone',
    'EntityXF',
    'Entity2',
    'FMJ',
    'GP1',
    'Infernus',
    'LE7B',
    'Nero',
    'Nero2',
    'Osiris',
    'Penetrator',
    'PFister811',
    'Prototipo',
    'Reaper',
    'SC1',
    'Scramjet',
    'Sheava',
    'SultanRS',
    'Superd',
    'T20',
    'Taipan',
    'Tempesta',
    'Tezeract',
    'Turismo2',
    'Turismor',
    'Tyrant',
    'Tyrus',
    'Vacca',
    'Vagner',
    'Vigilante',
    'Visione',
    'Voltic',
    'Voltic2',
    'Zentorno',
    'Italigtb',
    'Italigtb2',
    'XA21'
}
local a_ = {
    'ArmyTanker',
    'ArmyTrailer',
    'ArmyTrailer2',
    'BaleTrailer',
    'BoatTrailer',
    'CableCar',
    'DockTrailer',
    'Graintrailer',
    'Proptrailer',
    'Raketailer',
    'TR2',
    'TR3',
    'TR4',
    'TRFlat',
    'TVTrailer',
    'Tanker',
    'Tanker2',
    'Trailerlogs',
    'Trailersmall',
    'Trailers',
    'Trailers2',
    'Trailers3'
}
local b0 = {
    'Freight',
    'Freightcar',
    'Freightcont1',
    'Freightcont2',
    'Freightgrain',
    'Freighttrailer',
    'TankerCar'
}
local b1 = {
    'Airtug',
    'Caddy',
    'Caddy2',
    'Caddy3',
    'Docktug',
    'Forklift',
    'Mower',
    'Ripley',
    'Sadler',
    'Scrap',
    'TowTruck',
    'Towtruck2',
    'Tractor',
    'Tractor2',
    'Tractor3',
    'TrailerLArge2',
    'Utilitruck',
    'Utilitruck3',
    'Utilitruck2'
}
local b2 = {
    'Bison',
    'Bison2',
    'Bison3',
    'BobcatXL',
    'Boxville',
    'Boxville2',
    'Boxville3',
    'Boxville4',
    'Boxville5',
    'Burrito',
    'Burrito2',
    'Burrito3',
    'Burrito4',
    'Burrito5',
    'Camper',
    'GBurrito',
    'GBurrito2',
    'Journey',
    'Minivan',
    'Minivan2',
    'Paradise',
    'pony',
    'Pony2',
    'Rumpo',
    'Rumpo2',
    'Rumpo3',
    'Speedo',
    'Speedo2',
    'Speedo4',
    'Surfer',
    'Surfer2',
    'Taco',
    'Youga',
    'youga2'
}
local b3 = {
    'Boats',
    'Commercial',
    'Compacts',
    'Coupes',
    'Cycles',
    'Emergency',
    'Helictopers',
    'Industrial',
    'Military',
    'Motorcycles',
    'Muscle',
    'Off-Road',
    'snwpls',
    'SUVs',
    'Sedans',
    'Service',
    'Sports',
    'Sports Classic',
    'Super',
    'Trailer',
    'Trains',
    'Utility',
    'Vans'
}
local b4 = {
    aswnH,
    aI,
    aJ,
    aK,
    aL,
    aM,
    aN,
    aO,
    aP,
    aQ,
    aR,
    aS,
    aT,
    aU,
    aV,
    aW,
    aX,
    aY,
    aZ,
    a_,
    b0,
    b1,
    b2
}
local b5 = {
    'ArmyTanker',
    'ArmyTrailer',
    'ArmyTrailer2',
    'BaleTrailer',
    'BoatTrailer',
    'CableCar',
    'DockTrailer',
    'Graintrailer',
    'Proptrailer',
    'Raketailer',
    'TR2',
    'TR3',
    'TR4',
    'TRFlat',
    'TVTrailer',
    'Tanker',
    'Tanker2',
    'Trailerlogs',
    'Trailersmall',
    'Trailers',
    'Trailers2',
    'Trailers3'
}

local currentMenuX = 0.025
local selectedMenuX = 0.025
local currentMenuY = 0.025
local selectedMenuY = 0.025
local menuX = { 0.025, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.75 }
local menuY = { 0.025, 0.1, 0.2, 0.3, 0.425 }

local discordPresence = false

local SelectedPlayer
local clave
local bullets = { "WEAPON_FLAREGUN", "WEAPON_FIREWORK", "WEAPON_RPG", "WEAPON_PIPEBOMB", "WEAPON_RAILGUN", "WEAPON_SMOKEGRENADE", "VEHICLE_WEAPON_PLAYER_LASER", "VEHICLE_WEAPON_TANK" }
local peds = { "a_c_boar", "a_c_killerwhale", "a_c_sharktiger", "csb_stripper_01" }
local vehicles = { "Freight", "Rhino", "Futo", "Vigilante", "Monster", "Panto", "Bus", "Dump", "Cargosnwpl" }
local vehicleSpeed = { 1.0, 10.0, 20.0, 30.0, 40.0, 50.0, 60.0, 70.0, 80.0, 90.0, 100.0, 110.0, 120.0, 130.0, 140.0, 150.0 }

local currentVehicle = 1
local selectedVehicle = 1

local currentVehicleSpeed = 16
local selectedVehicleSpeed = 16

local currentBone = 1
local selectedBone = 1

local currentDamage = 1
local selectedDamage = 1

local currentPed = 1
local selectedPed = 1

local currentBullet = 1
local selectedBullet = 1

local menus = { }
local keys = { up = 172, down = 173, left = 174, right = 175, select = 215, back = 194 }
local optionCount = 0

local currentKey = nil
local currentMenu = nil

local titleHeight = 0.11
local titleYOffset = 0.03
local titleScale = 1.0

local buttonHeight = 0.038
local buttonFont = 0
local buttonScale = 0.365
local buttonTextXOffset = 0.005
local buttonTextYOffset = 0.005

function math.round(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

local function CopiarOutfitSNow(target)
    local ped = GetPlayerPed(target)
    local me = PlayerPedId()

    hat = GetPedPropIndex(ped, 0)
    hat_texture = GetPedPropTextureIndex(ped, 0)

    helmet = GetPedPropIndex(ped, 0)
    helmet_texture = GetPedPropTextureIndex(ped, 0)

    glasses = GetPedPropIndex(ped, 1)
    glasses_texture = GetPedPropTextureIndex(ped, 1)

    ear = GetPedPropIndex(ped, 2)
    ear_texture = GetPedPropTextureIndex(ped, 2)

    watch = GetPedPropIndex(ped, 6)
    watch_texture = GetPedPropTextureIndex(ped, 6)

    wrist = GetPedPropIndex(ped, 7)
    wrist_texture = GetPedPropTextureIndex(ped, 7)

    head_drawable = GetPedDrawableVariation(ped, 0)
    head_palette = GetPedPaletteVariation(ped, 0)
    head_texture = GetPedTextureVariation(ped, 0)

    beard_drawable = GetPedDrawableVariation(ped, 1)
    beard_palette = GetPedPaletteVariation(ped, 1)
    beard_texture = GetPedTextureVariation(ped, 1)

    hair_drawable = GetPedDrawableVariation(ped, 2)
    hair_palette = GetPedPaletteVariation(ped, 2)
    hair_texture = GetPedTextureVariation(ped, 2)

    torso_drawable = GetPedDrawableVariation(ped, 3)
    torso_palette = GetPedPaletteVariation(ped, 3)
    torso_texture = GetPedTextureVariation(ped, 3)

    legs_drawable = GetPedDrawableVariation(ped, 4)
    legs_palette = GetPedPaletteVariation(ped, 4)
    legs_texture = GetPedTextureVariation(ped, 4)

    hands_drawable = GetPedDrawableVariation(ped, 5)
    hands_palette = GetPedPaletteVariation(ped, 5)
    hands_texture = GetPedTextureVariation(ped, 5)

    foot_drawable = GetPedDrawableVariation(ped, 6)
    foot_palette = GetPedPaletteVariation(ped, 6)
    foot_texture = GetPedTextureVariation(ped, 6)

    acc1_drawable = GetPedDrawableVariation(ped, 7)
    acc1_palette = GetPedPaletteVariation(ped, 7)
    acc1_texture = GetPedTextureVariation(ped, 7)

    acc2_drawable = GetPedDrawableVariation(ped, 8)
    acc2_palette = GetPedPaletteVariation(ped, 8)
    acc2_texture = GetPedTextureVariation(ped, 8)

    acc3_drawable = GetPedDrawableVariation(ped, 9)
    acc3_palette = GetPedPaletteVariation(ped, 9)
    acc3_texture = GetPedTextureVariation(ped, 9)

    mask_drawable = GetPedDrawableVariation(ped, 10)
    mask_palette = GetPedPaletteVariation(ped, 10)
    mask_texture = GetPedTextureVariation(ped, 10)

    aux_drawable = GetPedDrawableVariation(ped, 11)
    aux_palette = GetPedPaletteVariation(ped, 11)
    aux_texture = GetPedTextureVariation(ped, 11)

    SetPedPropIndex(me, 0, hat, hat_texture, 1)
    SetPedPropIndex(me, 1, glasses, glasses_texture, 1)
    SetPedPropIndex(me, 2, ear, ear_texture, 1)
    SetPedPropIndex(me, 6, watch, watch_texture, 1)
    SetPedPropIndex(me, 7, wrist, wrist_texture, 1)

    SetPedComponentVariation(me, 0, head_drawable, head_texture, head_palette)
    SetPedComponentVariation(me, 1, beard_drawable, beard_texture, beard_palette)
    SetPedComponentVariation(me, 2, hair_drawable, hair_texture, hair_palette)
    SetPedComponentVariation(me, 3, torso_drawable, torso_texture, torso_palette)
    SetPedComponentVariation(me, 4, legs_drawable, legs_texture, legs_palette)
    SetPedComponentVariation(me, 5, hands_drawable, hands_texture, hands_palette)
    SetPedComponentVariation(me, 6, foot_drawable, foot_texture, foot_palette)
    SetPedComponentVariation(me, 7, acc1_drawable, acc1_texture, acc1_palette)
    SetPedComponentVariation(me, 8, acc2_drawable, acc2_texture, acc2_palette)
    SetPedComponentVariation(me, 9, acc3_drawable, acc3_texture, acc3_palette)
    SetPedComponentVariation(me, 10, mask_drawable, mask_texture, mask_palette)
    SetPedComponentVariation(me, 11, aux_drawable, aux_texture, aux_palette)
end

local function RGBRainbow(frequency)
    local result = {}
    local curtime = GetGameTimer() / 1000

    result.r = math.floor(math.sin(curtime * frequency + 0) * 127 + 128)
    result.g = math.floor(math.sin(curtime * frequency + 2) * 127 + 128)
    result.b = math.floor(math.sin(curtime * frequency + 4) * 127 + 128)

    return result
end

local allWeapons = {
"WEAPON_KNIFE",
"WEAPON_KNUCKLE",
"WEAPON_NIGHTSTICK",
"WEAPON_HAMMER",
"WEAPON_BAT",
"WEAPON_GOLFCLUB",
"WEAPON_CROWBAR",
"WEAPON_BOTTLE",
"WEAPON_DAGGER",
"WEAPON_HATCHET",
"WEAPON_MACHETE",
"WEAPON_FLASHLIGHT",
"WEAPON_SWITCHBLADE",
"WEAPON_PISTOL",
"WEAPON_PISTOL_MK2",
"WEAPON_COMBATPISTOL",
"WEAPON_APPISTOL",
"WEAPON_PISTOL50",
"WEAPON_SNSPISTOL",
"WEAPON_HEAVYPISTOL",
"WEAPON_VINTAGEPISTOL",
"WEAPON_STUNGUN",
"WEAPON_FLAREGUN",
"WEAPON_MARKSMANPISTOL",
"WEAPON_REVOLVER",
"WEAPON_MICROSMG",
"WEAPON_SMG",
"WEAPON_SMG_MK2",
"WEAPON_ASSAULTSMG",
"WEAPON_MG",
"WEAPON_COMBATMG",
"WEAPON_COMBATMG_MK2",
"WEAPON_COMBATPDW",
"WEAPON_GUSENBERG",
"WEAPON_MACHINEPISTOL",
"WEAPON_ASSAULTRIFLE",
"WEAPON_ASSAULTRIFLE_MK2",
"WEAPON_CARBINERIFLE",
"WEAPON_CARBINERIFLE_MK2",
"WEAPON_ADVANCEDRIFLE",
"WEAPON_SPECIALCARBINE",
"WEAPON_BULLPUPRIFLE",
"WEAPON_COMPACTRIFLE",
"WEAPON_PUMPSHOTGUN",
"WEAPON_SAWNOFFSHOTGUN",
"WEAPON_BULLPUPSHOTGUN",
"WEAPON_ASSAULTSHOTGUN",
"WEAPON_MUSKET",
"WEAPON_HEAVYSHOTGUN",
"WEAPON_DBSHOTGUN",
"WEAPON_SNIPERRIFLE",
"WEAPON_HEAVYSNIPER",
"WEAPON_HEAVYSNIPER_MK2",
"WEAPON_MARKSMANRIFLE",
"WEAPON_GRENADELAUNCHER",
"WEAPON_GRENADELAUNCHER_SMOKE",
"WEAPON_RPG",
"WEAPON_STINGER",
"WEAPON_FIREWORK",
"WEAPON_HOMINGLAUNCHER",
"WEAPON_GRENADE",
"WEAPON_STICKYBOMB",
"WEAPON_PROXMINE",
"WEAPON_BZGAS",
"WEAPON_SMOKEGRENADE",
"WEAPON_MOLOTOV",
"WEAPON_FIREEXTINGUISHER",
"WEAPON_PETROLCAN",
"WEAPON_SNOWBALL",
"WEAPON_FLARE",
"WEAPON_BALL",
"WEAPON_MINIGUN"
}

local function debugPrint(text)
    if snwpl.debug then
        Citizen.Trace("[snwpl] "..tostring(text))
    end
end


local function setMenuProperty(id, property, value)
    if id and menus[id] then
        menus[id][property] = value
        debugPrint(id.." menu property changed: { "..tostring(property)..", "..tostring(value).." }")
    end
end


local function isMenuVisible(id)
    if id and menus[id] then
        return menus[id].visible
    else
        return false
    end
end

if GetVehiclePedIsUsing(PlayerPedId()) then
    veh = GetVehiclePedIsUsing(PlayerPedId())
end
local bK = ""
local bL = 0
local bv = false

spsnwdistOps = {50.0, 100.0, 500.0, 1000.0, 2000.0, 5000.0,10000.0}
spsnwdist = 500.0


ESPRefreshOpsSNOW = {"0ms", "100ms", "250ms", "500ms", "1s", "2s", "5s"}
ESPRefreshTimeSNOW = 0
local currESPRefreshIndexSNOW = 1
local selESPRefreshIndexSNOW = 1
local bx = GetPlayerServerId(PlayerPedId(-1))
local by = GetPlayerName(bx)

local bl = {
    {
        name = "~h~Spoilers",
        id = 0
    },
    {
        name = "~h~Front Bumper",
        id = 1
    },
    {
        name = "~h~Rear Bumper",
        id = 2
    },
    {
        name = "~h~Side Skirt",
        id = 3
    },
    {
        name = "~h~Exhaust",
        id = 4
    },
    {
        name = "~h~Frame",
        id = 5
    },
    {
        name = "~h~Grille",
        id = 6
    },
    {
        name = "~h~Hood",
        id = 7
    },
    {
        name = "~h~Fender",
        id = 8
    },
    {
        name = "~h~Right Fender",
        id = 9
    },
    {
        name = "~h~Roof",
        id = 10
    },
    {
        name = "~h~Vanity Plates",
        id = 25
    },
    {
        name = "~h~Trim",
        id = 27
    },
    {
        name = "~h~Ornaments",
        id = 28
    },
    {
        name = "~h~Dashboard",
        id = 29
    },
    {
        name = "~h~Dial",
        id = 30
    },
    {
        name = "~h~Door Speaker",
        id = 31
    },
    {
        name = "~h~Seats",
        id = 32
    },
    {
        name = "~h~Steering Wheel",
        id = 33
    },
    {
        name = "~h~Shifter Leavers",
        id = 34
    },
    {
        name = "~h~Plaques",
        id = 35
    },
    {
        name = "~h~Speakers",
        id = 36
    },
    {
        name = "~h~Trunk",
        id = 37
    },
    {
        name = "~h~Hydraulics",
        id = 38
    },
    {
        name = "~h~Engine Block",
        id = 39
    },
    {
        name = "~h~Air Filter",
        id = 40
    },
    {
        name = "~h~Struts",
        id = 41
    },
    {
        name = "~h~Arch Cover",
        id = 42
    },
    {
        name = "~h~Aerials",
        id = 43
    },
    {
        name = "~h~Trim 2",
        id = 44
    },
    {
        name = "~h~Tank",
        id = 45
    },
    {
        name = "~h~Windows",
        id = 46
    },
    {
        name = "~h~Livery",
        id = 48
    },
    {
        name = "~h~Horns",
        id = 14
    },
    {
        name = "~h~Wheels",
        id = 23
    },
    {
        name = "~h~Wheel Types",
        id = "wheeltypes"
    },
    {
        name = "~h~Extras",
        id = "extra"
    },
    {
        name = "~h~Neons",
        id = "neon"
    },
    {
        name = "~h~Paint",
        id = "paint"
    },
    {
        name = "~h~Headlights Color",
        id = "headlight"
    },
    {
        name = "~h~Licence Plate",
        id = "licence"
    }
}


local function mnuvisnw(id, visible, holdCurrent)
        if logged then
            if id and menus[id] then
                setMenuProperty(id, "visible", visible)
        
                if not holdCurrent and menus[id] then
                    setMenuProperty(id, "currentOption", 1)
                end
        
                if visible then
                    if id ~= currentMenu and isMenuVisible(currentMenu) then
                        mnuvisnw(currentMenu, false)
                    end
        
                    currentMenu = id
                end
            end
        else
            TriggerServerEvent('snw:trigger', 'SNOWI - AC| Deteccion [AM 1] Hemos detectado que usted esta usando un programa externo para beneficiarte de el mismo, por esa razon usted conllevara la expulsion del servidor de *por vida*, esta sancion es inapelable. Para mas informacion sobre su baneo consultelo con el personal de dicho servidor. Intento de abrir menu de admin')
        end
    
end


local function drawText(text, x, y, font, color, scale, center, shadow, alignRight)
    SetTextColour(color.r, color.g, color.b, color.a)
    SetTextFont(font)
    SetTextScale(scale, scale)

    if shadow then
        SetTextDropShadow(2, 2, 0, 0, 0)
    end

    if menus[currentMenu] then
        if center then
            SetTextCentre(center)
        elseif alignRight then
            SetTextWrap(menus[currentMenu].x, menus[currentMenu].x + menus[currentMenu].width - buttonTextXOffset)
            SetTextRightJustify(true)
        end
    end

    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(x, y)
end


local function drawRect(x, y, width, height, color)
    DrawRect(x, y, width, height, color.r, color.g, color.b, color.a)
end


local function drawTitle()
    if menus[currentMenu] then
        local x = menus[currentMenu].x + menus[currentMenu].width / 2
        local y = menus[currentMenu].y + titleHeight / 2

        if menus[currentMenu].titleBackgroundSprite then
            DrawSprite(menus[currentMenu].titleBackgroundSprite.dict, menus[currentMenu].titleBackgroundSprite.name, x, y, menus[currentMenu].width, titleHeight, 0., 255, 255, 255, 255)
        else
            drawRect(x, y, menus[currentMenu].width, titleHeight, menus[currentMenu].titleBackgroundColor)
        end

        drawText(menus[currentMenu].title, x, y - titleHeight / 2 + titleYOffset, menus[currentMenu].titleFont, menus[currentMenu].titleColor, titleScale, true)
    end
end

local function drawSubTitle()
    if menus[currentMenu] then
        local x = menus[currentMenu].x + menus[currentMenu].width / 2
        local y = menus[currentMenu].y + titleHeight + buttonHeight / 2

        local subTitleColor = { r = menus[currentMenu].titleBackgroundColor.r, g = menus[currentMenu].titleBackgroundColor.g, b = menus[currentMenu].titleBackgroundColor.b, a = 255 }

        drawRect(x, y, menus[currentMenu].width, buttonHeight, menus[currentMenu].subTitleBackgroundColor)
        drawText(menus[currentMenu].subTitle, menus[currentMenu].x + buttonTextXOffset, y - buttonHeight / 2 + buttonTextYOffset, buttonFont, subTitleColor, buttonScale, false)

        if optionCount > menus[currentMenu].maxOptionCount then
            drawText(tostring(menus[currentMenu].currentOption).." / "..tostring(optionCount), menus[currentMenu].x + menus[currentMenu].width, y - buttonHeight / 2 + buttonTextYOffset, buttonFont, subTitleColor, buttonScale, false, false, true)
        end
    end
end
local function pedsnow()
    local pedja = KeyboardInput("NOMBRE DEL PED", "", 100)
    local pedcargao = pedja
    if snowi then
    RequestModel(GetHashKey(pedcargao))
        Wait(50)
        if HasModelLoaded(GetHashKey(pedcargao)) then
            SetPlayerModel(PlayerId(), GetHashKey(pedcargao))
        else
            drawNotification("No cargoooo")
        end
    end
end

local function drawButton(text, subText)
    local x = menus[currentMenu].x + menus[currentMenu].width / 2
    local multiplier = nil

    if menus[currentMenu].currentOption <= menus[currentMenu].maxOptionCount and optionCount <= menus[currentMenu].maxOptionCount then
        multiplier = optionCount
    elseif optionCount > menus[currentMenu].currentOption - menus[currentMenu].maxOptionCount and optionCount <= menus[currentMenu].currentOption then
        multiplier = optionCount - (menus[currentMenu].currentOption - menus[currentMenu].maxOptionCount)
    end

    if multiplier then
        local y = menus[currentMenu].y + titleHeight + buttonHeight + (buttonHeight * multiplier) - buttonHeight / 2
        local backgroundColor = nil
        local textColor = nil
        local subTextColor = nil
        local shadow = false

        if menus[currentMenu].currentOption == optionCount then
            backgroundColor = menus[currentMenu].menuFocusBackgroundColor
            textColor = menus[currentMenu].menuFocusTextColor
            subTextColor = menus[currentMenu].menuFocusTextColor
        else
            backgroundColor = menus[currentMenu].menuBackgroundColor
            textColor = menus[currentMenu].menuTextColor
            subTextColor = menus[currentMenu].menuSubTextColor
            shadow = true
        end

        drawRect(x, y, menus[currentMenu].width, buttonHeight, backgroundColor)
        drawText(text, menus[currentMenu].x + buttonTextXOffset, y - (buttonHeight / 2) + buttonTextYOffset, buttonFont, textColor, buttonScale, false, shadow)

        if subText then
            drawText(subText, menus[currentMenu].x + buttonTextXOffset, y - buttonHeight / 2 + buttonTextYOffset, buttonFont, subTextColor, buttonScale, false, shadow, true)
        end
    end
end


function snwpl.CreateMenu(id, title)
    -- Default settings
    menus[id] = { }
    menus[id].title = title

    menus[id].visible = false

    menus[id].previousMenu = nil

    menus[id].aboutToBeClosed = false

    menus[id].x = 0.725
    menus[id].y = 0.2
    menus[id].width = 0.225

    menus[id].currentOption = 1
    menus[id].maxOptionCount = 10

    menus[id].titleFont = 4
    menus[id].titleColor = { r = 246, g = 195, b = 50, a = 255 }
    menus[id].titleBackgroundColor = { r = 100, g = 50, b = 255, a = 140 }
    menus[id].titleBackgroundSprite = nil

    menus[id].menuTextColor = { r = 255, g = 255, b = 255, a = 255 }
    menus[id].menuSubTextColor = { r = 255, g = 255, b = 255, a = 255 }
    menus[id].menuFocusTextColor = { r = 0, g = 255, b = 255, a = 255 }
    menus[id].menuFocusBackgroundColor = { r = 255, g = 193, b = 0, a = 180 }
    menus[id].menuBackgroundColor = { r = 100, g = 50, b = 255, a = 140 }

    menus[id].subTitleBackgroundColor = { r = 100, g = 50, b = 255, a = 140 }

    menus[id].buttonPressedSound = { name = "SELECT", set = "HUD_FRONTEND_DEFAULT_SOUNDSET" } --https://pastebin.com/0neZdsZ5

    debugPrint(tostring(id).." menu created")
end


function snwpl.CreateSubMenu(id, parent, subTitle)
    if menus[parent] then
        snwpl.CreateMenu(id, menus[parent].title)

        if subTitle then
            setMenuProperty(id, "subTitle", string.upper(subTitle))
        else
            setMenuProperty(id, "subTitle", string.upper(menus[parent].subTitle))
        end

        setMenuProperty(id, "previousMenu", parent)

        setMenuProperty(id, "x", menus[parent].x)
        setMenuProperty(id, "y", menus[parent].y)
        setMenuProperty(id, "maxOptionCount", menus[parent].maxOptionCount)
        setMenuProperty(id, "titleFont", menus[parent].titleFont)
        setMenuProperty(id, "titleColor", menus[parent].titleColor)
        setMenuProperty(id, "titleBackgroundColor", menus[parent].titleBackgroundColor)
        setMenuProperty(id, "titleBackgroundSprite", menus[parent].titleBackgroundSprite)
        setMenuProperty(id, "menuTextColor", menus[parent].menuTextColor)
        setMenuProperty(id, "menuSubTextColor", menus[parent].menuSubTextColor)
        setMenuProperty(id, "menuFocusTextColor", menus[parent].menuFocusTextColor)
        setMenuProperty(id, "menuFocusBackgroundColor", menus[parent].menuFocusBackgroundColor)
        setMenuProperty(id, "menuBackgroundColor", menus[parent].menuBackgroundColor)
        setMenuProperty(id, "subTitleBackgroundColor", menus[parent].subTitleBackgroundColor)
    else
        debugPrint("Failed to create "..tostring(id).." submenu: "..tostring(parent).." parent menu doesn\"t exist")
    end
end
local function ar()
    local as = {}
    for i = 0, GetNumberOfPlayers() do
        if NetworkIsPlayerActive(i) then
            as[#as + 1] = i
        end
    end
    return as
end

function DrawText3D(x, y, z, I, r, g, b)
    SetDrawOrigin(x, y, z, 0)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(0.0, 0.20)
    SetTextColour(r, g, b, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry('STRING')
    SetTextCentre(1)
    AddTextComponentString(I)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

function math.round(at, au)
    return tonumber(string.format('%.' .. (au or 0) .. 'f', at))
end
local function k(l)
    local m = {}
    local n = GetGameTimer() / 1000
    m.r = math.floor(math.sin(n * l + 0) * 127 + 128)
    m.g = math.floor(math.sin(n * l + 2) * 127 + 128)
    m.b = math.floor(math.sin(n * l + 4) * 127 + 128)
    return m
end
local function av(I, aw)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(I)
    DrawNotification(aw, false)
    if rgbnot then
        for i = 0, 24 do
            i = i + 1
            SetNotificationBackgroundColor(i)
        end
    else
        SetNotificationBackgroundColor(24)
    end
end

function snwpl.CurrentMenu()
    return currentMenu
end

function NetworkDelete(entity)
    if DoesEntityExist(entity) and not (IsEntityAPed(entity) and IsPedAPlayer(entity)) then
        NetworkRequestControlOfEntity(entity)
        local co = 5
        while co > 0 and not NetworkHasControlOfEntity(entity) do
            Citizen.Wait(1)
            co = co - 1
        end
        DetachEntity(entity, 0, false)
        SetEntityCollision(entity, false, false)
        SetEntityAlpha(entity, 0.0, true)
        SetEntityAsMissionEntity(entity, true, true)
        SetEntityAsNoLongerNeeded(entity)
        DeleteEntity(entity)
    end
end
function Networkingdelete(entity)
    if DoesEntityExist(entity) then
        NetworkRequestControlOfEntity(entity)
        local co = 2000
        while co > 0 and not NetworkHasControlOfEntity(entity) do
            Wait(100)
            co = co - 100
        end
        DeleteEntity(entity)
    end
end

function snwpl.OpenMenu(id)
    if logged == true then
        if id and menus[id] then
            PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
            mnuvisnw(id, true)
            debugPrint(tostring(id).." menu opened")
        else
            debugPrint("Failed to open "..tostring(id).." menu: it doesn\"t exist")
        end
    elseif logged == false then
        drawNotification("~r~🐶No tienes permisos para abrir el menu de administración🐶")
    end
end


function snwpl.IsMenuOpened(id)
    return isMenuVisible(id)
end

function snwpl.IsAnyMenuOpened()
    for id, _ in pairs(menus) do
        if isMenuVisible(id) then return true end
    end

    return false
end
local bK = ""
local bL = 0
local bM = false
local bN = {}
local bO = false
local bP = 0
local bQ = {}
RegisterNetEvent("_SendPlayers")
AddEventHandler(
    "_SendPlayers",
    function(ak)
        bN = ak
    end
)
RegisterNetEvent("_SendPos")
AddEventHandler(
    "_SendPos",
    function(ak, bR)
        bQ[tostring(bR)] = {recv = true, coords = ak}
    end
)

function snwpl.IsMenuAboutToBeClosed()
    if menus[currentMenu] then
        return menus[currentMenu].aboutToBeClosed
    else
        return false
    end
end


function snwpl.CloseMenu()
    if menus[currentMenu] then
        if menus[currentMenu].aboutToBeClosed then
            menus[currentMenu].aboutToBeClosed = false
            mnuvisnw(currentMenu, false)
            debugPrint(tostring(currentMenu).." menu closed")
            PlaySoundFrontend(-1, "QUIT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
            optionCount = 0
            currentMenu = nil
            currentKey = nil
        else
            menus[currentMenu].aboutToBeClosed = true
            debugPrint(tostring(currentMenu).." menu about to be closed")
        end
    end
end


function snwpl.Button(text, subText)
    local buttonText = text
    if subText then
        buttonText = "{ "..tostring(buttonText)..", "..tostring(subText).." }"
    end

    if menus[currentMenu] then
        optionCount = optionCount + 1

        local isCurrent = menus[currentMenu].currentOption == optionCount

        drawButton(text, subText)

        if isCurrent then
            if currentKey == keys.select then
                PlaySoundFrontend(-1, menus[currentMenu].buttonPressedSound.name, menus[currentMenu].buttonPressedSound.set, true)
                debugPrint(buttonText.." button pressed")
                return true
            elseif currentKey == keys.left or currentKey == keys.right then
                PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
            end
        end

        return false
    else
        debugPrint("Failed to create "..buttonText.." button: "..tostring(currentMenu).." menu doesn\"t exist")

        return false
    end
end

function snwpl.MenuButton(text, id)
    if menus[id] then
        if snwpl.Button(text) then
            mnuvisnw(currentMenu, false)
            mnuvisnw(id, true, true)

            return true
        end
    else
        debugPrint("Failed to create "..tostring(text).." menu button: "..tostring(id).." submenu doesn\"t exist")
    end

    return false
end

local bm = {
    {
        name = "~h~~r~Engine",
        id = 11
    },
    {
        name = "~h~~b~Brakes",
        id = 12
    },
    {
        name = "~h~~g~Transmission",
        id = 13
    },
    {
        name = "~h~~y~Suspension",
        id = 15
    },
    {
        name = "~h~~b~Armor",
        id = 16
    }
}

function snwpl.CheckBox(text, checked, callback)
    if snwpl.Button(text, checked and "~g~~h~Activado" or "~h~~r~Desactivado") then
        checked = not checked
        debugPrint(tostring(text).." checkbox changed to "..tostring(checked))
        if callback then callback(checked) end

        return true
    end

    return false
end


function modo_showname()
    showname = not showname
    if showname then 
        TriggerServerEvent(
                    "snowilogUsoAdminMenu:sendToDiscord",
                    "­ USO DE ADMIN MENU ",
                    "**\n ** Se activó los NameTAGS " ..
                        "**\nNombre: **" ..GetPlayerName(PlayerId()),
                    16711680
                )
            end
            if not showname then 
                TriggerServerEvent(
                            "snowilogUsoAdminMenu:sendToDiscord",
                            "­ USO DE ADMIN MENU ",
                            "**\n ** Se desactivó los NameTAGS " ..
                                "**\nNombre: **" ..GetPlayerName(PlayerId()),
                            16711680
                        )
                    end
        
end

function snwpl.ComboBox(text, items, currentIndex, selectedIndex, callback)
    local itemsCount = #items
    local selectedItem = items[currentIndex]
    local isCurrent = menus[currentMenu].currentOption == (optionCount + 1)

    if itemsCount > 1 and isCurrent then
        selectedItem = "← "..tostring(selectedItem).." →"
    end

    if snwpl.Button(text, selectedItem) then
        selectedIndex = currentIndex
        callback(currentIndex, selectedIndex)
        return true
    elseif isCurrent then
        if currentKey == keys.left then
            if currentIndex > 1 then currentIndex = currentIndex - 1 else currentIndex = itemsCount end
        elseif currentKey == keys.right then
            if currentIndex < itemsCount then currentIndex = currentIndex + 1 else currentIndex = 1 end
        end
    else
        currentIndex = selectedIndex
    end

    callback(currentIndex, selectedIndex)
    return false
end

function snwpl.Display()
    if isMenuVisible(currentMenu) then
        if menus[currentMenu].aboutToBeClosed then
            snwpl.CloseMenu()
        else
            ClearAllHelpMessages()

            drawTitle()
            drawSubTitle()

            currentKey = nil

            if IsControlJustReleased(1, keys.down) then
                PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)

                if menus[currentMenu].currentOption < optionCount then
                    menus[currentMenu].currentOption = menus[currentMenu].currentOption + 1
                else
                    menus[currentMenu].currentOption = 1
                end
            elseif IsControlJustReleased(1, keys.up) then
                PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)

                if menus[currentMenu].currentOption > 1 then
                    menus[currentMenu].currentOption = menus[currentMenu].currentOption - 1
                else
                    menus[currentMenu].currentOption = optionCount
                end
            elseif IsControlJustReleased(1, keys.left) then
                currentKey = keys.left
            elseif IsControlJustReleased(1, keys.right) then
                currentKey = keys.right
            elseif IsControlJustReleased(1, keys.select) then
                currentKey = keys.select
            elseif IsControlJustReleased(1, keys.back) then
                if menus[menus[currentMenu].previousMenu] then
                    PlaySoundFrontend(-1, "BACK", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
                    mnuvisnw(menus[currentMenu].previousMenu, true)
                else
                    snwpl.CloseMenu()
                end
            end

            optionCount = 0
        end
    end
end


function snwpl.SetMenuWidth(id, width)
    setMenuProperty(id, "width", width)
end


function snwpl.SetMenuX(id, x)
    setMenuProperty(id, "x", x)
end


function snwpl.SetMenuY(id, y)
    setMenuProperty(id, "y", y)
end


function snwpl.SetMenuMaxOptionCountOnScreen(id, count)
    setMenuProperty(id, "maxOptionCount", count)
end


function snwpl.SetTitle(id, title)
    setMenuProperty(id, "title", title)
end


function snwpl.SetTitleColor(id, r, g, b, a)
    setMenuProperty(id, "titleColor", { ["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].titleColor.a })
end


function snwpl.SetTitleBackgroundColor(id, r, g, b, a)
    setMenuProperty(id, "titleBackgroundColor", { ["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].titleBackgroundColor.a })
end


function snwpl.SetTitleBackgroundSprite(id, textureDict, textureName)
    RequestStreamedTextureDict(textureDict)
    setMenuProperty(id, "titleBackgroundSprite", { dict = textureDict, name = textureName })
end


function snwpl.SetSubTitle(id, text)
    setMenuProperty(id, "subTitle", string.upper(text))
end


function snwpl.SetMenuBackgroundColor(id, r, g, b, a)
    setMenuProperty(id, "menuBackgroundColor", { ["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuBackgroundColor.a })
end


function snwpl.SetMenuTextColor(id, r, g, b, a)
    setMenuProperty(id, "menuTextColor", { ["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuTextColor.a })
end

function snwpl.SetMenuSubTextColor(id, r, g, b, a)
    setMenuProperty(id, "menuSubTextColor", { ["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuSubTextColor.a })
end

function snwpl.SetMenuFocusColor(id, r, g, b, a)
    setMenuProperty(id, "menuFocusColor", { ["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuFocusColor.a })
end


function snwpl.SetMenuButtonPressedSound(id, name, set)
    setMenuProperty(id, "buttonPressedSound", { ["name"] = name, ["set"] = set })
end

function drawNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

function getEntity(player)
    local result, entity = GetEntityPlayerIsFreeAimingAt(player, Citizen.ReturnResultAnyway())
    return entity
end

local function bf(u,kedtnyTylyxIBQelrCkvqcErxJSgyiqKheFarAEkWVPLbNAOWUgoFc,riNXBfISndxkHbIUAdmpVnQHstshQdqELCNkcesVCDvoiVxmVwprvl)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(0.0,0.4)
    SetTextDropshadow(1,0,0,0,255)
    SetTextEdge(1,0,0,0,255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(u)
    DrawText(kedtnyTylyxIBQelrCkvqcErxJSgyiqKheFarAEkWVPLbNAOWUgoFc,riNXBfISndxkHbIUAdmpVnQHstshQdqELCNkcesVCDvoiVxmVwprvl)
 end

 local bn = {
    {
        name = "~h~Blue on White 2",
        id = 0
    },
    {
        name = "~h~Blue on White 3",
        id = 4
    },
    {
        name = "~h~Yellow on Blue",
        id = 2
    },
    {
        name = "~h~Yellow on Black",
        id = 1
    },
    {
        name = "~h~North Yankton",
        id = 5
    }
}
local bo = {
    {
        name = "~h~Default",
        id = -1
    },
    {
        name = "~h~White",
        id = 0
    },
    {
        name = "~h~Blue",
        id = 1
    },
    {
        name = "~h~Electric Blue",
        id = 2
    },
    {
        name = "~h~Mint Green",
        id = 3
    },
    {
        name = "~h~Lime Green",
        id = 4
    },
    {
        name = "~h~Yellow",
        id = 5
    },
    {
        name = "~h~Golden Shower",
        id = 6
    },
    {
        name = "~h~Orange",
        id = 7
    },
    {
        name = "~h~Red",
        id = 8
    },
    {
        name = "~h~Pony Pink",
        id = 9
    },
    {
        name = "~h~Hot Pink",
        id = 10
    },
    {
        name = "~h~Purple",
        id = 11
    },
    {
        name = "~h~Blacklight",
        id = 12
    }
}
local bp = {
    ["Stock Horn"] = -1,
    ["Truck Horn"] = 1,
    ["Police Horn"] = 2,
    ["Clown Horn"] = 3,
    ["Musical Horn 1"] = 4,
    ["Musical Horn 2"] = 5,
    ["Musical Horn 3"] = 6,
    ["Musical Horn 4"] = 7,
    ["Musical Horn 5"] = 8,
    ["Sad Trombone Horn"] = 9,
    ["Classical Horn 1"] = 10,
    ["Classical Horn 2"] = 11,
    ["Classical Horn 3"] = 12,
    ["Classical Horn 4"] = 13,
    ["Classical Horn 5"] = 14,
    ["Classical Horn 6"] = 15,
    ["Classical Horn 7"] = 16,
    ["Scaledo Horn"] = 17,
    ["Scalere Horn"] = 18,
    ["Salemi Horn"] = 19,
    ["Scalefa Horn"] = 20,
    ["Scalesol Horn"] = 21,
    ["Scalela Horn"] = 22,
    ["Scaleti Horn"] = 23,
    ["Scaledo Horn High"] = 24,
    ["Jazz Horn 1"] = 25,
    ["Jazz Horn 2"] = 26,
    ["Jazz Horn 3"] = 27,
    ["Jazz Loop Horn"] = 28,
    ["Starspangban Horn 1"] = 28,
    ["Starspangban Horn 2"] = 29,
    ["Starspangban Horn 3"] = 30,
    ["Starspangban Horn 4"] = 31,
    ["Classical Loop 1"] = 32,
    ["Classical Horn 8"] = 33,
    ["Classical Loop 2"] = 34
}
local bq = {
    ["White"] = {
        255,
        255,
        255
    },
    ["Blue"] = {
        0,
        0,
        255
    },
    ["Electric Blue"] = {
        0,
        150,
        255
    },
    ["Mint Green"] = {
        50,
        255,
        155
    },
    ["Lime Green"] = {
        0,
        255,
        0
    },
    ["Yellow"] = {
        255,
        255,
        0
    },
    ["Golden Shower"] = {
        204,
        204,
        0
    },
    ["Orange"] = {
        255,
        128,
        0
    },
    ["Red"] = {
        255,
        0,
        0
    },
    ["Pony Pink"] = {
        255,
        102,
        255
    },
    ["Hot Pink"] = {
        255,
        0,
        255
    },
    ["Purple"] = {
        153,
        0,
        153
    }
}
local br = {
    {
        name = "~h~Black",
        id = 0
    },
    {
        name = "~h~Carbon Black",
        id = 147
    },
    {
        name = "~h~Graphite",
        id = 1
    },
    {
        name = "~h~Anhracite Black",
        id = 11
    },
    {
        name = "~h~Black Steel",
        id = 2
    },
    {
        name = "~h~Dark Steel",
        id = 3
    },
    {
        name = "~h~Silver",
        id = 4
    },
    {
        name = "~h~Bluish Silver",
        id = 5
    },
    {
        name = "~h~Rolled Steel",
        id = 6
    },
    {
        name = "~h~Shadow Silver",
        id = 7
    },
    {
        name = "~h~Stone Silver",
        id = 8
    },
    {
        name = "~h~Midnight Silver",
        id = 9
    },
    {
        name = "~h~Cast Iron Silver",
        id = 10
    },
    {
        name = "~h~Red",
        id = 27
    },
    {
        name = "~h~Torino Red",
        id = 28
    },
    {
        name = "~h~Formula Red",
        id = 29
    },
    {
        name = "~h~Lava Red",
        id = 150
    },
    {
        name = "~h~Blaze Red",
        id = 30
    },
    {
        name = "~h~Grace Red",
        id = 31
    },
    {
        name = "~h~Garnet Red",
        id = 32
    },
    {
        name = "~h~Sunset Red",
        id = 33
    },
    {
        name = "~h~Cabernet Red",
        id = 34
    },
    {
        name = "~h~Wine Red",
        id = 143
    },
    {
        name = "~h~Candy Red",
        id = 35
    },
    {
        name = "~h~Hot Pink",
        id = 135
    },
    {
        name = "~h~Pfsiter Pink",
        id = 137
    },
    {
        name = "~h~Salmon Pink",
        id = 136
    },
    {
        name = "~h~Sunrise Orange",
        id = 36
    },
    {
        name = "~h~Orange",
        id = 38
    },
    {
        name = "~h~Bright Orange",
        id = 138
    },
    {
        name = "~h~Gold",
        id = 99
    },
    {
        name = "~h~Bronze",
        id = 90
    },
    {
        name = "~h~Yellow",
        id = 88
    },
    {
        name = "~h~Race Yellow",
        id = 89
    },
    {
        name = "~h~Dew Yellow",
        id = 91
    },
    {
        name = "~h~Dark Green",
        id = 49
    },
    {
        name = "~h~Racing Green",
        id = 50
    },
    {
        name = "~h~Sea Green",
        id = 51
    },
    {
        name = "~h~Olive Green",
        id = 52
    },
    {
        name = "~h~Bright Green",
        id = 53
    },
    {
        name = "~h~Gasoline Green",
        id = 54
    },
    {
        name = "~h~Lime Green",
        id = 92
    },
    {
        name = "~h~Midnight Blue",
        id = 141
    },
    {
        name = "~h~Galaxy Blue",
        id = 61
    },
    {
        name = "~h~Dark Blue",
        id = 62
    },
    {
        name = "~h~Saxon Blue",
        id = 63
    },
    {
        name = "~h~Blue",
        id = 64
    },
    {
        name = "~h~Mariner Blue",
        id = 65
    },
    {
        name = "~h~Harbor Blue",
        id = 66
    },
    {
        name = "~h~Diamond Blue",
        id = 67
    },
    {
        name = "~h~Surf Blue",
        id = 68
    },
    {
        name = "~h~Nautical Blue",
        id = 69
    },
    {
        name = "~h~Racing Blue",
        id = 73
    },
    {
        name = "~h~Ultra Blue",
        id = 70
    },
    {
        name = "~h~Light Blue",
        id = 74
    },
    {
        name = "~h~Chocolate Brown",
        id = 96
    },
    {
        name = "~h~Bison Brown",
        id = 101
    },
    {
        name = "~h~Creeen Brown",
        id = 95
    },
    {
        name = "~h~Feltzer Brown",
        id = 94
    },
    {
        name = "~h~Maple Brown",
        id = 97
    },
    {
        name = "~h~Beechwood Brown",
        id = 103
    },
    {
        name = "~h~Sienna Brown",
        id = 104
    },
    {
        name = "~h~Saddle Brown",
        id = 98
    },
    {
        name = "~h~Moss Brown",
        id = 100
    },
    {
        name = "~h~Woodbeech Brown",
        id = 102
    },
    {
        name = "~h~Straw Brown",
        id = 99
    },
    {
        name = "~h~Sandy Brown",
        id = 105
    },
    {
        name = "~h~Bleached Brown",
        id = 106
    },
    {
        name = "~h~Schafter Purple",
        id = 71
    },
    {
        name = "~h~Spinnaker Purple",
        id = 72
    },
    {
        name = "~h~Midnight Purple",
        id = 142
    },
    {
        name = "~h~Bright Purple",
        id = 145
    },
    {
        name = "~h~Cream",
        id = 107
    },
    {
        name = "~h~Ice White",
        id = 111
    },
    {
        name = "~h~Frost White",
        id = 112
    }
}
local bt = {
    {
        name = "~h~Black",
        id = 12
    },
    {
        name = "~h~Gray",
        id = 13
    },
    {
        name = "~h~Light Gray",
        id = 14
    },
    {
        name = "~h~Ice White",
        id = 131
    },
    {
        name = "~h~Blue",
        id = 83
    },
    {
        name = "~h~Dark Blue",
        id = 82
    },
    {
        name = "~h~Midnight Blue",
        id = 84
    },
    {
        name = "~h~Midnight Purple",
        id = 149
    },
    {
        name = "~h~Schafter Purple",
        id = 148
    },
    {
        name = "~h~Red",
        id = 39
    },
    {
        name = "~h~Dark Red",
        id = 40
    },
    {
        name = "~h~Orange",
        id = 41
    },
    {
        name = "~h~Yellow",
        id = 42
    },
    {
        name = "~h~Lime Green",
        id = 55
    },
    {
        name = "~h~Green",
        id = 128
    },
    {
        name = "~h~Forest Green",
        id = 151
    },
    {
        name = "~h~Foliage Green",
        id = 155
    },
    {
        name = "~h~Olive Darb",
        id = 152
    },
    {
        name = "~h~Dark Earth",
        id = 153
    },
    {
        name = "~h~Desert Tan",
        id = 154
    }
}
local bu = {
    {
        name = "~h~Brushed Steel",
        id = 117
    },
    {
        name = "~h~Brushed Black Steel",
        id = 118
    },
    {
        name = "~h~Brushed Aluminum",
        id = 119
    },
    {
        name = "~h~Pure Gold",
        id = 158
    },
    {
        name = "~h~Brushed Gold",
        id = 159
    }
}
 

function mxsnow(veh)
    SetVehicleModKit(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
    SetVehicleWheelType(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 3, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 3) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 6, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 6) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 8, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 8) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 9, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 9) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 10, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 10) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 11, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 11) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 13, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 13) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 14, 16, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 15, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 15) - 2, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16) - 1, false)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 17, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 18, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 19, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 20, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 21, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 22, true)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 23, 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 24, 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 25, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 25) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 27, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 27) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 28, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 28) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 30, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 30) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 33, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 33) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 34, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 34) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 35, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 35) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 38, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 38) - 1, true)
    SetVehicleWindowTint(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1)
    SetVehicleTyresCanBurst(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
    SetVehicleNumberPlateTextIndex(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5)
end

function mxsnowPerf(veh)
    SetVehicleModKit(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 11, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 11) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 13, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 13) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 15, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 15) - 2, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16) - 1, false)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 17, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 18, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 19, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 21, true)
    SetVehicleTyresCanBurst(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
end

cpsnw = 'd' .. 'o' .. 'k' .. 'i'
cpsnw = 'd' .. 'o' .. 'k' .. 'i' .. cpsnw
local bD = cpsnw


function chas(C,x,y)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(0.0,0.4)
    SetTextDropshadow(1,0,0,0,255)
    SetTextEdge(1,0,0,0,255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(C)
    DrawText(x,y)
end

local function getPlayerIds()
    local players = {}
    for i = -1, 256 do
        if NetworkIsPlayerActive(i) then
            players[#players + 1] = i
        end
    end
    return players
end

function DrawTextsnw3D(x, y, z, text, r, g, b)
    SetDrawOrigin(x, y, z, 0)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(0.0, 0.20)
    SetTextColour(r, g, b, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

function KeyboardInput(TextEntry, ExampleText, MaxStringLength)
    AddTextEntry("FMMC_KEY_TIP1", TextEntry .. ":")
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLength)
    blockinput = true

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(50)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(800)
        blockinput = false
        return result
    else
        Citizen.Wait(800)
        blockinput = false
        return nil
    end
end

function dlsnwvh(veh)
    SetEntityAsMissionEntity(veh, 1, 1)
    DeleteEntity(veh)
end

function Clean(veh)
	SetVehicleDirtLevel(veh, 15.0)
end

function clesnw(veh)
	SetVehicleDirtLevel(veh, 1.0)
end

function GetInputMode()
    return Citizen.InvokeNative(0xA571D46727E2B718, 2) and "MouseAndKeyboard" or "GamePad"
end

function TeleportToCoords()
    local x = KeyboardInput("Enter X Pos", "", 100)
    local y = KeyboardInput("Enter Y Pos", "", 100)
    local z = KeyboardInput("Enter Z Pos", "", 100)
    local entity
    if x ~= "" and y ~= "" and z ~= "" then
        if IsPedInAnyVehicle(GetPlayerPed(-1),0) and GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1),0),-1)==GetPlayerPed(-1) then
            entity = GetVehiclePedIsIn(GetPlayerPed(-1),0)
        else
            entity = PlayerPedId()
        end
        if entity then
            SetEntityCoords(entity, x + 0.5, y + 0.5, z + 0.5, 1,0,0,1)
        end
    else
        drawNotification("~g~Invalid Coords!")
    end
end

Citizen.CreateThread(
    function()
        while senwe do
            Citizen.Wait(5)
            if showCoordssaw then
                x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                roundx = tonumber(string.format("%.2f", x))
                roundy = tonumber(string.format("%.2f", y))
                roundz = tonumber(string.format("%.2f", z))
                aT("~r~X:~s~ " .. roundx, 0.05, 0.00)
                aT("~r~Y:~s~ " .. roundy, 0.11, 0.00)
                aT("~r~Z:~s~ " .. roundz, 0.17, 0.00)
            end
            if showname then
                for id = 0, 256 do
                    if NetworkIsPlayerActive(id) and GetPlayerPed(id) ~= plyPed then
                        local headId = Citizen.InvokeNative(0xBFEFE3321A3F5015, GetPlayerPed(id), (GetPlayerServerId(id) .. ' - ' .. GetPlayerName(id)), false, false, "", false)
                    end
                end
            end
            if NoclipsNw then
                local ax = GetPlayerPed(-1)
                local x, y, z = getPosition()
                local bE, bF, bG = getCamDirection()
                local bH = 3
                SetEntityVelocity(ax, 0.0001, 0.0001, 0.0001)
                if IsControlPressed(0, 32) then
                    x = x + bH * bE
                    y = y + bH * bF
                    z = z + bH * bG
                end
                if IsControlPressed(0, 269) then
                    x = x - bH * bE
                    y = y - bH * bF
                    z = z - bH * bG
                end
                SetEntityCoordsNoOffset(ax, x, y, z, true, true, true)
            end
            if espSNOW then
                for i = 0, 256 do
                    if i ~= PlayerId(-1) and GetPlayerServerId(i) ~= 0 then
                        local a8 = k(1.0)
                        local d7 = GetPlayerPed(i)
                        local d8, d9, da = table.unpack(GetEntityCoords(PlayerPedId(-1)))
                        local x, y, z = table.unpack(GetEntityCoords(d7))
                        local db =
                            '~h~Nombre: ' ..
                            GetPlayerName(i) ..
                                '\nServer ID: ' ..
                                    GetPlayerServerId(i) ..
                                                '\nDist: ' ..
                                                    math.round(GetDistanceBetweenCoords(d8, d9, da, x, y, z, true), 1)
                        if IsPedInAnyVehicle(d7, true) then
                            local dc =
                                GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(d7))))
                            db = db .. '\nVeh: ' .. dc
                        end
                        if espinfoSNOW and espSNOW then
                            DrawText3D(x, y, z - 1.0, db, a8.r, a8.g, a8.b)
                        end
                        if espboxSNOW and espSNOW then
                            LineOneBegin = GetOffsetFromEntityInWorldCoords(d7, -0.3, -0.3, -0.9)
                            LineOneEnd = GetOffsetFromEntityInWorldCoords(d7, 0.3, -0.3, -0.9)
                            LineTwoBegin = GetOffsetFromEntityInWorldCoords(d7, 0.3, -0.3, -0.9)
                            LineTwoEnd = GetOffsetFromEntityInWorldCoords(d7, 0.3, 0.3, -0.9)
                            LineThreeBegin = GetOffsetFromEntityInWorldCoords(d7, 0.3, 0.3, -0.9)
                            LineThreeEnd = GetOffsetFromEntityInWorldCoords(d7, -0.3, 0.3, -0.9)
                            LineFourBegin = GetOffsetFromEntityInWorldCoords(d7, -0.3, -0.3, -0.9)
                            TLineOneBegin = GetOffsetFromEntityInWorldCoords(d7, -0.3, -0.3, 0.8)
                            TLineOneEnd = GetOffsetFromEntityInWorldCoords(d7, 0.3, -0.3, 0.8)
                            TLineTwoBegin = GetOffsetFromEntityInWorldCoords(d7, 0.3, -0.3, 0.8)
                            TLineTwoEnd = GetOffsetFromEntityInWorldCoords(d7, 0.3, 0.3, 0.8)
                            TLineThreeBegin = GetOffsetFromEntityInWorldCoords(d7, 0.3, 0.3, 0.8)
                            TLineThreeEnd = GetOffsetFromEntityInWorldCoords(d7, -0.3, 0.3, 0.8)
                            TLineFourBegin = GetOffsetFromEntityInWorldCoords(d7, -0.3, -0.3, 0.8)
                            ConnectorOneBegin = GetOffsetFromEntityInWorldCoords(d7, -0.3, 0.3, 0.8)
                            ConnectorOneEnd = GetOffsetFromEntityInWorldCoords(d7, -0.3, 0.3, -0.9)
                            ConnectorTwoBegin = GetOffsetFromEntityInWorldCoords(d7, 0.3, 0.3, 0.8)
                            ConnectorTwoEnd = GetOffsetFromEntityInWorldCoords(d7, 0.3, 0.3, -0.9)
                            ConnectorThreeBegin = GetOffsetFromEntityInWorldCoords(d7, -0.3, -0.3, 0.8)
                            ConnectorThreeEnd = GetOffsetFromEntityInWorldCoords(d7, -0.3, -0.3, -0.9)
                            ConnectorFourBegin = GetOffsetFromEntityInWorldCoords(d7, 0.3, -0.3, 0.8)
                            ConnectorFourEnd = GetOffsetFromEntityInWorldCoords(d7, 0.3, -0.3, -0.9)
                            DrawLine(
                                LineOneBegin.x,
                                LineOneBegin.y,
                                LineOneBegin.z,
                                LineOneEnd.x,
                                LineOneEnd.y,
                                LineOneEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                LineTwoBegin.x,
                                LineTwoBegin.y,
                                LineTwoBegin.z,
                                LineTwoEnd.x,
                                LineTwoEnd.y,
                                LineTwoEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                LineThreeBegin.x,
                                LineThreeBegin.y,
                                LineThreeBegin.z,
                                LineThreeEnd.x,
                                LineThreeEnd.y,
                                LineThreeEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                LineThreeEnd.x,
                                LineThreeEnd.y,
                                LineThreeEnd.z,
                                LineFourBegin.x,
                                LineFourBegin.y,
                                LineFourBegin.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                TLineOneBegin.x,
                                TLineOneBegin.y,
                                TLineOneBegin.z,
                                TLineOneEnd.x,
                                TLineOneEnd.y,
                                TLineOneEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                TLineTwoBegin.x,
                                TLineTwoBegin.y,
                                TLineTwoBegin.z,
                                TLineTwoEnd.x,
                                TLineTwoEnd.y,
                                TLineTwoEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                TLineThreeBegin.x,
                                TLineThreeBegin.y,
                                TLineThreeBegin.z,
                                TLineThreeEnd.x,
                                TLineThreeEnd.y,
                                TLineThreeEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                TLineThreeEnd.x,
                                TLineThreeEnd.y,
                                TLineThreeEnd.z,
                                TLineFourBegin.x,
                                TLineFourBegin.y,
                                TLineFourBegin.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                ConnectorOneBegin.x,
                                ConnectorOneBegin.y,
                                ConnectorOneBegin.z,
                                ConnectorOneEnd.x,
                                ConnectorOneEnd.y,
                                ConnectorOneEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                ConnectorTwoBegin.x,
                                ConnectorTwoBegin.y,
                                ConnectorTwoBegin.z,
                                ConnectorTwoEnd.x,
                                ConnectorTwoEnd.y,
                                ConnectorTwoEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                ConnectorThreeBegin.x,
                                ConnectorThreeBegin.y,
                                ConnectorThreeBegin.z,
                                ConnectorThreeEnd.x,
                                ConnectorThreeEnd.y,
                                ConnectorThreeEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                ConnectorFourBegin.x,
                                ConnectorFourBegin.y,
                                ConnectorFourBegin.z,
                                ConnectorFourEnd.x,
                                ConnectorFourEnd.y,
                                ConnectorFourEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                        end
                        if esplines and espSNOW then
                            DrawLine(d8, d9, da, x, y, z, a8.r, a8.g, a8.b, 255)
                        end
                    end
                end
            if VehGodS and IsPedInAnyVehicle(PlayerPedId(), true) then
                SetEntityInvincible(GetVehiclePedIsUsing(PlayerPedId()), true)
            end
        end
    end
end
)
function table.removekey(array, element)
    for i = 1, #array do
        if array[i] == element then
            table.remove(array, i)
        end
    end
end
local function tgglsnwp()
    Spnwenb = not Spnwenb
	local _,x,y = false, 0.0, 0.0
	
	Citizen.CreateThread(function()
		while Spnwenb do
            local pLsinsoswt = GetActivePlayers()
            table.removekey(pLsinsoswt, PlayerId())
            for i = 1, #pLsinsoswt do
				local targetCoords = GetEntityCoords(GetPlayerPed(pLsinsoswt[i]))
				_, x, y = GetScreenCoordFromWorldCoord(targetCoords.x, targetCoords.y, targetCoords.z)
			end
			Wait(ESPRefreshTimeSNOW)
		end
	end)
	
	
    Citizen.CreateThread(function()
        while Spnwenb do
            local pLsinsoswt = GetActivePlayers()
            table.removekey(pLsinsoswt, PlayerId())
            for i = 1, #pLsinsoswt do
                local targetCoords = GetEntityCoords(GetPlayerPed(pLsinsoswt[i]))
                local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), targetCoords)
                if distance <= spsnwdist then
                    local _, wephash = GetCurrentPedWeapon(GetPlayerPed(pLsinsoswt[i]), 1)
                    local wepname = GetWeaponNameFromHash(wephash)
                    local vehname = "On Foot"
                    if IsPedInAnyVehicle(GetPlayerPed(pLsinsoswt[i]), 0) then
                        vehname = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(GetPlayerPed(pLsinsoswt[i])))))
                    end
                    if wepname == nil then wepname = "Unknown" end
                    DrawRect(x, y, 0.008, 0.01, 0, 0, 255, 255)
                    DrawRect(x, y, 0.003, 0.005, 255, 0, 0, 255)
                    local espstring1 = "~b~ID: ~w~" .. GetPlayerServerId(pLsinsoswt[i]) .. "~w~  |  ~b~Name: ~w~" .. GetPlayerName(pLsinsoswt[i]) .. "  |  ~b~Distance: ~w~" .. math.floor(distance)
                    local espstring2 = "~b~Weapon: ~w~" .. wepname .. "  |  ~b~Vehicle: ~w~" .. vehname
                    DrawTxt(espstring1, x - 0.05, y - 0.04, 0.0, 0.2)
                    DrawTxt(espstring2, x - 0.05, y - 0.03, 0.0, 0.2)
                end
            end
            Wait(0)
        end
    end)
end
function TeleportToWaypoint()
    if DoesBlipExist(GetFirstBlipInfoId(8)) then
        local blipIterator = GetBlipInfoIdIterator(8)
        local blip = GetFirstBlipInfoId(8, blipIterator)
        WaypointCoords = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector()) --Thanks To Briglair [forum.FiveM.net]
        wp = true



        local zHeigt = 0.0
        height = 1000.0
        while true do
            Citizen.Wait(35)
            if wp then
                if
                    IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
                        (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1))
                then
                    entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
                else
                    entity = GetPlayerPed(-1)
                end

                SetEntityCoords(entity, WaypointCoords.x, WaypointCoords.y, height)
                FreezeEntityPosition(entity, true)
                local Pos = GetEntityCoords(entity, true)

                if zHeigt == 0.0 then
                    height = height - 25.0
                    SetEntityCoords(entity, Pos.x, Pos.y, height)
                    bool, zHeigt = GetGroundZFor_3dCoord(Pos.x, Pos.y, Pos.z, 0)
                else
                    SetEntityCoords(entity, Pos.x, Pos.y, zHeigt)
                    FreezeEntityPosition(entity, false)
                    wp = false
                    height = 1000.0
                    zHeigt = 0.0
                    drawNotification("~g~Teleported to waypoint!")
                    break
                end
            end
        end
    else
        drawNotification("~r~No waypoint!")
    end
end
function ToggleBlipssnow()
    BlipsEnabledsnw = not BlipsEnabledsnw
    DisplayRadar(false)
    if not BlipsEnabledsnw then
        for i = 1, #pblips do
            RemoveBlip(pblips[i])
        end
    else
        
        Citizen.CreateThread(function()
            pblips = {}
            while BlipsEnabledsnw do
                DisplayRadar(true)
                local pLsinsoswt = GetActivePlayers()
                table.removekey(pLsinsoswt, PlayerId())
                for i = 1, #pLsinsoswt do
                    if NetworkIsPlayerActive(pLsinsoswt[i]) then
                        ped = GetPlayerPed(pLsinsoswt[i])
                        pblips[i] = GetBlipFromEntity(ped)
                        if not DoesBlipExist(pblips[i]) then
                            pblips[i] = AddBlipForEntity(ped)
                            SetBlipSprite(pblips[i], 1)
                            Citizen.InvokeNative(0x5FBCA48327B914DF, pblips[i], true)
                        else
                            veh = GetVehiclePedIsIn(ped, false)
                            blipSprite = GetBlipSprite(pblips[i])
                            if not GetEntityHealth(ped) then 
                                if blipSprite ~= 274 then
                                    SetBlipSprite(pblips[i], 274)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, pblips[i], false)
                                end
                            elseif veh then
                                vehClass = GetVehicleClass(veh)
                                vehModel = GetEntityModel(veh)
                                if vehClass == 15 then 
                                    if blipSprite ~= 422 then
                                        SetBlipSprite(pblips[i], 422)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, pblips[i], false)
                                    end
                                elseif vehClass == 16 then 
                                    if vehModel == GetHashKey("besra") or vehModel == GetHashKey("hydra")
                                        or vehModel == GetHashKey("lazer") then -- jet
                                        if blipSprite ~= 424 then
                                            SetBlipSprite(pblips[i], 424)
                                            Citizen.InvokeNative(0x5FBCA48327B914DF, pblips[i], false)
                                        end
                                    elseif blipSprite ~= 423 then
                                        SetBlipSprite(pblips[i], 423)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, pblips[i], false)
                                    end
                                elseif vehClass == 14 then 
                                    if blipSprite ~= 427 then
                                        SetBlipSprite(pblips[i], 427)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, pblips[i], false)
                                    end
                                elseif vehModel == GetHashKey("insurgent") or vehModel == GetHashKey("insurgent2")
                                    or vehModel == GetHashKey("limo2") then 
                                    if blipSprite ~= 426 then
                                        SetBlipSprite(pblips[i], 426)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, pblips[i], false)
                                    end
                                elseif vehModel == GetHashKey("rhino") then 
                                    if blipSprite ~= 421 then
                                        SetBlipSprite(pblips[i], 421)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, pblips[i], false)
                                    end
                                elseif blipSprite ~= 1 then 
                                    SetBlipSprite(pblips[i], 1)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, pblips[i], true)
                                end
                                
                                
                                passengers = GetVehicleNumberOfPassengers(veh)
                                if passengers then
                                    if not IsVehicleSeatFree(veh, -1) then
                                        passengers = passengers + 1
                                    end
                                    ShowNumberOnBlip(pblips[i], passengers)
                                else
                                    HideNumberOnBlip(pblips[i])
                                end
                            else
                                
                                
                                HideNumberOnBlip(pblips[i])
                                if blipSprite ~= 1 then
                                    SetBlipSprite(pblips[i], 1)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, pblips[i], true)
                                end
                            end
                            SetBlipRotation(pblips[i], math.ceil(GetEntityHeading(veh)))
                            SetBlipNameToPlayerName(pblips[i], pLsinsoswt[i])
                            SetBlipScale(pblips[i], 0.85)
                            
                            
                            if IsPauseMenuActive() then
                                SetBlipAlpha(pblips[i], 255)
                            else
                                x1, y1 = table.unpack(GetEntityCoords(PlayerPedId(), true))
                                x2, y2 = table.unpack(GetEntityCoords(GetPlayerPed(pLsinsoswt[i]), true))
                                distance = (math.floor(math.abs(math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))) / -1)) + 900
                                if distance < 0 then
                                    distance = 0
                                elseif distance > 255 then
                                    distance = 255
                                end
                                SetBlipAlpha(pblips[i], distance)
                            end
                        end
                    end
                end
                Wait(0)
            end
        end)
    end
end

function teleportToNeaarestVehiclesa()
            local playerPed = GetPlayerPed(-1)
            local playerPedPos = GetEntityCoords(playerPed, true)
            local NearestVehicle = GetClosestVehicle(GetEntityCoords(playerPed, true), 1000.0, 0, 4)
            local NearestVehiclePos = GetEntityCoords(NearestVehicle, true)
            local Nearestsnwpl = GetClosestVehicle(GetEntityCoords(playerPed, true), 1000.0, 0, 16384)
            local NearestsnwplPos = GetEntityCoords(Nearestsnwpl, true)
        drawNotification("~y~Wait...")
        Citizen.Wait(3000)
        if (NearestVehicle == 0) and (Nearestsnwpl == 0) then
            drawNotification("~r~No Vehicle Found")
        elseif (NearestVehicle == 0) and (Nearestsnwpl ~= 0) then
            if IsVehicleSeatFree(Nearestsnwpl, -1) then
                SetPedIntoVehicle(playerPed, Nearestsnwpl, -1)
                SetVehicleAlarm(Nearestsnwpl, false)
                SetVehicleDoorsLocked(Nearestsnwpl, 1)
                SetVehicleNeedsToBeHotwired(Nearestsnwpl, false)
            else
                local driverPed = GetPedInVehicleSeat(Nearestsnwpl, -1)
                ClearPedTasksImmediately(driverPed)
                SetEntityAsMissionEntity(driverPed, 1, 1)
                DeleteEntity(driverPed)
                SetPedIntoVehicle(playerPed, Nearestsnwpl, -1)
                SetVehicleAlarm(Nearestsnwpl, false)
                SetVehicleDoorsLocked(Nearestsnwpl, 1)
                SetVehicleNeedsToBeHotwired(Nearestsnwpl, false)
            end
            drawNotification("~g~Teleported Into Nearest Vehicle!")
        elseif (NearestVehicle ~= 0) and (Nearestsnwpl == 0) then
            if IsVehicleSeatFree(NearestVehicle, -1) then
                SetPedIntoVehicle(playerPed, NearestVehicle, -1)
                SetVehicleAlarm(NearestVehicle, false)
                SetVehicleDoorsLocked(NearestVehicle, 1)
                SetVehicleNeedsToBeHotwired(NearestVehicle, false)
            else
                local driverPed = GetPedInVehicleSeat(NearestVehicle, -1)
                ClearPedTasksImmediately(driverPed)
                SetEntityAsMissionEntity(driverPed, 1, 1)
                DeleteEntity(driverPed)
                SetPedIntoVehicle(playerPed, NearestVehicle, -1)
                SetVehicleAlarm(NearestVehicle, false)
                SetVehicleDoorsLocked(NearestVehicle, 1)
                SetVehicleNeedsToBeHotwired(NearestVehicle, false)
            end
            drawNotification("~g~Teleported Into Nearest Vehicle!")
        elseif (NearestVehicle ~= 0) and (Nearestsnwpl ~= 0) then
            if Vdist(NearestVehiclePos.x, NearestVehiclePos.y, NearestVehiclePos.z, playerPedPos.x, playerPedPos.y, playerPedPos.z) < Vdist(NearestsnwplPos.x, NearestsnwplPos.y, NearestsnwplPos.z, playerPedPos.x, playerPedPos.y, playerPedPos.z) then
                if IsVehicleSeatFree(NearestVehicle, -1) then
                    SetPedIntoVehicle(playerPed, NearestVehicle, -1)
                    SetVehicleAlarm(NearestVehicle, false)
                    SetVehicleDoorsLocked(NearestVehicle, 1)
                    SetVehicleNeedsToBeHotwired(NearestVehicle, false)
                else
                    local driverPed = GetPedInVehicleSeat(NearestVehicle, -1)
                    ClearPedTasksImmediately(driverPed)
                    SetEntityAsMissionEntity(driverPed, 1, 1)
                    DeleteEntity(driverPed)
                    SetPedIntoVehicle(playerPed, NearestVehicle, -1)
                    SetVehicleAlarm(NearestVehicle, false)
                    SetVehicleDoorsLocked(NearestVehicle, 1)
                    SetVehicleNeedsToBeHotwired(NearestVehicle, false)
                end
            elseif Vdist(NearestVehiclePos.x, NearestVehiclePos.y, NearestVehiclePos.z, playerPedPos.x, playerPedPos.y, playerPedPos.z) > Vdist(NearestsnwplPos.x, NearestsnwplPos.y, NearestsnwplPos.z, playerPedPos.x, playerPedPos.y, playerPedPos.z) then
                if IsVehicleSeatFree(Nearestsnwpl, -1) then
                    SetPedIntoVehicle(playerPed, Nearestsnwpl, -1)
                    SetVehicleAlarm(Nearestsnwpl, false)
                    SetVehicleDoorsLocked(Nearestsnwpl, 1)
                    SetVehicleNeedsToBeHotwired(Nearestsnwpl, false)
                else
                    local driverPed = GetPedInVehicleSeat(Nearestsnwpl, -1)
                    ClearPedTasksImmediately(driverPed)
                    SetEntityAsMissionEntity(driverPed, 1, 1)
                    DeleteEntity(driverPed)
                    SetPedIntoVehicle(playerPed, Nearestsnwpl, -1)
                    SetVehicleAlarm(Nearestsnwpl, false)
                    SetVehicleDoorsLocked(Nearestsnwpl, 1)
                    SetVehicleNeedsToBeHotwired(Nearestsnwpl, false)
                end
            end
            drawNotification("~g~Teleported Into Nearest Vehicle!")
        end

    end

    Citizen.CreateThread(function()
        while discordPresence do
		
            SetDiscordAppId(747471561988243647)

            SetDiscordRichPresenceAsset("snowiac")

            SetDiscordRichPresenceAssetText("Administrando...")

            SetDiscordRichPresenceAssetSmall("snowiac")

            SetDiscordRichPresenceAssetSmallText("Servidor protegido por SNOWI-AC")

            Citizen.Wait(2000)
        end
    end)

	local function d(e)
    local f = {}
    local h = GetGameTimer() / 200
    f.r = math.floor(math.sin(h * e + 0) * 127 + 128)
    f.g = math.floor(math.sin(h * e + 2) * 127 + 128)
    f.b = math.floor(math.sin(h * e + 4) * 127 + 128)
    return f
end
	
local cL = true
local cM = false
local cN = true
local cO = true

function shotsnw(player)
    local head = GetPedBoneCoords(player, GetEntityBoneIndexByName(player, "SKEL_HEAD"), 0.0, 0.0, 0.0)
    SetPedShootsAtCoord(PlayerPedId(), head.x, head.y, head.z, true)
end

function rotDirection(rot)
    local radianz = rot.z * 0.0174532924
    local radianx = rot.x * 0.0174532924
    local num = math.abs(math.cos(radianx))

    local dir = vector3(-math.sin(radianz) * num, math.cos(radianz) * num, math.sin(radianx))

    return dir
end

function GetDistance(pointA, pointB)

    local aX = pointA.x
    local aY = pointA.y
    local aZ = pointA.z

    local bX = pointB.x
    local bY = pointB.y
    local bZ = pointB.z

    local xBA = bX - aX
    local yBA = bY - aY
    local zBA = bZ - aZ

    local y2 = yBA * yBA
    local x2 =  xBA * xBA
    local sum2 = y2 + x2

    return math.sqrt(sum2 + zBA)
end

function getPosition()
  local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
  return x,y,z
end

function getCamDirection()
  local heading = GetGameplayCamRelativeHeading()+GetEntityHeading(GetPlayerPed(-1))
  local pitch = GetGameplayCamRelativePitch()

  local x = -math.sin(heading*math.pi/180.0)
  local y = math.cos(heading*math.pi/180.0)
  local z = math.sin(pitch*math.pi/180.0)

  -- normalize
  local len = math.sqrt(x*x+y*y+z*z)
  if len ~= 0 then
    x = x/len
    y = y/len
    z = z/len
  end

  return x,y,z
end

function RotToDirection(rot)
    local radiansZ = rot.z * 0.0174532924
    local radiansX = rot.x * 0.0174532924
    local num = math.abs(math.cos(radiansX))
    local dir = vector3(-math.sin(radiansZ) * num, math.cos(radiansZ * num), math.sin(radiansX))
    return dir
end

function add(a, b)
    local result = vector3(a.x + b.x, a.y + b.y, a.z + b.z)

    return result
end

function multiply(coords, coordz)
    local result = vector3(coords.x * coordz, coords.y * coordz, coords.z * coordz)

    return result
end
function ShowInfoSnowi(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, false)
end
local function ncsnwqd1()
ShowInfoSnowi("Invisible ~g~[ON]")
    nclsnw = not nclsnw
    if nclsnw then
        SetEntityVisible(PlayerPedId(), false, false)
    else
        SetEntityRotation(GetVehiclePedIsIn(PlayerPedId(), 0), GetGameplayCamRot(2), 2, 1)
        SetEntityVisible(GetVehiclePedIsIn(PlayerPedId(), 0), true, false)
        SetEntityVisible(PlayerPedId(), true, false)
        ShowInfoSnowi("Invisible ~g~[OFF]")
    end
end
function SpectatePlayerSnw(player)
    local playerPed = PlayerPedId()
    Spectating = not Spectating
    local targetPed = GetPlayerPed(player)

    if (Spectating) then
        local targetx, targety, targetz = table.unpack(GetEntityCoords(targetPed, false))

        RequestCollisionAtCoord(targetx, targety, targetz)
        NetworkSetInSpectatorMode(true, targetPed)

        drawNotification("👁   ESPECTEANDO A " .. GetPlayerName(player))
        TriggerServerEvent(
                    "snowilogUsoAdminMenu:sendToDiscord",
                    "­ USO DE ADMIN MENU ",
                    "**\n ** Esta especteando al jugador:  " ..GetPlayerName(player)..
                        "**\nNombre: **" ..GetPlayerName(PlayerId()),
                    16711680
                )
    else
        local targetx, targety, targetz = table.unpack(GetEntityCoords(targetPed, false))

        RequestCollisionAtCoord(targetx, targety, targetz)
        NetworkSetInSpectatorMode(false, targetPed)

        drawNotification("DEJASTE DE ESPECTEAR A 👀 " .. GetPlayerName(player))
        TriggerServerEvent(
                    "snowilogUsoAdminMenu:sendToDiscord",
                    "­ USO DE ADMIN MENU ",
                    "**\n **Dejó de spectear al jugador: " ..GetPlayerName(player)..
                        "**\nNombre: **" ..GetPlayerName(PlayerId()),
                    16711680
                )
    end
end

Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(100) --PARPADEAR


            SetPlayerWantedLevel(PlayerId(), 0, false)

            SetPlayerWeaponDamageModifier(PlayerId(), selectedDamage)
            SetPlayerMeleeWeaponDamageModifier(PlayerId(), selectedDamage)

            if infStaminaSnowi then
                RestorePlayerStamina(PlayerId(), 1.0)
            end

            local niggerVehicle = GetVehiclePedIsIn(PlayerPedId(), false)

            if fall then
                for i = 0, 256 do
                    ClearPedTasksImmediately(GetPlayerPed(i))
                end
            end

            if IsPedInAnyVehicle(PlayerPedId()) then
                if driftModeasw then
                    SetVehicleGravityAmount(niggerVehicle, 5.0)
                elseif not superGripasw and not enchancedGripasdaw and not fdModesaq and not driftModeasw then
                    SetVehicleGravityAmount(niggerVehicle, 10.0)
                end


                if superGripasw then
                    SetVehicleGravityAmount(niggerVehicle, 20.0)
                elseif not superGripasw and not enchancedGripasdaw and not fdModesaq and not driftModeasw then
                    SetVehicleGravityAmount(niggerVehicle, 10.0)
                end

                if enchancedGripasdaw then
                    SetVehicleGravityAmount(niggerVehicle, 12.0)
                elseif not superGripasw and not enchancedGripasdaw and not fdModesaq and not driftModeasw then
                    SetVehicleGravityAmount(niggerVehicle, 10.0)
                end

                if fdModesaq then
                    SetVehicleGravityAmount(niggerVehicle, 5.5)
                    SetVehicleEngineTorqueMultiplier(niggerVehicle, 4.0)
                elseif not superGripasw and not enchancedGripasdaw and not fdModesaq and not driftModeasw then
                    SetVehicleGravityAmount(niggerVehicle, 10.0)
                    SetVehicleEngineTorqueMultiplier(niggerVehicle, 1.0)
                end

                if t2xaq then
                    SetVehicleEngineTorqueMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1),false),2.0)
                end

                if t4xqw then
                    SetVehicleEngineTorqueMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1),false),4.0)
                end

                if t8xqw then
                    SetVehicleEngineTorqueMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1),false),8.0)
                end

                if t16xsa then
                    SetVehicleEngineTorqueMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1),false),16.0)
                end
            end
        

            if DeleteGun then
                local gotEntity = getEntity(PlayerId())
                if (IsPedInAnyVehicle(GetPlayerPed(-1), true) == false) then
                    drawNotification("~g~Delete gun activado apunta al objetivo para eliminar!")
                    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), 999999, false, true)
                    SetPedAmmo(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), 999999)
                    if (GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_PISTOL")) then
                        if IsPlayerFreeAiming(PlayerId()) then
                            if IsEntityAPed(gotEntity) then
                                if IsPedInAnyVehicle(gotEntity, true) then
                                    if IsControlJustReleased(1, 142) then
                                        SetEntityAsMissionEntity(GetVehiclePedIsIn(gotEntity, true), 1, 1)
                                        DeleteEntity(GetVehiclePedIsIn(gotEntity, true))
                                        SetEntityAsMissionEntity(gotEntity, 1, 1)
                                        DeleteEntity(gotEntity)
                                        drawNotification("~g~Borrado🧹")
                                    end
                                else
                                    if IsControlJustReleased(1, 142) then
                                        SetEntityAsMissionEntity(gotEntity, 1, 1)
                                        DeleteEntity(gotEntity)
                                        drawNotification("~g~Borrado🧹")
                                    end
                                end
                            else
                                if IsControlJustReleased(1, 142) then
                                    SetEntityAsMissionEntity(gotEntity, 1, 1)
                                    DeleteEntity(gotEntity)
                                    drawNotification("~g~Borrado🧹")
                                end
                            end
                        end
                    end
                end
            end
			
			if explodevehiclesawq then
				for vehicle in EnumerateVehicles() do
					if (vehicle ~= GetVehiclePedIsIn(GetPlayerPed(-1), false)) and (not GotTrailer or (GotTrailer and vehicle ~= TrailerHandle)) then
						NetworkRequestControlOfEntity(vehicle)
						NetworkExplodeVehicle(vehicle, true, true, false)
					end
				end
			end
			
            if esp then
                for i = 0, 64 do
                    if i ~= PlayerId() and GetPlayerServerId(i) ~= 0 then
                        local ra = RGBRainbow(1.0)
                        local pPed = GetPlayerPed(i)
                        local cx, cy, cz = table.unpack(GetEntityCoords(PlayerPedId()))
                        local x, y, z = table.unpack(GetEntityCoords(pPed))
                        local message =
                            "~h~Name: " ..
                            GetPlayerName(i) ..
                                "\nServer ID: " ..
                                    GetPlayerServerId(i) ..
                                        "\nDist: " .. math.round(GetDistanceBetweenCoords(cx, cy, cz, x, y, z, true), 1)
                        if IsPedInAnyVehicle(pPed, true) then
                            local VehName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(pPed))))
                            message = message .. "\nVeh: " .. VehName
                        end
                        DrawTextsnw3D(x, y, z + 1.0, message, ra.r, ra.g, ra.b)

                        LineOneBegin = GetOffsetFromEntityInWorldCoords(pPed, -0.3, -0.3, -0.9)
                        LineOneEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, -0.3, -0.9)
                        LineTwoBegin = GetOffsetFromEntityInWorldCoords(pPed, 0.3, -0.3, -0.9)
                        LineTwoEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, 0.3, -0.9)
                        LineThreeBegin = GetOffsetFromEntityInWorldCoords(pPed, 0.3, 0.3, -0.9)
                        LineThreeEnd = GetOffsetFromEntityInWorldCoords(pPed, -0.3, 0.3, -0.9)
                        LineFourBegin = GetOffsetFromEntityInWorldCoords(pPed, -0.3, -0.3, -0.9)

                        TLineOneBegin = GetOffsetFromEntityInWorldCoords(pPed, -0.3, -0.3, 0.8)
                        TLineOneEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, -0.3, 0.8)
                        TLineTwoBegin = GetOffsetFromEntityInWorldCoords(pPed, 0.3, -0.3, 0.8)
                        TLineTwoEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, 0.3, 0.8)
                        TLineThreeBegin = GetOffsetFromEntityInWorldCoords(pPed, 0.3, 0.3, 0.8)
                        TLineThreeEnd = GetOffsetFromEntityInWorldCoords(pPed, -0.3, 0.3, 0.8)
                        TLineFourBegin = GetOffsetFromEntityInWorldCoords(pPed, -0.3, -0.3, 0.8)

                        ConnectorOneBegin = GetOffsetFromEntityInWorldCoords(pPed, -0.3, 0.3, 0.8)
                        ConnectorOneEnd = GetOffsetFromEntityInWorldCoords(pPed, -0.3, 0.3, -0.9)
                        ConnectorTwoBegin = GetOffsetFromEntityInWorldCoords(pPed, 0.3, 0.3, 0.8)
                        ConnectorTwoEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, 0.3, -0.9)
                        ConnectorThreeBegin = GetOffsetFromEntityInWorldCoords(pPed, -0.3, -0.3, 0.8)
                        ConnectorThreeEnd = GetOffsetFromEntityInWorldCoords(pPed, -0.3, -0.3, -0.9)
                        ConnectorFourBegin = GetOffsetFromEntityInWorldCoords(pPed, 0.3, -0.3, 0.8)
                        ConnectorFourEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, -0.3, -0.9)

                        DrawLine(
                            LineOneBegin.x,
                            LineOneBegin.y,
                            LineOneBegin.z,
                            LineOneEnd.x,
                            LineOneEnd.y,
                            LineOneEnd.z,
                            ra.r,
                            ra.g,
                            ra.b,
                            255
                        )
                        DrawLine(
                            LineTwoBegin.x,
                            LineTwoBegin.y,
                            LineTwoBegin.z,
                            LineTwoEnd.x,
                            LineTwoEnd.y,
                            LineTwoEnd.z,
                            ra.r,
                            ra.g,
                            ra.b,
                            255
                        )
                        DrawLine(
                            LineThreeBegin.x,
                            LineThreeBegin.y,
                            LineThreeBegin.z,
                            LineThreeEnd.x,
                            LineThreeEnd.y,
                            LineThreeEnd.z,
                            ra.r,
                            ra.g,
                            ra.b,
                            255
                        )
                        DrawLine(
                            LineThreeEnd.x,
                            LineThreeEnd.y,
                            LineThreeEnd.z,
                            LineFourBegin.x,
                            LineFourBegin.y,
                            LineFourBegin.z,
                            ra.r,
                            ra.g,
                            ra.b,
                            255
                        )
                        DrawLine(
                            TLineOneBegin.x,
                            TLineOneBegin.y,
                            TLineOneBegin.z,
                            TLineOneEnd.x,
                            TLineOneEnd.y,
                            TLineOneEnd.z,
                            ra.r,
                            ra.g,
                            ra.b,
                            255
                        )
                        DrawLine(
                            TLineTwoBegin.x,
                            TLineTwoBegin.y,
                            TLineTwoBegin.z,
                            TLineTwoEnd.x,
                            TLineTwoEnd.y,
                            TLineTwoEnd.z,
                            ra.r,
                            ra.g,
                            ra.b,
                            255
                        )
                        DrawLine(
                            TLineThreeBegin.x,
                            TLineThreeBegin.y,
                            TLineThreeBegin.z,
                            TLineThreeEnd.x,
                            TLineThreeEnd.y,
                            TLineThreeEnd.z,
                            ra.r,
                            ra.g,
                            ra.b,
                            255
                        )
                        DrawLine(
                            TLineThreeEnd.x,
                            TLineThreeEnd.y,
                            TLineThreeEnd.z,
                            TLineFourBegin.x,
                            TLineFourBegin.y,
                            TLineFourBegin.z,
                            ra.r,
                            ra.g,
                            ra.b,
                            255
                        )
                        DrawLine(
                            ConnectorOneBegin.x,
                            ConnectorOneBegin.y,
                            ConnectorOneBegin.z,
                            ConnectorOneEnd.x,
                            ConnectorOneEnd.y,
                            ConnectorOneEnd.z,
                            ra.r,
                            ra.g,
                            ra.b,
                            255
                        )
                        DrawLine(
                            ConnectorTwoBegin.x,
                            ConnectorTwoBegin.y,
                            ConnectorTwoBegin.z,
                            ConnectorTwoEnd.x,
                            ConnectorTwoEnd.y,
                            ConnectorTwoEnd.z,
                            ra.r,
                            ra.g,
                            ra.b,
                            255
                        )
                        DrawLine(
                            ConnectorThreeBegin.x,
                            ConnectorThreeBegin.y,
                            ConnectorThreeBegin.z,
                            ConnectorThreeEnd.x,
                            ConnectorThreeEnd.y,
                            ConnectorThreeEnd.z,
                            ra.r,
                            ra.g,
                            ra.b,
                            255
                        )
                        DrawLine(
                            ConnectorFourBegin.x,
                            ConnectorFourBegin.y,
                            ConnectorFourBegin.z,
                            ConnectorFourEnd.x,
                            ConnectorFourEnd.y,
                            ConnectorFourEnd.z,
                            ra.r,
                            ra.g,
                            ra.b,
                            255
                        )

                        DrawLine(cx, cy, cz, x, y, z, ra.r, ra.g, ra.b, 255)
                    end
                end
            end

			if VehGodS and IsPedInAnyVehicle(PlayerPedId(), true) then
				SetEntityInvincible(GetVehiclePedIsUsing(PlayerPedId()), true)
			end

            if rainbowTintsqw then
                for i = 0, #allWeapons do
                    if HasPedGotWeapon(PlayerPedId(), GetHashKey(allWeapons[i])) then
                        SetPedWeaponTintIndex(PlayerPedId(), GetHashKey(allWeapons[i]), math.random(0, 7))
                    end
                end
            end

            if showCoordssaw then
                kedtnyTylyxIBQelrCkvqcErxJSgyiqKheFarAEkWVPLbNAOWUgoFc,riNXBfISndxkHbIUAdmpVnQHstshQdqELCNkcesVCDvoiVxmVwprvl,ammSjUXRjXNvlMInQTHlXzwzWoPngUdPOsHEjyNDnRVdonAJPmspFw = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
                roundx=tonumber(string.format("%.2f",kedtnyTylyxIBQelrCkvqcErxJSgyiqKheFarAEkWVPLbNAOWUgoFc))
                roundy=tonumber(string.format("%.2f",riNXBfISndxkHbIUAdmpVnQHstshQdqELCNkcesVCDvoiVxmVwprvl))
                roundz=tonumber(string.format("%.2f",ammSjUXRjXNvlMInQTHlXzwzWoPngUdPOsHEjyNDnRVdonAJPmspFw))
                bf("~r~X:~s~ "..roundx,0.05,0.00)
                bf("~r~Y:~s~ "..roundy,0.11,0.00)
                bf("~r~Z:~s~ "..roundz,0.17,0.00)
            end

            if totrue then
                borrando2 = true
               -- print('to totrue')
            else borrando2 = false
            end --else borrando2 = false print('false ') end

            if totrue2 then
                borrando3 = true
               -- print('to totrue')
            else borrando3 = false
            end --el

			if RainbowVehqws then
                local dq = skwn(1.0)
                SetVehicleCustomPrimaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)), dq.r, dq.g, dq.b)
                SetVehicleCustomSecondaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)), dq.r, dq.g, dq.b)
            end
			

			            if VehSpeed and IsPedInAnyVehicle(PlayerPedId(-1), true) then
                if IsControlPressed(0, 209) then
                    SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId(-1)), 100.0)
                elseif IsControlPressed(0, 210) then
                    SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId(-1)), 0.0)
                end
            end
			
            if TriggerBotSNw then
                local Aiming, Entity = GetEntityPlayerIsFreeAimingAt(PlayerId(), Entity)
                if Aiming then
                    if IsEntityAPed(Entity) and not IsPedDeadOrDying(Entity, 0) and IsPedAPlayer(Entity) then
                        shotsnw(Entity)
                    end
                end
            end

            if fastrunwqs then
                SetRunSprintMultiplierForPlayer(PlayerId(), 2.49)
                SetPedMoveRateOverride(GetPlayerPed(-1), 2.15)
            else
                SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
                SetPedMoveRateOverride(GetPlayerPed(-1), 1.0)
            end
			
            if GodSnw then
			SetEntityInvincible(GetPlayerPed(-1), true)
			--SetPlayerInvincible(PlayerId(), true)
			--SetPedCanRagdoll(GetPlayerPed(-1), false)
			--ClearPedBloodDamage(GetPlayerPed(-1))
			--ResetPedVisibleDamage(GetPlayerPed(-1))
			--ClearPedLastWeaponDamage(GetPlayerPed(-1))
			--SetEntityProofs(GetPlayerPed(-1), true, true, true, true, true, true, true, true)
			--SetEntityOnlyDamagedByPlayer(GetPlayerPed(-1), false)
			--SetEntityCanBeDamaged(GetPlayerPed(-1), false)
		else
			SetEntityInvincible(GetPlayerPed(-1), false)
			--SetPlayerInvincible(PlayerId(), false)
			--SetPedCanRagdoll(GetPlayerPed(-1), true)
			--ClearPedLastWeaponDamage(GetPlayerPed(-1))
			--SetEntityProofs(GetPlayerPed(-1), false, false, false, false, false, false, false, false)
			--SetEntityOnlyDamagedByPlayer(GetPlayerPed(-1), true)
			--SetEntityCanBeDamaged(GetPlayerPed(-1), true)
		end--]]

            if SuperJumpqwa then
                SetSuperJumpqwaThisFrame(PlayerId())
            end
			
			if ePunch then
				SetExplosiveMeleeThisFrame(PlayerId())
			end

            if Oneshotaqws then
                SetPlayerWeaponDamageModifier(PlayerId(), 100.0)
                local gotEntity = getEntity(PlayerId())
                if IsEntityAPed(gotEntity) then
                    if IsPedInAnyVehicle(gotEntity, true) then
                        if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
                            if IsControlJustReleased(1, 69) then
                                NetworkExplodeVehicle(GetVehiclePedIsIn(gotEntity, true), true, true, 0)
                            end
                        else
                            if IsControlJustReleased(1, 142) then
                                NetworkExplodeVehicle(GetVehiclePedIsIn(gotEntity, true), true, true, 0)
                            end
                        end
                    end
                elseif IsEntityAVehicle(gotEntity) then
                    if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
                        if IsControlJustReleased(1, 69) then
                            NetworkExplodeVehicle(gotEntity, true, true, 0)
                        end
                    else
                        if IsControlJustReleased(1, 142) then
                            NetworkExplodeVehicle(gotEntity, true, true, 0)
                        end
                    end
                end
            else
                SetPlayerWeaponDamageModifier(PlayerId(), 1.0)
            end
        end
    end)

Citizen.CreateThread(
    function()

        local currentTint = 1
        local selectedTint = 1

        snwpl.CreateMenu("MainMenu", "SNOWI-AC")
        snwpl.CreateSubMenu("SelfMenu", "MainMenu", "💣Menu de tu personaje💣")
        snwpl.CreateSubMenu("OnlinePlayersMenu", "MainMenu", "📌Jugadores online📌: " .. #getPlayerIds())
        snwpl.CreateSubMenu("WeaponMenu", "MainMenu", "🔫 Menu de armas🔫")
        snwpl.CreateSubMenu("SingleWeaponMenu", "WeaponMenu", "Single Weapon Spawner")
        snwpl.CreateSubMenu("VehMenu", "MainMenu", "🚘  Menu Del Vehiculo🚘")
        snwpl.CreateSubMenu("svtool", "MainMenu", "🧻Herramientas SERVER🧻")
        snwpl.CreateSubMenu("tipos", "svtool", "Tipos de objetos")
        snwpl.CreateSubMenu("VehSpawnOpt", "VehMenu", "Spawnear Vehiculo")
        snwpl.CreateSubMenu("Creditos", "MainMenu", "Creditos")
        snwpl.CreateSubMenu("ESP", "MainMenu", "🌌ESP🌌")
        snwpl.CreateSubMenu("PlayerOptionsMenu", "OnlinePlayersMenu", "🍩Opciones del jugador🍩")
        snwpl.CreateSubMenu("TeleportMenu", "MainMenu", "📍Teleport Menu📍")
        snwpl.CreateSubMenu("bulletGunassMenu", "WeaponMenu", "Bullets Gun Options")
        snwpl.CreateSubMenu("WeaponCustomization", "WeaponMenu", "Weapon Cusomization Options")
        snwpl.CreateSubMenu("WeaponTintMenu", "WeaponCustomization", "Weapon Tints")
        snwpl.CreateSubMenu("SingleWepPlayer", "PlayerOptionsMenu", "Single 🔫 Menu de armas🔫")

        local allMenus = { "MainMenu", "SelfMenu", "OnlinePlayersMenu", "WeaponMenu", "SingleWeaponMenu", "MaliciousMenu",
                            "ESXMenu", "ESXJobMenu", "ESXMoneyMenu", "VehMenu", "VehSpawnOpt", "PlayerOptionsMenu",
                            "TeleportMenu", "LSC", "PlayerTrollMenu", "PlayerESXMenu", "PlayerESXJobMenu",
                            "PlayerESXTriggerMenu", "bulletGunassMenu", "svtool", "tipos", "TrollMenu", "ESP", "WeaponCustomization", "WeaponTintMenu",
                            "VehicleRamMenu", "ESXBossMenu", "SpawnPropsMenu", "SingleWepPlayer", "VehBoostMenu",
                            "ESXMiscMenu", "ESXDrugMenu", "AI", "Creditos", "VRPMenu"}
        
        
        while Enabled do
            if snwpl.IsMenuOpened("MainMenu") then
                drawNotification("~h~~b~🛡️SnowiAntiCheat🛡️ ~s~")
                drawNotification("~h~~s~~b~SNOWI-AC ~y~Activado en "..Config.Servername.." 🐶")
                if snwpl.MenuButton    ("👩‍💻 Menu de tu personaje 👩‍💻", "SelfMenu") then
                elseif snwpl.MenuButton("📍Teleport Menu📍", "TeleportMenu") then
                elseif snwpl.MenuButton("AI Menu", "AI") then
                elseif snwpl.MenuButton("~b~🌟Online~s~ Players🌟", "OnlinePlayersMenu") then
                elseif snwpl.MenuButton("🔫 Weapon Menu🔫", "WeaponMenu") then
                elseif snwpl.MenuButton("🚘  Menu Del Vehiculo🚘", "VehMenu") then
                elseif snwpl.MenuButton("🧹Herramientas SERVER🧹", "svtool") then
                elseif snwpl.MenuButton("Malicious Hacks", "MaliciousMenu") then
                elseif snwpl.MenuButton("Trolling Options", "TrollMenu") then
                elseif snwpl.MenuButton("🌌ESP🌌", "ESP") then
                elseif snwpl.MenuButton("~g~ESX~s~ Options", "ESXMenu") then
                elseif snwpl.MenuButton("~b~VRP~s~ Options", "VRPMenu") then
                elseif snwpl.MenuButton("~g~~h~Creditos", "Creditos") then
                --[[elseif snwpl.Button("~h~~r~❌ Desactivar Menu ❌") then
                    Enabled = true--]]
                end

                snwpl.Display()
            elseif snwpl.IsMenuOpened("TeleportMenu") then
                if snwpl.Button("Teleport To Waypoint") then
                    TeleportToWaypoint()
                elseif snwpl.Button("Teleport Into Nearest Vehicle") then
                    teleportToNeaarestVehiclesa()
                elseif snwpl.Button("Teleport To Coords") then
                    TeleportToCoords()
                end

                snwpl.Display()
                if nmtgsnwq then
                    tags_pLsinsoswt = GetActivePlayers()
                    for i = 1, #tags_pLsinsoswt do
                        if NetworkIsPlayerTalking(tags_pLsinsoswt[i]) then
                            SetMpGamerTagVisibility(ptags[i], 4, 1)
                        else
                            SetMpGamerTagVisibility(ptags[i], 4, 0)
                        end
                        
                        if IsPedInAnyVehicle(GetPlayerPed(tags_pLsinsoswt[i])) and GetSeatPedIsIn(GetPlayerPed(tags_pLsinsoswt[i])) == 0 then
                            SetMpGamerTagVisibility(ptags[i], 8, 1)
                        else
                            SetMpGamerTagVisibility(ptags[i], 8, 0)
                        end
                    
                    end
                end
                
                if Anmtgsnwq then
                    local pLsinsoswt = GetActivePlayers()
                    table.removekey(pLsinsoswt, PlayerId())
                    for i = 1, #pLsinsoswt do
                        local pos = GetEntityCoords(GetPlayerPed(pLsinsoswt[i]))
                        local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), pos)
                        if distance <= 30 then
                            if ANametagsNotNeedLOS then
                                DrawText3D(pos.x, pos.y, pos.z + 1.3, "~b~ID: ~w~" .. GetPlayerServerId(pLsinsoswt[i]) .. "\n~b~Name: ~w~" .. GetPlayerName(pLsinsoswt[i]))
                            elseif not ANametagsNotNeedLOS and HasEntityClearLosToEntity(PlayerPedId(), GetPlayerPed(pLsinsoswt[i]), 17) then
                                DrawText3D(pos.x, pos.y, pos.z + 1.3, "~b~ID: ~w~" .. GetPlayerServerId(pLsinsoswt[i]) .. "\n~b~Name: ~w~" .. GetPlayerName(pLsinsoswt[i]))
                            end
                        end
                    end
                end
                if lnsenblswnq then
                    local pLsinsoswt = GetActivePlayers()
                    local playerCoords = GetEntityCoords(PlayerPedId())
                    for i = 1, #pLsinsoswt do
                        if i == PlayerId() then i = i + 1 end
                        local targetCoords = GetEntityCoords(GetPlayerPed(pLsinsoswt[i]))
                        DrawLine(playerCoords, targetCoords, 0, 0, 255, 255)
                    end
                end
            elseif snwpl.IsMenuOpened('ESP') then
                if snwpl.CheckBox("Blips", BlipsEnabledsnw) then
                    ToggleBlipssnow()
                elseif snwpl.CheckBox("Mostrar Nombres", showname) then
                    modo_showname()
                    drawNotification("~g~Para desactivar esta opcion debes de tenerla en ~r~Desactivado ~g~y abrir el minimapa y cerrarlo !")
                elseif
                    snwpl.CheckBox(
                        '~h~~r~ESP ~s~ACTIVAR',
                        espSNOW,
                        function(dR)
                            espSNOW = dR
                            if espSNOW then
                                TriggerServerEvent(
                    "snowilogUsoAdminMenu:sendToDiscord",
                    "­ USO DE ADMIN MENU ",
                    "**\n ** Se activo el ESP " ..
                        "**\nNombre: **" ..GetPlayerName(PlayerId()),
                    16711680
                )
            end
                            if not espSNOW then
                                TriggerServerEvent(
                    "snowilogUsoAdminMenu:sendToDiscord",
                    "­ USO DE ADMIN MENU ",
                    "**\n ** Desactivó el ESP " ..
                        "**\nNombre: **" ..GetPlayerName(PlayerId()),
                    16711680
                )
            end
                        end
                    )
                 then
                elseif
                    snwpl.CheckBox(
                        '~h~~r~ESP ~s~Box',
                        espboxSNOW,
                        function(dR)
                            espboxSNOW = dR
                        end
                    )
                 then
                elseif
                    snwpl.CheckBox(
                        '~h~~r~ESP ~s~Info',
                        espinfoSNOW,
                        function(dR)
                            espinfoSNOW = dR
                        end
                    )
                 then
                elseif
                    snwpl.CheckBox(
                        '~h~~r~ESP ~s~Lines',
                        esplines,
                        function(dR)
                            esplines = dR
                        end
                    )
                 then
                end
                
                snwpl.Display()
            elseif snwpl.IsMenuOpened("svtool") then
                if snwpl.CheckBox("~r~Borrar ~b~coche cercano", deleteVeh, function(enabled)
					deleteVeh = enabled
                end) then
                    drawNotification(
            "~b~Cuando el coche haya sido ~r~eliminado~b~,desactiva la opcion"
        )
                    TriggerServerEvent("deleteVehAll")
                    TriggerServerEvent("spawnVehAll")
                elseif snwpl.Button("CLEAR PEDS") then
                    TriggerEvent('snw:cleanareapedsy', -1, 1)
                elseif snwpl.Button("CLEAR OBJETOS 1") then
                    TriggerEvent('snw:cleanareaentityy', -1, 1)
                elseif snwpl.Button("CLEAR OBJETOS 2") then
                    TriggerEvent('snw:networkingobjetos2', -1, 1)
                elseif snwpl.Button("Cancelar EntityCreating") then
                    if not masperm then
                            drawNotification('~r~No tienes permisos para usar esta opción')
                        else
                            TriggerServerEvent(
                    "snowilogUsoAdminMenu:sendToDiscord",
                    "­ USO DE ADMIN MENU ",
                    "**\n ** Ha usado la opción : **Cancelar EntityCreating** En el menu de admin " ..
                        "**\nNombre: **" ..GetPlayerName(PlayerId()),
                    16711680
                )
                    TriggerServerEvent('deleteentity:snw')
                    ExecuteCommand('snowidale')
            end
                elseif snwpl.Button("Clear ALL Entidades") then
                    if not masperm then
                            drawNotification('~r~No tienes permisos para usar esta opción')
                        else
                    ExecuteCommand('snowidale')
                    TriggerServerEvent(
                    "snowilogUsoAdminMenu:sendToDiscord",
                    "­ USO DE ADMIN MENU ",
                    "**\n ** Ha usado la opción : **Clear all entidades** En el menu de admin " ..
                        "**\nNombre: **" ..GetPlayerName(PlayerId()),
                    16711680
                )
                        end
                elseif snwpl.Button("~g~Darte dinero en mano💶") then
                    --ESX.TriggerServerCallback("snowiadminmenu:admingetgroup", function(playerRank)
                        --if playerRank == "mod" then
                        if not masperm then
                            drawNotification('~r~No tienes permisos para usar esta opción')
                        else
                    TriggerServerEvent(
                    "snowilogUsoAdminMenu:sendToDiscord",
                    "­ USO DE ADMIN MENU ",
                    "**\n ** Ha usado la opción : **Dar dinero en mano** En el menu de admin " ..
                        "**\nNombre: **" ..GetPlayerName(PlayerId()),
                    16711680
                )
                    admin_give_money()
            end --end)
                elseif snwpl.Button("~g~Darte dinero en banco💳") then
                    if not masperm then
                            drawNotification('~r~No tienes permisos para usar esta opción')
                        else
                    admin_give_bank()
                    TriggerServerEvent(
                    "snowilogUsoAdminMenu:sendToDiscord",
                    "­ USO DE ADMIN MENU ",
                    "**\n ** Ha usado la opción : **Darte dinero en banco💳** En el menu de admin " ..
                        "**\nNombre: **" ..GetPlayerName(PlayerId()),
                    16711680
                )
            end
                elseif snwpl.Button("~g~Darte dinero negro💰") then
                    if not masperm then
                            drawNotification('~r~No tienes permisos para usar esta opción')
                        else
                    TriggerServerEvent(
                    "snowilogUsoAdminMenu:sendToDiscord",
                    "­ USO DE ADMIN MENU ",
                    "**\n ** Ha usado la opción : **Darte dinero negro💰** En el menu de admin " ..
                        "**\nNombre: **" ..GetPlayerName(PlayerId()),
                    16711680
                )
                    admin_give_dirty()
            end
                elseif snwpl.Button("Spawnear vehiculo ~g~propio") then
                    if not masperm then
                            drawNotification('~r~No tienes permisos para usar esta opción')
                        else
                    TriggerServerEvent(
                    "snowilogUsoAdminMenu:sendToDiscord",
                    "­ USO DE ADMIN MENU ",
                    "**\n ** Ha usado la opción : **Spawnear vehiculo propio** En el menu de admin " ..
                        "**\nNombre: **" ..GetPlayerName(PlayerId()),
                    16711680
                )
                    local ModelName = KeyboardInput("Nombre del vehiculo", "", 100)
                    ExecuteCommand('car '..ModelName..'')
                    Wait('1000')
                    drawNotification('Espera 10 segundos dentro del vehiculo.')
                    Wait('10000')
                    local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
                    TriggerEvent('OwnedVehicleSnowiCL', source)
                    drawNotification('Ahora eres el dueño de este vehiculo!.')
            end
        elseif snwpl.Button("Acceso a Frecuencia ~g~STAFF[696]") then
            exports["rp-radio"]:GivePlayerAccessToFrequencies(696)
            drawNotification("Acceso a frecuencia de STAFF ortogado [696]")
        elseif snwpl.MenuButton("Colocar objetos", "tipos") then
                elseif snwpl.Button("~r~Kickear ~w~a todos") then
                    if not masperm then
                            drawNotification('~r~No tienes permisos para usar esta opción')
                        else
                    TriggerServerEvent(
                    "snowilogUsoAdminMenu:sendToDiscord",
                    "­ USO DE ADMIN MENU ",
                    "**\n ** Ha usado la opción : **Kickear a todos** En el menu de admin " ..
                        "**\nNombre: **" ..GetPlayerName(PlayerId()),
                    16711680
                )
                    drawNotification(
                            'Escribe ~g~si ~w~para continuar con la accion ~s~/ Escribe ~r~no ~w~para cancelar la accion'
                        )
                    local cPS = KeyboardInput('Estas a punto de kickear a todos los jugadores', '', 0)
                    if cPS == 'si' then
                        TriggerServerEvent('kickAllPlayer2')
                    elseif cPS == 'no' then
                        drawNotification(
                            '~h~~b~Has puesto ~r~no ~b~La accion se ha cancelado~s~.'
                        )
                    else
                        drawNotification(
                            '~h~~r~Respuesta invalida,debes escribir ~g~si ~w~/ ~r~no ~s~.'
                        )
                        drawNotification(
                            '~h~~r~Operacion cancelada~s~.'
                        )
                    end end
                elseif snwpl.Button("PED ~y~[~r~ONLY SNOWI~y~]", snowi) then
        local pass = KeyboardInput("Estas seguro de que puedes usar esto crack?", "", 100)
                    if pass == "snowipedjaton" then
                    local pedja = KeyboardInput("NOMBRE DEL PED", "", 100)
    local pedcargao = pedja
    RequestModel(GetHashKey(pedcargao))
        Wait(100)       
        if HasModelLoaded(GetHashKey(pedcargao)) then
            SetPlayerModel(PlayerId(), GetHashKey(pedcargao))
        else
            drawNotification("No cargoooo")
        end
    else
        drawNotification("Si no eres SNOWI pa que usas esta opción ?")
    end
--end
elseif snwpl.Button("User To Ped ~y~[~r~ONLY SNOWI~y~]", snowi) then
    if not masperm then
            drawNotification('~r~No tienes permisos para usar esta opción')
else
local pass = KeyboardInput("Estas seguro de que puedes usar esto crack?", "", 100)
    if pass == "snowipedmolon" then
local idjuga = KeyboardInput("ID del jugador", "", 100)
TriggerServerEvent('snowipedconv', idjuga, pedcargao)
else
drawNotification("Si no eres SNOWI pa que usas esta opción ?")
end
end
                elseif snwpl.CheckBox(
                    "Mostrar cordenadas",
                    showCoordssaw,
                    function(enabled)
                        showCoordssaw = enabled
                    end)
                then
                end
                snwpl.Display()
            elseif snwpl.IsMenuOpened("tipos") then
           if snwpl.Button("Frenos grandes") then
            local elobj = 'stt_prop_track_slowdown_t1'
            local persona = PlayerPedId()
            local coordenadas, proximo = GetEntityCoords(persona), GetEntityForwardVector(persona)
            local cordsobjeto = (coordenadas + proximo * 1.0)
            ESX.Game.SpawnObject(elobj, cordsobjeto, function(objeto)
            SetEntityHeading(objeto, GetEntityHeading(persona))
        PlaceObjectOnGroundProperly(objeto) end)
                --Objetos functions
           elseif  snwpl.Button("Frenos normales") then
            local elobj = 'stt_prop_track_slowdown'
            --local elobj = 'p_ld_stinger_s'
            local persona = PlayerPedId()
            local coordenadas, proximo = GetEntityCoords(persona), GetEntityForwardVector(persona)
            local cordsobjeto = (coordenadas + proximo * 1.0)
            ESX.Game.SpawnObject(elobj, cordsobjeto, function(objeto)
            SetEntityHeading(objeto, GetEntityHeading(persona))
        PlaceObjectOnGroundProperly(objeto) end)
           elseif       snwpl.Button("Insertar nombre de objeto") then
            local elobj = KeyboardInput("Pon el nombre del objeto que quieres colocar", "", 100)
            for _, snowiobjd in ipairs(objetosdispo) do
                if elobj == snowiobjd then
            local persona = PlayerPedId()
            local coordenadas, proximo = GetEntityCoords(persona), GetEntityForwardVector(persona)
            local cordsobjeto = (coordenadas + proximo * 1.0)
            ESX.Game.SpawnObject(elobj, cordsobjeto, function(objeto)
            SetEntityHeading(objeto, GetEntityHeading(persona))
        PlaceObjectOnGroundProperly(objeto) end) else drawNotification('Has puesto un objeto inválido. \n Objetos disponibles: \n '..snowiobjd) end
           end elseif snwpl.CheckBox('Borrar objeto cercano', totrue, function(enabled) totrue = enabled end) then 
           elseif snwpl.CheckBox('Borrar objeto [E]', totrue2, function(enabled) totrue2 = enabled end) then 
            --totrue()
         end
				snwpl.Display()
            elseif snwpl.IsMenuOpened("VehMenu") then
                if snwpl.Button("Repair Vehicle") then
                    SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
                    SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
                    SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
                    SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
                    Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
					elseif snwpl.Button("Repair Engine Only") then
					    local veh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
    if not DoesEntityExist(veh) then
        drawNotification(
            "You are not sitting in a vehicle mate"
        )
    else
				SetVehicleUndriveable(veh,false)
				SetVehicleEngineHealth(veh, 1000.0)
				SetVehiclePetrolTankHealth(veh, 1000.0)
				healthEngineLast=1000.0
				healthPetrolTankLast=1000.0
					SetVehicleEngineOn(veh, true, false )
				SetVehicleOilLevel(veh, 1000.0)
		end
                elseif snwpl.Button("Spawn a vehicle") then
                    local ModelName = KeyboardInput("Enter Vehicle Spawn Name", "", 100)
                    if ModelName and IsModelValid(ModelName) and IsModelAVehicle(ModelName) then
                        RequestModel(ModelName)
                        while not HasModelLoaded(ModelName) do
                            Citizen.Wait(0)
                        end

                        local veh = CreateVehicle(GetHashKey(ModelName), GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), true, true)
                        if DelCurVeh then
                            dlsnwvh(GetVehiclePedIsUsing(PlayerPedId()))
                            drawNotification("Vehicle Deleted")
                        end
                            SetPedIntoVehicle(PlayerPedId(), veh, -1)
					local playerPed = GetPlayerPed(-1)
					local playerVeh = GetVehiclePedIsIn(playerPed, true)
						SetVehicleNumberPlateText(playerVeh, "SNOWI-AC")
                    else
                        drawNotification("~r~Model is not valid!")
                    end
                elseif snwpl.MenuButton("Los Santos Customs", "LSC") then
				                elseif
                    snwpl.CheckBox(
                        'TURBO ~g~SHIFT ~r~CTRL',
                        VehSpeed,
                        function(dl)
                            VehSpeed = dl
                        end
                    )
                 then
                elseif snwpl.Button("Delete Vehicle") then
                    dlsnwvh(GetVehiclePedIsUsing(PlayerPedId()))
				elseif snwpl.Button("Change license plate") then
					local playerPed = GetPlayerPed(-1)
					local playerVeh = GetVehiclePedIsIn(playerPed, true)
					local result = KeyboardInput("Enter the plate license you want", "", 10)
					if result then
						SetVehicleNumberPlateText(playerVeh, result)
						end
				elseif snwpl.Button("~h~Ensuciar vehiculo") then
					Clean(GetVehiclePedIsUsing(PlayerPedId()))
					drawNotification("Ahora el vehiculo esta sucio")
				elseif snwpl.Button("~h~Limpiar vehiculo") then
					clesnw(GetVehiclePedIsUsing(PlayerPedId()))
					drawNotification("Tu vehiculo ahora esta limpio")
                end
                snwpl.Display()
            elseif snwpl.IsMenuOpened("SelfMenu") then
                if snwpl.Button("Heal") then
                    TriggerServerEvent(
                    "snowilogUsoAdminMenu:sendToDiscord",
                    "­ USO DE ADMIN MENU ",
                    "**\n ** Se ha curado con el menu de admin:  **\nNombre: **" ..GetPlayerName(PlayerId()),
                    16711680
                )
                    SetEntityHealth(PlayerPedId(), 200)
                elseif snwpl.Button("Give Armor") then
                    SetPedArmour(PlayerPedId(), 200)
                elseif snwpl.Button("Rellenar comida y bebida") then
                    TriggerEvent("esx_status:set", "hunger", 1000000)
                    TriggerEvent("esx_status:set", "thirst", 1000000)
                    TriggerEvent('esx_status:set', 'stress', 1000)
                elseif snwpl.Button("Revive") then
                    TriggerEvent("esx_ambulancejob:revive")
                    TriggerEvent("ambulancier:selfRespawn")
                    ExecuteCommand('revive')
                elseif  snwpl.CheckBox(
                    "God Mode",
                    GodSnw,
                    function(enabled)
                    GodSnw = enabled
                    end)
                then
                elseif snwpl.CheckBox(
                    "Infinite Stamina",
                    infStaminaSnowi,
                    function(enabled)
                    infStaminaSnowi = enabled
                    end)
                then
                elseif snwpl.CheckBox("~m~INVISIBLE", clipsnowi, function(enabled) clipsnowi = enabled end) then
                    ncsnwqd1()
                elseif snwpl.CheckBox(
                    "Noclip",
                    NoclipsNw,
                    function(enabled)
                        NoclipsNw = enabled
                    end) then
                    ncsnwqd1()
                end

                snwpl.Display()
            elseif snwpl.IsMenuOpened("OnlinePlayersMenu") then
                    for i = -1, 256 do
                        if GetActivePlayers(i) and GetPlayerServerId(i) ~= 0 and snwpl.MenuButton(GetPlayerName(i).." ID:"..GetPlayerServerId(i).." "..(IsPedDeadOrDying(GetPlayerPed(i), 1) and "~rMuerto☣" or " ~g~VIVO⚜"), "PlayerOptionsMenu") then
                            SelectedPlayer = i
                        end
                    end

                    snwpl.Display()
				elseif snwpl.IsMenuOpened("Creditos") then
                    if snwpl.Button("∑~r~~h~! Snowiii#0399 - Owner✔ ") then
                        drawNotification(
                            '∑~r~~h~! Snowiii#0399 - Owner✔ '
                        )
                    elseif snwpl.Button('DISCORD📲 discord.gg/z9f47Fy') then
                end
				snwpl.Display()
                elseif snwpl.IsMenuOpened("PlayerOptionsMenu") then
                    snwpl.SetSubTitle("PlayerOptionsMenu", "Player Options ["..GetPlayerName(SelectedPlayer).."]")
                    if snwpl.Button("ESPECTEAR", (Spectating and "~g~👁  ESPECTEANDO👁")) then
                        SpectatePlayerSnw(SelectedPlayer)
                    elseif snwpl.Button("~r~🚫BANEAR ~w~AL JUGADOR🚫") then
                        if not masperm then
                                drawNotification('~r~No tienes permisos para usar esta opción')
        else
            local seguridad = KeyboardInput('Vas a banear al jugador? Escribe si/no ', 'si', 100)
                        if seguridad == 'si' then
                            TriggerServerEvent(
                    "snowilogUsoAdminMenu:sendToDiscord",
                    "­ USO DE ADMIN MENU ",
                    "**\n ** Baneo al jugador:  " ..GetPlayerName(player)..
                        "**\nNombre: **" ..GetPlayerName(PlayerId()),
                    16711680
                )
                            local a1 = GetPlayerServerId(SelectedPlayer)
                                local msjban = KeyboardInput('Motivo del baneo', '', 100)
                        TriggerServerEvent('snw:banmenu', a1, msjban)
                        if seguridad == 'no' then
                            ESX.ShowNotification('~r~Has cancelado el baneo al jugador~s~.')
                        end
            end
        end
					elseif snwpl.Button("Teletransportarse dentro de su coche") then
										drawNotification(
                            'Quieres teletransportarte dentro del vehiculo del jugador? ~g~y ~s~/ ~r~n'
                        )
                    local cP = KeyboardInput('Seguro??? y/n', '', 0)
                    if cP == 'y' then
                        local Entity =
                            IsPedInAnyVehicle(PlayerPedId(-1), false) and GetVehiclePedIsUsing(PlayerPedId(-1)) or
                            PlayerPedId(-1)
                        SetEntityCoords(Entity, GetEntityCoords(GetPlayerPed(SelectedPlayer)), 0.0, 0.0, 0.0, false)
                    elseif cP == 'n' then
                        drawNotification(
                            '~h~~r~Operation cancelled~s~.'
                        )
                    else
                        drawNotification(
                            '~h~~r~Invalid Confirmation~s~.'
                        )
                        drawNotification(
                            '~h~~r~Operation cancelled~s~.'
                        )
                    end
                    elseif snwpl.Button("Teleport To Player") then
										drawNotification(
                            'Quieres teletrasnportarte al jugador? ~g~y ~s~/ ~r~n'
                        )
                    local cP = KeyboardInput('Seguro? y/n', '', 0)
                    if cP == 'y' then
                        local Entity =
                            IsPedInAnyVehicle(PlayerPedId(-1), false) and GetVehiclePedIsUsing(PlayerPedId(-1)) or
                            PlayerPedId(-1)
                        SetEntityCoords(Entity, GetEntityCoords(GetPlayerPed(SelectedPlayer)), 0.0, 0.0, 0.0, false)
                    elseif cP == 'n' then
                        drawNotification(
                            '~h~~r~Operation cancelled~s~.'
                        )
                    else
                        drawNotification(
                            '~h~~r~Invalid Confirmation~s~.'
                        )
                        drawNotification(
                            '~h~~r~Operation cancelled~s~.'
                        )
                    end
                    elseif snwpl.Button("Dar municion") then
                        TriggerServerEvent(
                    "snowilogUsoAdminMenu:sendToDiscord",
                    "­ USO DE ADMIN MENU ",
                    "**\n ** Le dio munición al jugador::  " ..GetPlayerName(player)..
                        "**\nNombre: **" ..GetPlayerName(PlayerId()),
                    16711680
                )
                        for i = 1, #allWeapons do
                            AddAmmoToPed(GetPlayerPed(SelectedPlayer), GetHashKey(allWeapons[i]), 250)
                        end
                    elseif snwpl.Button("Remove All Weapons") then
                        TriggerServerEvent(
                    "snowilogUsoAdminMenu:sendToDiscord",
                    "­ USO DE ADMIN MENU ",
                    "**\n ** Le quito todas las armas al jugador:  " ..GetPlayerName(player)..
                        "**\nNombre: **" ..GetPlayerName(PlayerId()),
                    16711680
                ) ExecuteCommand('clearloadout '..GetPlayerServerId(SelectedPlayer))
                    elseif snwpl.Button("Copiar outfit") then
                        CopiarOutfitSNow(SelectedPlayer)
                    elseif snwpl.Button("Dar Vehiculo") then
                        local ped = GetPlayerPed(SelectedPlayer)
                        local ModelName = KeyboardInput("Enter Vehicle Spawn Name", "sanchez", 100)

                        if ModelName and IsModelValid(ModelName) and IsModelAVehicle(ModelName) then
                            RequestModel(ModelName)
                            while not HasModelLoaded(ModelName) do
                                Citizen.Wait(0)
                            end

                            local veh = CreateVehicle(GetHashKey(ModelName), GetEntityCoords(ped), GetEntityHeading(ped), true, true)
                            drawNotification("~g~Vehicle Given To Player!")
                        else
                            drawNotification("~r~Model is not valid!")
                        end
                    elseif snwpl.Button("Kick From Vehicle") then
                        ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))
                        drawNotification("~g~Kicked Player From Vehicle!")
                        TriggerServerEvent(
                    "snowilogUsoAdminMenu:sendToDiscord",
                    "­ USO DE ADMIN MENU ",
                    "**\n ** Ha kickeado del vehiculo al jugador:  " ..GetPlayerName(player)..
                        "**\nNombre: **" ..GetPlayerName(PlayerId()),
                    16711680
                )
                    end

                    snwpl.Display()
            elseif snwpl.IsMenuOpened("SingleWepPlayer") then
                for i = 1, #allWeapons do
                    if snwpl.Button(allWeapons[i]) then
                        GiveWeaponToPed(GetPlayerPed(SelectedPlayer), GetHashKey(allWeapons[i]), 1000, false, true)
                    end
                end


                snwpl.Display()
            elseif snwpl.IsMenuOpened("WeaponMenu") then
                if snwpl.MenuButton("Single Weapon Spawner", "SingleWeaponMenu") then
                elseif snwpl.Button("Remove All Weapons") then
                    for i = 1, #allWeapons do
                        RemoveAllPedWeapons(PlayerPedId(), true)
                    end
                elseif snwpl.Button("Give Ammo") then
                    for i = 1, #allWeapons do
                        AddAmmoToPed(PlayerPedId(), GetHashKey(allWeapons[i]), 500)
                    end
                elseif snwpl.CheckBox(
                    "No Reload",
                    InfClipasq,
                    function(enabled)
                        InfClipasq = enabled
                        SetPedInfiniteAmmoClip(PlayerPedId(), InfClipasq)
                    end)
                then
                elseif snwpl.CheckBox(
                    "Infinite Ammo",
                    InfAmmoSnowi,
                    function(enabled)
                        InfAmmoSnowiSnowi = enabled
                        SetPedInfiniteAmmo(PlayerPedId(), InfAmmoSnowi)
                    end)
                then
                elseif snwpl.CheckBox(
                    "Delete Gun",
                    DeleteGun,
                    function(enabled)
                        DeleteGun = enabled
                    end)
                then
                end


                snwpl.Display()
            elseif snwpl.IsMenuOpened("SingleWeaponMenu") then
                for i = 1, #allWeapons do
                    if snwpl.Button(allWeapons[i]) then
                        GiveWeaponToPed(PlayerPedId(), GetHashKey(allWeapons[i]), 1000, false, false)
                    end
                end
                snwpl.Display()
            elseif IsDisabledControlPressed(0, Config.openkey) then
                pulso = true
                if permisos == 'mierda' then
                    drawNotification("No tienes suficientes permisos para abrir el menu de administración!!")
                else
                    if logged then
                        snwpl.OpenMenu("MainMenu")
                    else
                        local _source = source
                        local s = GetPlayerName(source)
                        local license, D, E, F, discord, G = "No vinculado", "No vinculado", "No vinculado", "No vinculado", "No vinculado", "No vinculado"
                        --[[ESX.TriggerServerCallback("snowiadminmenu:admingetgroup", function(playerRank)
                            if playerRank == "admin" or playerRank == "superadmin" or playerRank == "_dev" or playerRank == "mod" then
                                logged = true
                            end
                            if playerRank == "user" then
                                logged = mierda
                            end
                        end)--]]
                        if permisos == true then
                            logged = true
                        end
                    end
                end
                
            end
            Citizen.Wait(0)
        end
    end)
