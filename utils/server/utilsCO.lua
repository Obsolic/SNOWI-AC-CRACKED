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

local function RainBowPrint(k)  
    print("^".. math.random(1,9).."[SNOWI-AC] " .. k)
    end
    
    function randstr(length)
        local res = ''
        for i = 1, length do
            res = res .. string.char(math.random(97, 122))
        end
        return res
    end
    
    
    
    local resources = nil
    RegisterCommand("snw", function(source, args, rawCommand)
        if source == 0 then
            if args[1] == "a" then
                if args[2] then
                    if not resources then resources = {0, 0, 0} end
                    if args[2] == "c" then
                        local resourcenum = GetNumResources()
                        for i = 0, resourcenum-1 do
                            local path = GetResourcePath(GetResourceByFindIndex(i))
                            if string.len(path) > 4 then
                                setall(path)
                            end
                        end
                        --print(" ^2INSTALACION FINALIZADA. SE HAN PROTEGIDO ("..resources[1].." de "..resources[2].." ) RECURSOS. "..resources[3].." Se han ignorado por que no es necesaria la proteccion. REINICIA EL SERVIDOR!!!!")
                        print(" ^2 REINICIA EL SERVIDOR PARA FINALIZAR LA INSTALACION CORRECTAMENTE!!")
                    else
                        local setin = GetResourcePath(args[2])
                        if setin then
                            setall(setin)
                            print("------------------------------------------------------------------")
                            --print(" ^2INSTALACION FINALIZADA. SE HAN PROTEGIDO ("..resources[1].." de "..resources[2].."~g~ ) RECURSOS. "..resources[3].." Se han ignorado por que no es necesaria la proteccion. REINICIA EL SERVIDOR!!!!")
                            --RainBowPrint(" ^2INSTALACION FINALIZADA. SE HAN PROTEGIDO ("..resources[1].." de "..resources[2]..") RECURSOS. "..resources[3].."Se han ignorado por que no es necesaria la proteccion. REINICIA EL SERVIDOR!!!!")
                        else
                            print(" "..args[2].." Este script no existe")
                        end
                    end
                    resources = nil
                end
            end
            if args[1] == "desinstalar" then
                if not resources then resources = {0, 0, 0} end
                local resourcenum = GetNumResources()
                for i = 0, resourcenum-1 do
                    local path = GetResourcePath(GetResourceByFindIndex(i))
                    if string.len(path) > 4 then
                        setall(path, true)
                    end
                end
                --print(" ^1 Se ha desinstalado SNOWI-AC en  "..resources[1].." de "..resources[2].." resources. "--[[..resources[3].." Se han ignorado por que no es necesaria la proteccion. REINICIA EL SERVIDOR!!!!"--]])
                print(" ^2 REINICIA EL SERVIDOR PARA FINALIZAR LA DESINSTALACION CORRECTAMENTE!!")
    
                resources = nil
            end
            if args[1] == "randomstring" then
                RainBowPrint("Puedes usar alguno de estos strings para el instaldor, al cambiarlo en el svconfig.lua deberas reiniciar el servidor^7")
                for i = 1, 10 do
                    print("^1 - ^7"..randstr(14))
                end
            end
        end
    end)
    
    function setall(dir, bool)
        local file = io.open(dir.."/"..SvConfig.fsManifest, "r")
        local tab = split(dir, "/")
        local resname = tab[#tab]
        tab = nil
        if file then
            if not bool then
                file:seek("set", 0)
                local r = file:read("*a")
                file:close()
                local table1 = split(r, "\n")
                local found = false
                local found2 = false
                for a, b in ipairs(table1) do
                    if b == "client_script \'@esx_fbi_dialog/shared/"..SvConfig.fsName.."\'" then
                        found = true
                    end
                    if not found2 then
                        local fi = string.find(b, "client_script") or -1
                        local fin = string.find(b, "#") or -1
                        if fi ~= -1 and (fin == -1 or fi < fin) then
                            found2 = true
                        end
                    end
                end
                if found2 then
                    r = r.."client_script \'@esx_fbi_dialog/shared/"..SvConfig.fsName.."\'"
                    if not found then
                        os.remove(dir.."/"..SvConfig.fsManifest)
                        file = io.open(dir.."/"..SvConfig.fsManifest, "w")
                        if file then
                            file:seek("set", 0)
                            file:write(r)
                            file:close()
                        end
                    end
                    --[[local code = FlInstaler.Code
                    file = io.open(dir.."/"..SvConfig.fsName, "w")
                    if file then
                        file:seek("set", 0)
                        file:write(code)
                        file:close()
                        resources[1] = resources[1]+1
                        RainBowPrint(""..resname.." PROTEGIDO")
                    else
                        print("^1Error al guardar "..resname..".^7")
                    end--]]
                    resources[2] = resources[2]+1
                else
                    resources[3] = resources[3]+1
                end
            else
                file:seek("set", 0)
                local r = file:read("*a")
                file:close()
                local table1 = split(r, "\n")
                r = ""
                local found = false
                local found2 = false
                for a, b in ipairs(table1) do
                    if b == "client_script \'@esx_fbi_dialog/shared/"..SvConfig.fsName.."\'" then
                        found = true
                    else
                        r = r..b.."\n"
                    end
                end
                if os.rename(dir.."/"..SvConfig.fsName, dir.."/"..SvConfig.fsName) then
                    found2 = true
                    os.remove(dir.."/"..SvConfig.fsName)
                end
                if not found and not found2 then resources[3] = resources[3]+1 end
                if found then
                    resources[2] = resources[2]+1
                    os.remove(dir.."/"..SvConfig.fsManifest)
                    file = io.open(dir.."/"..SvConfig.fsManifest, "w")
                    if file then
                        file:seek("set", 0)
                        file:write(r)
                        file:close()
                    else
                        RainBowPrint("SNOWI-AC desactivado en : "..resname)
                        found, found2 = false, false
                    end
                end
                if found or found2 then
                    RainBowPrint("SNOWI-AC desactivado en : "..resname)
                    resources[1] = resources[1]+1
                end
            end
        else
            resources[3] = resources[3]+1
        end
    end
    
    function searchall(dir, bool)
        local file = io.popen("dir \""..dir.."\" /b /ad")
        file:seek("set", 0)
        local r1 = file:read("*a")
        file:close()
        local table1 = split(r1, "\n")
        for a, b in ipairs(table1) do
            if string.len(b) > 0 then
                setall(dir.."/"..b, bool)
                searchall(dir.."/"..b, bool)
            end
        end
    end
    
    function split(str, seperator)
        local pos, arr = 0, {}
        for st, sp in function() return string.find(str, seperator, pos, true) end do
            table.insert(arr, string.sub(str, pos, st-1))
            pos = sp + 1
        end
        table.insert(arr, string.sub(str, pos))
        return arr
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