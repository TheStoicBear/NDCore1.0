NDCore = exports["ND_Core"]:GetCoreObject()

if config['/me'] then
    RegisterCommand('me', function(source, args)
        local player = source
        local character = NDCore.Functions.GetPlayer(player)
        local length = string.len(table.concat(args, " "))
        
        if length > 0 then
            local playerCoords = GetEntityCoords(GetPlayerPed(player))
            local proximityRadius = 10.0 -- Define your desired proximity radius here

            for _, target in ipairs(GetPlayers()) do
                if target ~= player then
                    local targetCoords = GetEntityCoords(GetPlayerPed(target))
                    local distance = #(playerCoords - targetCoords)
                    
                    if distance <= proximityRadius then
                        local message = "^*^3[ME] " .. character.firstName .. " " .. character.lastName .. " [" .. character.job .. "] (#" .. player .. ") " .. table.concat(args, " ")
                        
                        -- Trigger client event to display 3D text above the player's head
                        TriggerClientEvent("displayMeTextAboveHead", target, player, message)
                    end
                end
            end
        end
    end, false)
end






if config['/gme'] then
    RegisterCommand('gme', function(source, args)
        local player = source
        local source = source
        local character = NDCore.Functions.GetPlayer(source)
        local length = string.len(table.concat(args, " "))

        if length > 0 then
            TriggerClientEvent('chat:addMessage', -1, {
                args = {"^*^6[GME] " .. character.firstName .. " " .. character.lastName .. " [" .. character.job .. "] (#" .. player .. ")", table.concat(args, " ")}
            })
        end
    end, false)
end

if config['/do'] then
    RegisterCommand('do', function(source, args)
        local player = source
        local source = source
        local character = NDCore.Functions.GetPlayer(source)
        local length = string.len(table.concat(args, " "))

        if length > 0 then
            TriggerClientEvent('chat:addMessage', -1, {
                args = {"^*^2[DO] " .. character.firstName .. " " .. character.lastName .. " [" .. character.job .. "] (#" .. player .. ")", table.concat(args, " ")}
            })
        end
    end, false)
end

if config['/twt'] then
    RegisterCommand('twt', function(source, args)
        local player = source
        local source = source
        local character = NDCore.Functions.GetPlayer(source)
        local length = string.len(table.concat(args, " "))

        if length > 0 then
            TriggerClientEvent('chat:addMessage', -1, {
                args = {"^*^5[Twotter] @" .. character.data.twtName .. " (#" .. player .. ")", table.concat(args, " ")}
            })
        end
    end, false)
end

if config['/ooc'] then
    RegisterCommand('ooc', function(source, args)
        local player = source
        local source = source
        local character = NDCore.Functions.GetPlayer(source)
        local length = string.len(table.concat(args, " "))

        if length > 0 then
            TriggerClientEvent('chat:addMessage', -1, {
                args = {"^*^#808080[OOC] " .. GetPlayerName(source) .. " [" .. character.job .. "] (#" .. player .. ")", table.concat(args, " ")}
            })
        end
    end, false)
end

function hasDarkWebPermission(player, players, args)
    for _, department in pairs(config["/darkweb"].canNotSee) do
        if players[player].job == department then
            TriggerClientEvent("chat:addMessage", player, {
                color = {255, 0, 0},
                args = {"^*^5[System]", players[player].job .. " cannot access this command."}
            })

            return false
        end
    end

    for serverPlayer, playerInfo in pairs(players) do
        for _, department in pairs(config["/darkweb"].canNotSee) do
            if players[player].job == department then return false end
        end

        local length = string.len(table.concat(args, " "))

        if length > 0 then
            TriggerClientEvent("chat:addMessage", serverPlayer, {
                color = {0, 0, 0},
                args = {"^8^*[Dark Web] @Anonymous", table.concat(args, " ")}
            })
        end
    end
end

if config["/darkweb"].enabled then
    RegisterCommand("darkweb", function(source, args, rawCommand)
        local player = source
        local players = NDCore.Functions.GetPlayers()
        hasDarkWebPermission(player, players, args)
    end, false)
end

function hasRadioChatPermission(player, players, args)
    for _, department in pairs(config["/radiochat"].canNotSee) do
        if players[player].job == department then
            TriggerClientEvent("chat:addMessage", player, {
                color = {255, 0, 0},
                args = {"^*^5[System]", players[player].job .. " cannot access this command."}
            })

            return false
        end
    end

    for serverPlayer, playerInfo in pairs(players) do
        for _, department in pairs(config["/radiochat"].canNotSee) do
            if players[player].job == department then return false end
        end

        local length = string.len(table.concat(args, " "))

        if length > 0 then
            TriggerClientEvent("chat:addMessage", serverPlayer, {
                color = {0, 0, 0},
                args = {"^*^#35af79[Radio] " .. players[player].firstName .. " " .. players[player].lastName .. " [" .. players[player].job .. "] (#" .. player .. ")", table.concat(args, " ")}
            })
        end
    end
end

if config["/radiochat"].enabled then
    RegisterCommand("radiochat", function(source, args, rawCommand)
        local player = source
        local players = NDCore.Functions.GetPlayers()
        hasRadioChatPermission(player, players, args)
    end, false)
end

if config["/911"].enabled then
    RegisterCommand("911", function(source, args, rawCommand)
        local player = source
        local players = NDCore.Functions.GetPlayers()
        local playerCoords = GetEntityCoords(GetPlayerPed(player))
        local length = string.len(table.concat(args, " "))

        if length > 0 then
            TriggerClientEvent("ND_Chat:911", -1, GetEntityCoords(GetPlayerPed(player)), table.concat(args, " "))
        end
    end, false)
end