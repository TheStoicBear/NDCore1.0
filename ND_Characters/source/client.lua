-- For support join my discord: https://discord.gg/Z9Mxu72zZ6

NDCore = exports["ND_Core"]:GetCoreObject()
local changeAppearence = false
local started = false
local firstSpawn = true

function startChangeAppearence()
    local config = {
        ped = true,
        headBlend = true,
        faceFeatures = true,
        headOverlays = true,
        components = true,
        props = true,
        tattoos = false
    }

    exports["fivem-appearance"]:startPlayerCustomization(function(appearance)
        if appearance then
            local ped = PlayerPedId()
            local clothing = {
                model = GetEntityModel(ped),
                tattoos = exports["fivem-appearance"]:getPedTattoos(ped),
                appearance = exports["fivem-appearance"]:getPedAppearance(ped)
            }
            Wait(4000)
            TriggerServerEvent("ND:updateClothes", clothing)
        else
            start(true)
        end
        changeAppearence = false
    end, config)
end

-- Set the player to creating the ped if they haven't already.
function setCharacterClothes(character)
    if config.enableAppearance then
        if not character.data.clothing or next(character.data.clothing) == nil then
            changeAppearence = true
        else
            changeAppearence = false
            exports["fivem-appearance"]:setPlayerModel(character.data.clothing.model)
            local ped = PlayerPedId()
            exports["fivem-appearance"]:setPedTattoos(ped, character.data.clothing.tattoos)
            exports["fivem-appearance"]:setPedAppearance(ped, character.data.clothing.appearance)
        end
    end
end

function tablelength(table)
    local count = 0
    for _ in pairs(table) do
        count = count + 1
    end
    return count
end

function SetDisplay(bool, typeName, bg, characters)
    local characterAmount = characters
    if not characterAmount then
        characterAmount = NDCore.Functions.GetCharacters()
    end
    if not bg then
        background = config.backgrounds[math.random(1, #config.backgrounds)]
    end
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = typeName,
        background = background,
        status = bool,
        serverName = NDCore.Config.serverName,
        characterAmount = tablelength(characterAmount) .. "/" .. NDCore.Config.characterLimit
    })
    Wait(500)
    if config.characterSelectionAopDisplay then
        SendNUIMessage({
            type = "aop",
            aop = config.aopExport()
        })
    end
end

function start(switch)
    TriggerServerEvent("ND:GetCharacters")
    if not started then
        TriggerServerEvent("ND_CharacterSelection:checkPerms")
        started = true
    end
    if switch then
        local ped = PlayerPedId()
        SwitchOutPlayer(ped, 0, 1)
        FreezeEntityPosition(ped, true)
        SetEntityVisible(ped, false, 0)
    end
    if config.characterSelectionAopDisplay then
        SendNUIMessage({
            type = "aop",
            aop = config.aopExport()
        })
    end
end

AddEventHandler("onResourceStart", function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    Wait(2000)
    start(false)
end)

AddEventHandler("playerSpawned", function()
    start(true)
end)

-- This is used to add department drop down on the ui.
RegisterNetEvent("ND_CharacterSelection:permsChecked", function(allowedRoles)
    SendNUIMessage({
        type = "givePerms",
        deptRoles = json.encode(allowedRoles)
    })
end)

-- Gets all the characters and displays them on the ui.
RegisterNetEvent("ND:returnCharacters", function(characters)
    local playerCharacters = {}
    for id, characterInfo in pairs(characters) do
        playerCharacters[tostring(id)] = characterInfo
    end
    SendNUIMessage({
        type = "refresh",
        characters = json.encode(playerCharacters)
    })
    SetDisplay(true, "ui", background, characters)
end)

-- Selecting a player from the iu.
RegisterNUICallback("setMainCharacter", function(data)
    local characters = NDCore.Functions.GetCharacters()
    local defaultSpawns = config.spawns["DEFAULT"]
    local spawns = {}
    for _, spawn in pairs(defaultSpawns) do
        spawns[#spawns + 1] = spawn
    end
    local job = characters[data.id].job
    local jobSpawns = config.spawns[job]
    if jobSpawns then
        for _, newSpawn in pairs(jobSpawns) do
            spawns[#spawns + 1] = newSpawn
        end
    end
    SendNUIMessage({
        type = "setSpawns",
        spawns = json.encode(spawns),
        id = characters[data.id].id
    })
    Wait(1000)
    TriggerServerEvent("ND:setCharacterOnline", data.id)
end)

-- Creating a character from the ui.
RegisterNUICallback("newCharacter", function(data)
    if tablelength(NDCore.Characters) < NDCore.Config.characterLimit then
        TriggerServerEvent("ND_CharacterSelection:newCharacter", {
            firstName = data.firstName,
            lastName = data.lastName,
            dob = data.dateOfBirth,
            gender = data.gender,
            twt = data.twtName,
            job = data.department
        })
    end
end)

-- editing a character from the ui.
RegisterNUICallback("editCharacter", function(data)
    TriggerServerEvent("ND_CharacterSelection:editCharacter", {
        id = data.id,
        firstName = data.firstName,
        lastName = data.lastName,
        dob = data.dateOfBirth,
        gender = data.gender,
        twt = data.twtName,
        job = data.department
    })
end)

-- deleting a character from the ui.
RegisterNUICallback("delCharacter", function(data)
    TriggerServerEvent("ND:deleteCharacter", data.character)
end)

-- Quit button from ui.
RegisterNUICallback("exitGame", function()
    TriggerServerEvent("ND:exitGame")
end)

-- Teleporting using ui.
RegisterNUICallback("tpToLocation", function(data)
    local ped = PlayerPedId()
    SetEntityCoords(ped, tonumber(data.x), tonumber(data.y), tonumber(data.z), false, false, false, false)
    FreezeEntityPosition(ped, true)
    SwitchInPlayer(ped)
    Wait(500)
    SetDisplay(false, "ui")
    Wait(500)
    FreezeEntityPosition(ped, false)
    SetEntityVisible(ped, true, 0)
    setCharacterClothes(NDCore.Functions.GetSelectedCharacter())
    if config.enableAppearance and changeAppearence then
        startChangeAppearence()
    end
    if firstSpawn then
        firstSpawn = false
        SendNUIMessage({
            type = "firstSpawn"
        })
    end
end)

-- Choosing the do not tp button.
RegisterNUICallback("tpDoNot", function(data)
    local ped = PlayerPedId()
    if firstSpawn then
        local character = NDCore.Functions.GetCharacters()[data.id]
        if character.lastLocation and next(character.lastLocation) ~= nil then
            SetEntityCoords(ped, character.lastLocation.x, character.lastLocation.y, character.lastLocation.z, false, false, false, false)
            FreezeEntityPosition(ped, true)
        end
        firstSpawn = false
        SendNUIMessage({
            type = "firstSpawn"
        })
    else
        FreezeEntityPosition(ped, true)
    end
    SwitchInPlayer(ped)
    Wait(500)
    SetDisplay(false, "ui")
    Wait(500)
    SetEntityVisible(ped, true, 0)
    FreezeEntityPosition(ped, false)
    Wait(100)
    setCharacterClothes(NDCore.Functions.GetSelectedCharacter())
    if config.enableAppearance and changeAppearence then
        startChangeAppearence()
    end
end)

-- Change character command
RegisterCommand(config.changeCharacterCommand, function()
    TriggerServerEvent("ND:GetCharacters")
    local ped = PlayerPedId()
    SwitchOutPlayer(ped, 0, 1)
    Wait(2000)
    FreezeEntityPosition(ped, true)
    SetEntityVisible(ped, false, 0)
	SetDisplay(true, "ui")
end, false)

-- chat suggestions
TriggerEvent("chat:addSuggestion", "/" .. config.changeCharacterCommand, "Switch your framework character.")


RegisterNetEvent('ShowPaycheckAndTaxNotification')
AddEventHandler('ShowPaycheckAndTaxNotification', function(paycheck, taxAmount, job)
    if GetResourceState('ModernHUD') == 'started' then
        exports["ModernHUD"]:AndyyyNotify({
            title = '<font color="#34eb52">Los Santos Paycheck:</font>',
            message = "Total amount received $" .. paycheck .. ".<br><font color='#eb3434'>Total tax deducted $" .. taxAmount .. ".</font>",
            icon = "bank",
            colorHex = "#34eb52",
            timeout = 8000
        })
    else
        SetNotificationTextEntry('STRING')
        AddTextComponentString(job .. ' Paycheck:\nTotal amount received $' .. paycheck .. '.\nTotal tax deducted $' .. taxAmount .. '.')
        SetNotificationIcon("CHAR_BANK_FLEECA", "CHAR_BANK_FLEECA", true)
        DrawNotification(false, false)
    end
end)


