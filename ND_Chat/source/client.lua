NDCore = exports["ND_Core"]:GetCoreObject()

local displayedText = {}

if config["/me"] then
    TriggerEvent("chat:addSuggestion", "/me", "Send message in the third person (Proximity).", {{ name="Action", help="Describe your action."}})
end

if config["/do"] then
    TriggerEvent("chat:addSuggestion", "/do", "Send message in the third person (Proximity).", {{ name="Action", help="Describe your action."}})
end

if config["/gme"] then
    TriggerEvent("chat:addSuggestion", "/gme", "Send message in the third person (Global).", {{ name="Action", help="Describe your action."}})
end

if config["/twt"] then
    TriggerEvent("chat:addSuggestion", "/twt", "Send a Twotter in game. (Global)", {{name="Message", help="Twotter Message."}})
end

if config["/ooc"] then
    TriggerEvent("chat:addSuggestion", "/ooc", "Send a Out Of Character message (Global)", {{name="Message", help="OOC Message."}})
end

if config["/darkweb"] then
    TriggerEvent("chat:addSuggestion", "/darkweb", "Send a anonymous message in game (Global).", {{name="Message", help=""}})
end

if config["/radiochat"] then
    TriggerEvent("chat:addSuggestion", "/radiochat", "Send a Less important Radio Transmission", {{name="Transmission", help="Enter your transmission"}})
end

if config["/911"] then
    TriggerEvent("chat:addSuggestion", "/911", "Call 911 for your emergency.", {{name="Report", help="Enter your report here."}})
end

if config["/911"].enabled then

    local activeCalls = {}

    RegisterNetEvent("ND_Chat:911")

    AddEventHandler("ND_Chat:911", function(coords, Description)

        local character = NDCore.Functions.GetSelectedCharacter()

        if not character then
            return
        end

        local location = GetStreetNameFromHashKey(GetStreetNameAtCoord(coords.x, coords.y, coords.z))

        TriggerEvent("chat:addMessage", {
            color = { 255, 0, 0 },
            multiline = true,
            args = {"^1^*[911]: ^3The Emergency Services are on their way."}
        })

        for _, department in pairs(config["/911"].callTo) do
            if character.job == department then
                TriggerEvent('InteractSound_CL:PlayOnOne', '911call', 0.3)
                TriggerEvent("chat:addMessage", {
                    color = {255, 0, 0},
                    args = {"^1^*[911]: ^3Location: ^7" .. location .. " ^3| Information: ^7" .. Description}
                })

                local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
                SetBlipSprite(blip, 189)
                SetBlipAsShortRange(blip, true)
                BeginTextCommandSetBlipName("STRING")
                SetBlipColour(blip, 59)
                AddTextComponentString("Active 911 Call: " .. location)
                EndTextCommandSetBlipName(blip)

                local accepted = false

                Citizen.CreateThread(function()
                    Citizen.Wait(2000)
                    local playerPed = GetPlayerPed(-1)
                    local playerName = GetPlayerName(PlayerId())
                    local playerCoords = GetEntityCoords(playerPed)
                    AddTextEntry('ND_911', 'Press ~r~[ENTER]~w~ to accept the call or ~r~[BACKSPACE]~w~ to deny the call.')
                    SetNotificationTextEntry('ND_911')
                    SetNotificationMessage('CHAR_CALL911', 'CHAR_CALL911', true, 4, '~r~New 911 Call~r~', '~y~Check the chat for details.', playerName, playerCoords.x, playerCoords.y, playerCoords.z)
                    DrawNotification(false, true)

                    local timer = 0
                    while timer < 30 * 1000 do
                        Citizen.Wait(0)
                        timer = timer + 1
                        if IsControlPressed(0, 18) then -- ENTER key
                            SetNewWaypoint(coords.x, coords.y)
                            accepted = true
                            break
                        elseif IsControlPressed(0, 177) then -- Backspace
                            RemoveBlip(blip)
                            accepted = false
                            break
                        end
                    end

                    if not accepted then
                        RemoveBlip(blip)
                    else
                        Citizen.Wait(30 * 1000)
                        if accepted then
                            RemoveBlip(blip)
                        end
                    end
                end)

                if GetResourceState("ModernHUD") == "started" then
                    exports["ModernHUD"]:AndyyyNotify({
                        title = '<font color="#ff0000">911 EMERGENCY</font>',
                        message = '<font color="#ff0000">Location:</font> ' .. location .. '<br><font color="#ff0000">Report:</font> ' .. Description,
                        icon = "fas fa-ambulance",
                        colorHex = "#ff0000",
                        timeout = 12000
                    })
                end

                table.insert(activeCalls, {
                    coords = coords,
                    blip = blip
                })

                break
            end
        end
    end)
end

RegisterNetEvent("displayMeTextAboveHead")
AddEventHandler("displayMeTextAboveHead", function(player, text)
    -- Cleanup previous text for the same player
    if displayedText[player] ~= nil then
        RemoveDisplayText(displayedText[player])
        displayedText[player] = nil
    end

    local playerPed = GetPlayerPed(-1) -- Ped of the current player
    local playerCoords = GetEntityCoords(playerPed)
    
    -- Calculate the position slightly above the player's head
    local textPosition = vector3(playerCoords.x, playerCoords.y, playerCoords.z + 1.0)
    
    -- Create a 3D text element
    local textElement = CreateDisplayText()
    SetDisplayText(textElement, text)
    SetDisplayTextPosition(textElement, textPosition)
    
    -- Store the text element reference
    displayedText[player] = textElement
    
    -- Schedule cleanup after a certain duration
    Citizen.SetTimeout(10000, function()
        if displayedText[player] then
            RemoveDisplayText(displayedText[player])
            displayedText[player] = nil
        end
    end)
end)
