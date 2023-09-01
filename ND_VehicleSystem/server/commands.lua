RegisterCommand("giveaccess", function(source, args)
    if #args ~= 1 then
        TriggerClientEvent("chat:addMessage", source, { args = {"^1Error:", "Invalid arguments. Usage: /giveaccess [vehicle_netid]"} })
        return
    end

    local vehicle = NetworkGetEntityFromNetworkId(tonumber(args[1]))
    if not DoesEntityExist(vehicle) then
        TriggerClientEvent("chat:addMessage", source, { args = {"^1Error:", "Invalid vehicle netid."} })
        return
    end

    giveAccess(source, vehicle)
    TriggerClientEvent("chat:addMessage", source, { args = {"^2Success:", "Access granted to the vehicle."} })
end)

RegisterCommand("setvehicleowned", function(source, args)
    local player = NDCore.Functions.GetPlayer(source)
    if not player then
        TriggerClientEvent("chat:addMessage", source, { args = {"^1Error:", "Failed to get player information."} })
        return
    end

    local properties = {} -- Modify or fill in the properties for the vehicle

    -- Example: set the vehicle as stored (change 'stored' to false if not stored)
    local stored = true

    local vehicleId = setVehicleOwned(source, properties, stored)
    if vehicleId then
        TriggerClientEvent("chat:addMessage", source, { args = {"^2Success:", "Vehicle set as owned. Vehicle ID: " .. vehicleId} })
    else
        TriggerClientEvent("chat:addMessage", source, { args = {"^1Error:", "Failed to set vehicle as owned."} })
    end
end)

RegisterCommand("transfervehicle", function(source, args)
    if #args ~= 2 then
        TriggerClientEvent("chat:addMessage", source, { args = {"^1Error:", "Invalid arguments. Usage: /transfervehicle [vehicle_id] [target_player_id]"} })
        return
    end

    local vehicleId = tonumber(args[1])
    local targetPlayerId = tonumber(args[2])

    transferVehicle(vehicleId, source, targetPlayerId)
end)

RegisterCommand("returnvehicletogarage", function(source, args)
    local player = NDCore.Functions.GetPlayer(source)
    if not player then
        TriggerClientEvent("chat:addMessage", source, { args = {"^1Error:", "Failed to get player information."} })
        return
    end

    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if not DoesEntityExist(vehicle) then
        TriggerClientEvent("chat:addMessage", source, { args = {"^1Error:", "You are not in a vehicle."} })
        return
    end

    local properties = {} -- Modify or fill in the properties for the returned vehicle

    local success = returnVehicleToGarage(source, vehicle, properties)
    if success then
        TriggerClientEvent("chat:addMessage", source, { args = {"^2Success:", "Vehicle returned to the garage."} })
    else
        TriggerClientEvent("chat:addMessage", source, { args = {"^1Error:", "Failed to return vehicle to the garage."} })
    end
end)

RegisterCommand("savevehicleproperties", function(source, args)
    local player = NDCore.Functions.GetPlayer(source)
    if not player then
        TriggerClientEvent("chat:addMessage", source, { args = {"^1Error:", "Failed to get player information."} })
        return
    end

    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if not DoesEntityExist(vehicle) then
        TriggerClientEvent("chat:addMessage", source, { args = {"^1Error:", "You are not in a vehicle."} })
        return
    end

    local properties = {} -- Modify or fill in the properties to be saved

    local success = saveVehiclePreperties(source, vehicle, properties)
    if success then
        TriggerClientEvent("chat:addMessage", source, { args = {"^2Success:", "Vehicle properties saved."} })
    else
        TriggerClientEvent("chat:addMessage", source, { args = {"^1Error:", "Failed to save vehicle properties."} })
    end
end)

RegisterCommand("vehid", function(source, args)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if not DoesEntityExist(vehicle) then
        TriggerClientEvent("chat:addMessage", source, { args = {"^1Error:", "You are not in a vehicle."} })
        return
    end

    local vehicleId = Entity(vehicle).state.id
    TriggerClientEvent("chat:addMessage", source, { args = {"^6Vehicle ID:", tostring(vehicleId)} })
end)
