-- For support join my discord: https://discord.gg/Z9Mxu72zZ6

config = {
    serverName = "FiveM Frist Response",
    characterLimit = 5, -- How many characters can a player create.
    customPauseMenu = true, -- A custom pause menu will display your money, characters name and the server name in the pause menu.
    enablePVP = true, -- pvp allows doing damage to other players.
    
    -- Money related
    startingCash = 2500, -- default cash the character will start with if the character creator doesn't specify it.
    startingBank = 8000,-- default money in the bank account the character will start with if the character creator doesn't specify it.
    
    -- If you'd like to whitelist certain roles on discord then set this to true and add role ids.
    enableDiscordWhitelist = false,
    notWhitelistedMessage = "You're not allowlisted in this server please join our discord to apply for a allowlist: https://discord.gg/Z9Mxu72zZ6",
    whitelistRoles = {
        "872921520719142932"
    },

    -- These are admins roles that will give a user permission to admin commands and more.
    adminRoles = {
        "1047756744530612250",
        "1047756744530612249",
        "1047756744530612247"
    },

    -- Discord Rich presence
    enableRichPresence = true,
    updateIntervall = 60, -- how many seconds of delay until it updates status.
    appId = 858146067018416128,
    largeLogo = "YOUR SERVER",
    smallLogo = "YOUR SERVER",
    firstButtonName = "Join Discord",
    firstButtonLink = "YOUR SERVER",
    secondButtonName = "Visit Website",
    secondButtonLink = "YOUR SERVER",


    -- Groups can be gangs, jobs, subdivisions, etc.
    groups = {
        ["Ballas"] = {
            "Member", -- rank 1
            "Boss" -- rank 2
        },
        ["LSDOT"] = {
            "Member", -- rank 1
            "Manager" -- rank 2
        },
        ["SWAT"] = {
            "Member", -- rank 1
            "Sniper", -- rank 2
            "Team lead", -- rank 3
            "Commander" -- rank 4
        },
        ["SAHP"] = {
            "Trooper",
            "Senior Trooper",
            "Corporal",
            "Sergeant",
            "Lieutenant",
            "Cheif"
        },
        ["LSPD"] = {
            "Officer",
            "Senior officer",
            "Corporal",
            "Sergeant",
            "Lieutenant",
            "Cheif"
        },
        ["BCSO"] = {
            "Deputy",
            "Senior Deputy",
            "Corporal",
            "Sergeant",
            "Lieutenant",
            "Cheif"
        }
    },
}
