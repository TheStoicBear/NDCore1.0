-- For support join my discord: https://discord.gg/Z9Mxu72zZ6

config = {
    changeCharacterCommand = "changecharacter", -- this is the command to open the ui again and change your character.
    enableAppearance = true, -- if this is true you need to install fivem-appearance otherwise you won't be able to customize and save ped.
    characterSelectionAopDisplay = true, -- if this is true then you must add a export below and return the value.
    aopExport = function()
        return exports["SimpleHUD"]:getAOP() -- exports["ModernHUD"]:getAOP()
    end,

    -- set your backgrounds, if you have more than 1 then it will randomly change everytime you open the ui.
    backgrounds = {
        "",  -- Credits: Fuzzman270#0270
        "",  -- Credits: Fuzzman270#0270
        ""   -- Credits: 2XRondo#6374
    },

    departments = {                         -- these are the required discord role ids to be able to access these departments (enable developer mode in discord's advanced settings and right click the role)
        ["CIV"] = {"0"},
        ["LSDOT"] = {"0"},
        ["SAHP"] = {"0"},
        ["LSPD"] = {"0"},
        ["BCSO"] = {"0"},
        ["LSFD"] = {"0"}
    },

    departmentPaychecks = true,            -- if you would like salaries to be paid out to the departments, set this to true
    paycheckInterval = 24,                  -- this is how often (in minutes) paychecks are to be paid out if departmentPaychecks is set to true
    departmentSalaries = {                  -- the amount given to the character per interval of time set via paycheckInterval
        ["CIV"] = 300,
        ["LSDOT"] = 450,
        ["SAHP"] = 700,
        ["LSPD"] = 600,
        ["BCSO"] = 500,
        ["LSFD"] = 650
    },
    
    taxPercentageMin = 15, -- the minimum tax percentage to be randomly generated (if no value is set in config.taxPercentage)
    taxPercentageMax = 25, -- the maximum tax percentage to be randomly generated (if no value is set in config.taxPercentage)
    taxPercentage = nil,   -- set this value to override the random tax percentage and use a fixed one instead

    -- DEFAULT is the spawns that every character with any job will have but you can also add a job and spawns for them.
    spawns = {
        ["DEFAULT"] = {
            {x = -102.78, y = 6336.28, z = 31.49, name = "Dream View Motel (Paleto Bay)"},
            {x = 343.53, y = 2636.94, z = 43.94, name = "Eastern Motel (Sandy Shores)"},
            {x = 196.96, y = -934.54, z = 29.69, name = "Legion Square"},
            {x = -1616.69, y = -1073.81, z = 12.15, name = "Del Perro Pier"},
            {x = -1039.65, y = -2741.02, z = 12.89, name = "LSIA"}
        },
        ["SAHP"] = {
            {x = -447.2, y = 6009.4, z = 30.72, name = "Paleto Bay Sheriff"},
            {x = 1849.4, y = 3688.6, z = 33.27, name = "Sandy Shores Sheriff"},
            {x = 437.6, y = -986.6, z = 29.69, name = "Mission Row PD"}
        },
        ["LSPD"] = {
            {x = -447.2, y = 6009.4, z = 30.72, name = "Paleto Bay Sheriff"},
            {x = 1849.4, y = 3688.6, z = 33.27, name = "Sandy Shores Sheriff"},
            {x = 437.6, y = -986.6, z = 29.69, name = "Mission Row PD"}
        },
        ["BCSO"] = {
            {x = -447.2, y = 6009.4, z = 30.72, name = "Paleto Bay Sheriff"},
            {x = 1849.4, y = 3688.6, z = 33.27, name = "Sandy Shores Sheriff"},
            {x = 437.6, y = -986.6, z = 29.69, name = "Mission Row Police "}
        },
        ["LSFD"] = {
            {x = -384.07, y = 6117.9, z = 30.48, name = "Fire Station No1 (Paleto Bay)"},
            {x = 1691.5, y = 3597.95, z = 34.56, name = "Fire Station No2 (Sandy Shores)"},
            {x = 1194.71, y = -1474.14, z = 33.86, name = "Fire Station No7 (Los Santos)"}
        },
    }
}
