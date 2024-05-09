-- ----------------------------------------------------------------------------
-- AddOn Namespace
-- ----------------------------------------------------------------------------
local AddOnFolderName = ... ---@type string
local private = select(2, ...) ---@class PrivateNamespace

---@type Localizations
local L = LibStub("AceLocale-3.0"):GetLocale(AddOnFolderName)

-- Add currency information
private.currencyIds["Flightstones"] = 2245
private.currencyIndexes[private.currencyIds.Flightstones] = true

private.currencyIds["whelpCrest"] = 2806
private.currencyIndexes[private.currencyIds.whelpCrest] = true

private.currencyIds["drakeCrest"] = 2807
private.currencyIndexes[private.currencyIds.drakeCrest] = true

private.currencyIds["wyrmCrest"] = 2809
private.currencyIndexes[private.currencyIds.wyrmCrest] = true

private.currencyIds["aspectCrest"] = 2812
private.currencyIndexes[private.currencyIds.aspectCrest] = true

-- Add preferences
private.Preferences.DefaultValues.profile.DisabledIntegrations.Flightstones = false;
private.Preferences.DisabledIntegrations.Flightstones = {
    type = "toggle",
    name = L["FLIGHTSTONE_CREST_UPGRADES"],
    order = 110,
    width = "double",
}

---@type Dictionary<FlightstoneUpgradeData>
local flightstoneUpgradeData = {
    ["flightstones"] = {
        name = L["FLIGHTSTONES"],
        shortName = L["FLIGHTSTONES"],
        color = WHITE_FONT_COLOR,
        icon = 5172976,
        itemId = nil,
        currencyId = private.currencyIds.Flightstones
    },

    ["whelpCrests"] = {
        name = L["WHELP_CRESTS"],
        shortName = L["WHELP_CRESTS_SHORT"],
        color = UNCOMMON_GREEN_COLOR,
        icon = 5646099,
        itemId = nil,
        currencyId = private.currencyIds.whelpCrest
    },

    ["drakeCrests"] = {
        name = L["DRAKE_CRESTS"],
        shortName = L["DRAKE_CRESTS_SHORT"],
        color = RARE_BLUE_COLOR,
        icon = 5646097,
        itemId = nil,
        currencyId = private.currencyIds.drakeCrest
    },

    ["wyrmCrests"] = {
        name = L["WYRM_CRESTS"],
        shortName = L["WYRM_CRESTS_SHORT"],
        color = EPIC_PURPLE_COLOR,
        icon = 5646101,
        itemId = nil,
        currencyId = private.currencyIds.wyrmCrest
    },

    ["aspectCrests"] = {
        name = L["ASPECT_CRESTS"],
        shortName = L["ASPECT_CRESTS_SHORT"],
        color = LEGENDARY_ORANGE_COLOR,
        icon = 5646095,
        itemId = nil,
        currencyId = private.currencyIds.aspectCrest
    },
}

---@type Array<MythicPlusInfo>
private.mythicPlusInfo = {
    {keyLevel = 2, lootDrops = 496, vaultReward = 509, currency = flightstoneUpgradeData["wyrmCrests"]},
    {keyLevel = 3, lootDrops = 499, vaultReward = 509, currency = flightstoneUpgradeData["wyrmCrests"]},
    {keyLevel = 4, lootDrops = 499, vaultReward = 512, currency = flightstoneUpgradeData["wyrmCrests"]},
    {keyLevel = 5, lootDrops = 502, vaultReward = 512, currency = flightstoneUpgradeData["wyrmCrests"]},
    {keyLevel = 6, lootDrops = 502, vaultReward = 515, currency = flightstoneUpgradeData["aspectCrests"]},
    {keyLevel = 7, lootDrops = 506, vaultReward = 515, currency = flightstoneUpgradeData["aspectCrests"]},
    {keyLevel = 8, lootDrops = 506, vaultReward = 519, currency = flightstoneUpgradeData["aspectCrests"]},
    {keyLevel = 9, lootDrops = 509, vaultReward = 519, currency = flightstoneUpgradeData["aspectCrests"]},
    {keyLevel = "10+", lootDrops = 509, vaultReward = 522, currency = flightstoneUpgradeData["aspectCrests"]},
}

---@type Array<RaidInfo>
private.raidInfo = {
    {boss = 1,                      lfr = 441, normal = 454, heroic = 467, mythic = 480},
    {boss = 2,                      lfr = 441, normal = 454, heroic = 467, mythic = 480},
    {boss = 3,                      lfr = 444, normal = 457, heroic = 470, mythic = 483},
    {boss = 4,                      lfr = 444, normal = 457, heroic = 470, mythic = 483},
    {boss = L["X_RARE"]:format(3),  lfr = 450, normal = 463, heroic = 476, mythic = 489},
    {boss = 5,                      lfr = 447, normal = 460, heroic = 473, mythic = 486},
    {boss = 6,                      lfr = 447, normal = 460, heroic = 473, mythic = 486},
    {boss = 7,                      lfr = 447, normal = 460, heroic = 473, mythic = 486},
    {boss = 8,                      lfr = 450, normal = 463, heroic = 476, mythic = 489},
    {boss = 9,                      lfr = 450, normal = 463, heroic = 476, mythic = 489},
    {boss = L["X_RARE"]:format(9),  lfr = 457, normal = 470, heroic = 483, mythic = 496},
}

---@type RaidCurrencyInfo
private.raidCurrencyInfo = {
    -- LFR
    lfrCurrency = flightstoneUpgradeData["whelpCrests"],

    -- Normal
    normalCurrency = flightstoneUpgradeData["drakeCrests"],

    -- Heroic
    heroicCurrency = flightstoneUpgradeData["wyrmCrests"],

    -- Mythic
    mythicCurrency = flightstoneUpgradeData["aspectCrests"],
}

---@type Array<UpgradeTrackInfo>
private.upgradeTrackInfo = {
    {
        itemLevel = 467,
        upgrade1 = {rank = 2, upgradeLevel = 1, maxUpgradeLevel = 8},
        currency = flightstoneUpgradeData["flightstones"]
    },
    {
        itemLevel = 470,
        upgrade1 = {rank = 2, upgradeLevel = 2, maxUpgradeLevel = 8},
        currency = flightstoneUpgradeData["flightstones"]
    },
    {
        itemLevel = 473,
        upgrade1 = {rank = 2, upgradeLevel = 3, maxUpgradeLevel = 8},
        currency = flightstoneUpgradeData["flightstones"]
    },
    {
        itemLevel = 476,
        upgrade1 = {rank = 2, upgradeLevel = 4, maxUpgradeLevel = 8},
        currency = flightstoneUpgradeData["flightstones"]
    },
    {
        itemLevel = 480,
        upgrade1 = {rank = 2, upgradeLevel = 5, maxUpgradeLevel = 8},
        upgrade2 = {rank = 3, upgradeLevel = 1, maxUpgradeLevel = 8},
        currency = flightstoneUpgradeData["whelpCrests"]
    },
    {
        itemLevel = 483,
        upgrade1 = {rank = 2, upgradeLevel = 6, maxUpgradeLevel = 8},
        upgrade2 = {rank = 3, upgradeLevel = 2, maxUpgradeLevel = 8},
        currency = flightstoneUpgradeData["whelpCrests"]
    },
    {
        itemLevel = 486,
        upgrade1 = {rank = 2, upgradeLevel = 7, maxUpgradeLevel = 8},
        upgrade2 = {rank = 3, upgradeLevel = 3, maxUpgradeLevel = 8},
        currency = flightstoneUpgradeData["whelpCrests"]
    },
    {
        itemLevel = 489,
        upgrade1 = {rank = 2, upgradeLevel = 8, maxUpgradeLevel = 8},
        upgrade2 = {rank = 3, upgradeLevel = 4, maxUpgradeLevel = 8},
        currency = flightstoneUpgradeData["whelpCrests"]
    },
    {
        itemLevel = 493,
        upgrade1 = {rank = 3, upgradeLevel = 5, maxUpgradeLevel = 8},
        upgrade2 = {rank = 4, upgradeLevel = 1, maxUpgradeLevel = 8},
        upgrade3 = {rank = 7, upgradeLevel = 1, maxUpgradeLevel = 12},
        upgrade4 = {rank = 8, upgradeLevel = 1, maxUpgradeLevel = 14},
        currency = flightstoneUpgradeData["drakeCrests"]
    },
    {
        itemLevel = 496,
        upgrade1 = {rank = 3, upgradeLevel = 6, maxUpgradeLevel = 8},
        upgrade2 = {rank = 4, upgradeLevel = 2, maxUpgradeLevel = 8},
        upgrade3 = {rank = 7, upgradeLevel = 2, maxUpgradeLevel = 12},
        upgrade4 = {rank = 8, upgradeLevel = 2, maxUpgradeLevel = 14},
        currency = flightstoneUpgradeData["drakeCrests"]
    },
    {
        itemLevel = 499,
        upgrade1 = {rank = 3, upgradeLevel = 7, maxUpgradeLevel = 8},
        upgrade2 = {rank = 4, upgradeLevel = 3, maxUpgradeLevel = 8},
        upgrade3 = {rank = 7, upgradeLevel = 3, maxUpgradeLevel = 12},
        upgrade4 = {rank = 8, upgradeLevel = 3, maxUpgradeLevel = 14},
        currency = flightstoneUpgradeData["drakeCrests"]
    },
    {
        itemLevel = 502,
        upgrade1 = {rank = 3, upgradeLevel = 8, maxUpgradeLevel = 8},
        upgrade2 = {rank = 4, upgradeLevel = 4, maxUpgradeLevel = 8},
        upgrade3 = {rank = 7, upgradeLevel = 4, maxUpgradeLevel = 12},
        upgrade4 = {rank = 8, upgradeLevel = 4, maxUpgradeLevel = 14},
        currency = flightstoneUpgradeData["drakeCrests"]
    },
    {
        itemLevel = 506,
        upgrade1 = {rank = 4, upgradeLevel = 5, maxUpgradeLevel = 8},
        upgrade2 = {rank = 5, upgradeLevel = 1, maxUpgradeLevel = 6},
        upgrade3 = {rank = 7, upgradeLevel = 5, maxUpgradeLevel = 12},
        upgrade4 = {rank = 8, upgradeLevel = 5, maxUpgradeLevel = 14},
        currency = flightstoneUpgradeData["wyrmCrests"]
    },
    {
        itemLevel = 509,
        upgrade1 = {rank = 4, upgradeLevel = 6, maxUpgradeLevel = 8},
        upgrade2 = {rank = 5, upgradeLevel = 2, maxUpgradeLevel = 6},
        upgrade3 = {rank = 7, upgradeLevel = 6, maxUpgradeLevel = 12},
        upgrade4 = {rank = 8, upgradeLevel = 6, maxUpgradeLevel = 14},
        currency = flightstoneUpgradeData["wyrmCrests"]
    },
    {
        itemLevel = 512,
        upgrade1 = {rank = 4, upgradeLevel = 7, maxUpgradeLevel = 8},
        upgrade2 = {rank = 5, upgradeLevel = 3, maxUpgradeLevel = 6},
        upgrade3 = {rank = 7, upgradeLevel = 7, maxUpgradeLevel = 12},
        upgrade4 = {rank = 8, upgradeLevel = 7, maxUpgradeLevel = 14},
        currency = flightstoneUpgradeData["wyrmCrests"]
    },
    {
        itemLevel = 515,
        upgrade1 = {rank = 4, upgradeLevel = 8, maxUpgradeLevel = 8},
        upgrade2 = {rank = 5, upgradeLevel = 4, maxUpgradeLevel = 6},
        upgrade3 = {rank = 7, upgradeLevel = 8, maxUpgradeLevel = 12},
        upgrade4 = {rank = 8, upgradeLevel = 8, maxUpgradeLevel = 14},
        currency = flightstoneUpgradeData["wyrmCrests"]
    },
    {
        itemLevel = 519,
        upgrade1 = {rank = 5, upgradeLevel = 5, maxUpgradeLevel = 6},
        upgrade2 = {rank = 6, upgradeLevel = 1, maxUpgradeLevel = 4},
        upgrade3 = {rank = 7, upgradeLevel = 9, maxUpgradeLevel = 12},
        upgrade4 = {rank = 8, upgradeLevel = 9, maxUpgradeLevel = 14},
        currency = flightstoneUpgradeData["aspectCrests"]
    },
    {
        itemLevel = 522,
        upgrade1 = {rank = 5, upgradeLevel = 6, maxUpgradeLevel = 6},
        upgrade2 = {rank = 6, upgradeLevel = 2, maxUpgradeLevel = 4},
        upgrade3 = {rank = 7, upgradeLevel = 10, maxUpgradeLevel = 12},
        upgrade4 = {rank = 8, upgradeLevel = 10, maxUpgradeLevel = 14},
        currency = flightstoneUpgradeData["aspectCrests"]
    },
    {
        itemLevel = 525,
        upgrade1 = {rank = 6, upgradeLevel = 3, maxUpgradeLevel = 4},
        upgrade2 = {rank = 7, upgradeLevel = 11, maxUpgradeLevel = 12},
        upgrade3 = {rank = 8, upgradeLevel = 11, maxUpgradeLevel = 14},
        currency = flightstoneUpgradeData["aspectCrests"]
    },
    {
        itemLevel = 528,
        upgrade1 = {rank = 6, upgradeLevel = 4, maxUpgradeLevel = 4},
        upgrade2 = {rank = 7, upgradeLevel = 12, maxUpgradeLevel = 12},
        upgrade3 = {rank = 8, upgradeLevel = 12, maxUpgradeLevel = 14},
        currency = flightstoneUpgradeData["aspectCrests"]
    },
    {
        itemLevel = 532,
        upgrade1 = {rank = 8, upgradeLevel = 13, maxUpgradeLevel = 14},
        currency = flightstoneUpgradeData["aspectCrests"]
    },
    {
        itemLevel = 535,
        upgrade1 = {rank = 8, upgradeLevel = 14, maxUpgradeLevel = 14},
        currency = flightstoneUpgradeData["aspectCrests"]
    },
}

---@type Array<CraftingInfo>
private.craftingInfo = {
    -- Whelpling
    {itemLevel = 473, itemId = 211520, rank = 1, iconPath = "Professions-ChatIcon-Quality-Tier1"},
    {itemLevel = 476, itemId = 211520, rank = 2, iconPath = "Professions-ChatIcon-Quality-Tier2"},
    {itemLevel = 480, itemId = 211520, rank = 3, iconPath = "Professions-ChatIcon-Quality-Tier3"},
    {itemLevel = 483, itemId = 211520, rank = 4, iconPath = "Professions-ChatIcon-Quality-Tier4"},
    {itemLevel = 486, itemId = 211520, rank = 5, iconPath = "Professions-ChatIcon-Quality-Tier5"},

    -- Line break
    {itemLevel = 0, itemId = 0, rank = 0, iconPath = ""},

    -- Spark
    {itemLevel = 489, itemId = 211516, rank = 1, iconPath = "Professions-ChatIcon-Quality-Tier1"},
    {itemLevel = 493, itemId = 211516, rank = 2, iconPath = "Professions-ChatIcon-Quality-Tier2"},
    {itemLevel = 496, itemId = 211516, rank = 3, iconPath = "Professions-ChatIcon-Quality-Tier3"},
    {itemLevel = 499, itemId = 211516, rank = 4, iconPath = "Professions-ChatIcon-Quality-Tier4"},
    {itemLevel = 502, itemId = 211516, rank = 5, iconPath = "Professions-ChatIcon-Quality-Tier5"},

    -- Line break
    {itemLevel = 0, itemId = 0, rank = 0, iconPath = ""},

    -- Wyrm
    {itemLevel = 502, itemId = 211518, rank = 1, iconPath = "Professions-ChatIcon-Quality-Tier1"},
    {itemLevel = 506, itemId = 211518, rank = 2, iconPath = "Professions-ChatIcon-Quality-Tier2"},
    {itemLevel = 509, itemId = 211518, rank = 3, iconPath = "Professions-ChatIcon-Quality-Tier3"},
    {itemLevel = 512, itemId = 211518, rank = 4, iconPath = "Professions-ChatIcon-Quality-Tier4"},
    {itemLevel = 515, itemId = 211518, rank = 5, iconPath = "Professions-ChatIcon-Quality-Tier5"},

    -- Line break
    {itemLevel = 0, itemId = 0, rank = 0, iconPath = ""},

    -- Aspect
    {itemLevel = 512, itemId = 211519, rank = 1, iconPath = "Professions-ChatIcon-Quality-Tier1"},
    {itemLevel = 515, itemId = 211519, rank = 2, iconPath = "Professions-ChatIcon-Quality-Tier2"},
    {itemLevel = 519, itemId = 211519, rank = 3, iconPath = "Professions-ChatIcon-Quality-Tier3"},
    {itemLevel = 522, itemId = 211519, rank = 4, iconPath = "Professions-ChatIcon-Quality-Tier4"},
    {itemLevel = 525, itemId = 211519, rank = 5, iconPath = "Professions-ChatIcon-Quality-Tier5"},
}

---@type Array<FlightstoneBonusData>
local flightstoneBonusIds = {
    -- Explorer
    [10321] = {itemLevel = 454, rank = 1, upgradeLevel = 1, upgradeGroup = 23},
    [10322] = {itemLevel = 457, rank = 1, upgradeLevel = 2, upgradeGroup = 23},
    [10323] = {itemLevel = 460, rank = 1, upgradeLevel = 3, upgradeGroup = 23},
    [10324] = {itemLevel = 463, rank = 1, upgradeLevel = 4, upgradeGroup = 23},
    [10325] = {itemLevel = 467, rank = 1, upgradeLevel = 5, upgradeGroup = 24},
    [10326] = {itemLevel = 470, rank = 1, upgradeLevel = 6, upgradeGroup = 24},
    [10327] = {itemLevel = 473, rank = 1, upgradeLevel = 7, upgradeGroup = 24},
    [10328] = {itemLevel = 476, rank = 1, upgradeLevel = 8, upgradeGroup = 24},

    -- Adventurer
    [10305] = {itemLevel = 467, rank = 2, upgradeLevel = 1, upgradeGroup = 24},
    [10306] = {itemLevel = 470, rank = 2, upgradeLevel = 2, upgradeGroup = 24},
    [10307] = {itemLevel = 473, rank = 2, upgradeLevel = 3, upgradeGroup = 24},
    [10308] = {itemLevel = 476, rank = 2, upgradeLevel = 4, upgradeGroup = 24},
    [10309] = {itemLevel = 480, rank = 2, upgradeLevel = 5, upgradeGroup = 25},
    [10310] = {itemLevel = 483, rank = 2, upgradeLevel = 6, upgradeGroup = 25},
    [10311] = {itemLevel = 486, rank = 2, upgradeLevel = 7, upgradeGroup = 25},
    [10312] = {itemLevel = 489, rank = 2, upgradeLevel = 8, upgradeGroup = 25},

    -- Veteran
    [10341] = {itemLevel = 480, rank = 3, upgradeLevel = 1, upgradeGroup = 25},
    [10342] = {itemLevel = 483, rank = 3, upgradeLevel = 2, upgradeGroup = 25},
    [10343] = {itemLevel = 486, rank = 3, upgradeLevel = 3, upgradeGroup = 25},
    [10344] = {itemLevel = 489, rank = 3, upgradeLevel = 4, upgradeGroup = 25},
    [10345] = {itemLevel = 493, rank = 3, upgradeLevel = 5, upgradeGroup = 26},
    [10346] = {itemLevel = 496, rank = 3, upgradeLevel = 6, upgradeGroup = 26},
    [10347] = {itemLevel = 499, rank = 3, upgradeLevel = 7, upgradeGroup = 26},
    [10348] = {itemLevel = 502, rank = 3, upgradeLevel = 8, upgradeGroup = 26},

    -- Champion
    [10313] = {itemLevel = 493, rank = 4, upgradeLevel = 1, upgradeGroup = 26},
    [10314] = {itemLevel = 496, rank = 4, upgradeLevel = 2, upgradeGroup = 26},
    [10315] = {itemLevel = 499, rank = 4, upgradeLevel = 3, upgradeGroup = 26},
    [10316] = {itemLevel = 502, rank = 4, upgradeLevel = 4, upgradeGroup = 26},
    [10317] = {itemLevel = 506, rank = 4, upgradeLevel = 5, upgradeGroup = 27},
    [10318] = {itemLevel = 509, rank = 4, upgradeLevel = 6, upgradeGroup = 27},
    [10319] = {itemLevel = 512, rank = 4, upgradeLevel = 7, upgradeGroup = 27},
    [10320] = {itemLevel = 515, rank = 4, upgradeLevel = 8, upgradeGroup = 27},

    -- Hero
    [10329] = {itemLevel = 506, rank = 5, upgradeLevel = 1, upgradeGroup = 27},
    [10330] = {itemLevel = 509, rank = 5, upgradeLevel = 2, upgradeGroup = 27},
    [10331] = {itemLevel = 512, rank = 5, upgradeLevel = 3, upgradeGroup = 27},
    [10332] = {itemLevel = 515, rank = 5, upgradeLevel = 4, upgradeGroup = 27},
    [10333] = {itemLevel = 519, rank = 5, upgradeLevel = 5, upgradeGroup = 28},
    [10334] = {itemLevel = 522, rank = 5, upgradeLevel = 6, upgradeGroup = 28},

    -- Myth
    [10335] = {itemLevel = 519, rank = 6, upgradeLevel = 1, upgradeGroup = 28},
    [10336] = {itemLevel = 522, rank = 6, upgradeLevel = 2, upgradeGroup = 28},
    [10337] = {itemLevel = 525, rank = 6, upgradeLevel = 3, upgradeGroup = 28},
    [10338] = {itemLevel = 528, rank = 6, upgradeLevel = 4, upgradeGroup = 28},

    -- Awakened (12)
    [10407] = {itemLevel = 493, rank = 7, upgradeLevel = 1, upgradeGroup = 26},
    [10408] = {itemLevel = 496, rank = 7, upgradeLevel = 2, upgradeGroup = 26},
    [10409] = {itemLevel = 499, rank = 7, upgradeLevel = 3, upgradeGroup = 26},
    [10410] = {itemLevel = 502, rank = 7, upgradeLevel = 4, upgradeGroup = 26},
    [10411] = {itemLevel = 506, rank = 7, upgradeLevel = 5, upgradeGroup = 27},
    [10412] = {itemLevel = 509, rank = 7, upgradeLevel = 6, upgradeGroup = 27},
    [10413] = {itemLevel = 512, rank = 7, upgradeLevel = 7, upgradeGroup = 27},
    [10414] = {itemLevel = 515, rank = 7, upgradeLevel = 8, upgradeGroup = 27},
    [10415] = {itemLevel = 519, rank = 7, upgradeLevel = 9, upgradeGroup = 28},
    [10416] = {itemLevel = 522, rank = 7, upgradeLevel = 10, upgradeGroup = 28},
    [10417] = {itemLevel = 525, rank = 7, upgradeLevel = 11, upgradeGroup = 28},
    [10418] = {itemLevel = 528, rank = 7, upgradeLevel = 12, upgradeGroup = 28},

    -- Awakened (14)
    [10490] = {itemLevel = 493, rank = 8, upgradeLevel = 1, upgradeGroup = 26},
    [10491] = {itemLevel = 496, rank = 8, upgradeLevel = 2, upgradeGroup = 26},
    [10492] = {itemLevel = 499, rank = 8, upgradeLevel = 3, upgradeGroup = 26},
    [10493] = {itemLevel = 502, rank = 8, upgradeLevel = 4, upgradeGroup = 26},
    [10494] = {itemLevel = 506, rank = 8, upgradeLevel = 5, upgradeGroup = 27},
    [10495] = {itemLevel = 509, rank = 8, upgradeLevel = 6, upgradeGroup = 27},
    [10496] = {itemLevel = 512, rank = 8, upgradeLevel = 7, upgradeGroup = 27},
    [10497] = {itemLevel = 515, rank = 8, upgradeLevel = 8, upgradeGroup = 27},
    [10498] = {itemLevel = 519, rank = 8, upgradeLevel = 9, upgradeGroup = 28},
    [10499] = {itemLevel = 522, rank = 8, upgradeLevel = 10, upgradeGroup = 28},
    [10500] = {itemLevel = 525, rank = 8, upgradeLevel = 11, upgradeGroup = 28},
    [10501] = {itemLevel = 528, rank = 8, upgradeLevel = 12, upgradeGroup = 28},
    [10502] = {itemLevel = 532, rank = 8, upgradeLevel = 13, upgradeGroup = 28},
    [10503] = {itemLevel = 535, rank = 8, upgradeLevel = 14, upgradeGroup = 28},
}

---@type Array<FlightstoneUpgradeCostData>
local itemExtendedCostTable = {
    [7984] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 0, flightstones = 50},
    [7991] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 0, flightstones = 75},
    [7992] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 0, flightstones = 25},
    [7993] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 0, flightstones = 40},
    [7994] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 0, flightstones = 65},
    [7995] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 0, flightstones = 80},
    [7997] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 0, flightstones = 100},
    [7998] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 0, flightstones = 120},
    [8003] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 0, flightstones = 160},

    [8235] = {whelpCrests = 15, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 0, flightstones = 120},
    [8236] = {whelpCrests = 15, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 0, flightstones = 100},
    [8237] = {whelpCrests = 15, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 0, flightstones = 65},
    [8238] = {whelpCrests = 15, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 0, flightstones = 125},
    [8239] = {whelpCrests = 15, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 0, flightstones = 250},
    [8240] = {whelpCrests = 15, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 0, flightstones = 200},

    [8255] = {whelpCrests = 0, drakeCrests = 15, wyrmCrests = 0, aspectCrests = 0, flightstones = 300},
    [8256] = {whelpCrests = 0, drakeCrests = 15, wyrmCrests = 0, aspectCrests = 0, flightstones = 75},
    [8257] = {whelpCrests = 0, drakeCrests = 15, wyrmCrests = 0, aspectCrests = 0, flightstones = 145},
    [8258] = {whelpCrests = 0, drakeCrests = 15, wyrmCrests = 0, aspectCrests = 0, flightstones = 120},
    [8259] = {whelpCrests = 0, drakeCrests = 15, wyrmCrests = 0, aspectCrests = 0, flightstones = 150},
    [8260] = {whelpCrests = 0, drakeCrests = 15, wyrmCrests = 0, aspectCrests = 0, flightstones = 225},

    [8249] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 15, aspectCrests = 0, flightstones = 170},
    [8250] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 15, aspectCrests = 0, flightstones = 140},
    [8251] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 15, aspectCrests = 0, flightstones = 90},
    [8252] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 15, aspectCrests = 0, flightstones = 175},
    [8253] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 15, aspectCrests = 0, flightstones = 350},
    [8254] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 15, aspectCrests = 0, flightstones = 275},

    [8241] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 15, flightstones = 190},
    [8242] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 15, flightstones = 160},
    [8243] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 15, flightstones = 100},
    [8244] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 15, flightstones = 100},
    [8245] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 15, flightstones = 200},
    [8246] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 15, flightstones = 400},
    [8247] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 15, flightstones = 300},
    [8248] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 15, flightstones = 400},
}

---@type Array<Array<integer>>
local itemExtendedCostLookup = {
    -- INVTYPE_HEAD, INVTYPE_CHEST, INVTYPE_LEGS, INVTYPE_ROBE
    [1048738] = {
        [23] = 7984,
        [24] = 7991,
        [25] = 8235,
        [26] = 8257,
        [27] = 8249,
        [28] = 8241,
    },

    [5448] = {
        [23] = 7993,
        [24] = 7994,
        [25] = 8236,
        [26] = 8258,
        [27] = 8250,
        [28] = 8242,
    },

    [68100] = {
        [23] = 7992,
        [24] = 7993,
        [25] = 8237,
        [26] = 8256,
        [27] = 8251,
        [28] = 8243,
    },

    [8404992] = {
        [23] = 7992,
        [24] = 7993,
        [25] = 8237,
        [26] = 8256,
        [27] = 8251,
        [28] = 8244,
    },

    [8192] = {
        [23] = 7984,
        [24] = 7995,
        [25] = 8238,
        [26] = 8259,
        [27] = 8252,
        [28] = 8245,
    },

    [67272704] = {
        [23] = 7997,
        [24] = 8003,
        [25] = 8239,
        [26] = 8255,
        [27] = 8253,
        [28] = 8246,
    },

    [131072] = {
        [23] = 7997,
        [24] = 8003,
        [25] = 8239,
        [26] = 8255,
        [27] = 8253,
        [28] = 8248,
    },

    [67117056] = {
        [23] = 7991,
        [24] = 7998,
        [25] = 8240,
        [26] = 8260,
        [27] = 8254,
        [28] = 8247,
    },
}

---@type Dictionary<integer>
local inventoryTypeSlotMasks = {

    -- InventoryTypeSlotMask 1048738
    ["INVTYPE_HEAD"] = 1048738,
    ["INVTYPE_CHEST"] = 1048738,
    ["INVTYPE_LEGS"] = 1048738,
    ["INVTYPE_ROBE"] = 1048738,

    -- InventoryTypeSlotMask 5448
    ["INVTYPE_SHOULDER"] = 5448,
    ["INVTYPE_WAIST"] = 5448,
    ["INVTYPE_FEET"] = 5448,
    ["INVTYPE_HAND"] = 5448,
    ["INVTYPE_TRINKET"] = 5448,

    -- InventoryTypeSlotMask 68100
    ["INVTYPE_NECK"] = 68100,
    ["INVTYPE_WRIST"] = 68100,
    ["INVTYPE_FINGER"] = 68100,
    ["INVTYPE_CLOAK"] = 68100,

    -- InventoryTypeSlotMask 8404992
    ["INVTYPE_HOLDABLE"] = 8404992,
    ["INVTYPE_SHIELD"] = 8404992,

    -- InventoryTypeSlotMask 8192
    ["INVTYPE_WEAPON"] = 8192,

    -- InventoryTypeSlotMask 67272704
    ["INVTYPE_RANGED"] = 67272704,
    ["INVTYPE_2HWEAPON"] = 67272704,
    ["INVTYPE_RANGEDRIGHT"] = 67272704,
}

-- Override costs for Intellect items
---@type Dictionary<integer>
local inventoryTypeSlotMaskOverrides = {
    -- InventoryTypeSlotMask 131072
    ["INVTYPE_2HWEAPON"] = 131072,

    -- InventoryTypeSlotMask 67117056
    ["INVTYPE_WEAPON"] = 67117056,
    ["INVTYPE_RANGEDRIGHT"] = 67117056,
}

--- Fetches all the upgrade costs for a given upgrade info
---@param itemExtendedCosts Array<integer>
---@param upgradeInfo FlightstoneBonusData
---@return FlightstoneUpgradeCostData?
local function GetItemUpgradeCosts(itemExtendedCosts, upgradeInfo)
    local itemExtendedCost = itemExtendedCosts[upgradeInfo.upgradeGroup];
    if itemExtendedCost == nil then
        private.Debug(upgradeInfo.upgradeGroup, "did not have an entry in itemExtendedCosts")
        return nil
    end

    local upgradeCosts = itemExtendedCostTable[itemExtendedCost];
    if upgradeCosts == nil then
        private.Debug(itemExtendedCost, "did not have an entry in itemExtendedCostTable")
        return nil
    end

    ---@type FlightstoneUpgradeCostData
    local results = {
        whelpCrests = upgradeCosts.whelpCrests,
        drakeCrests = upgradeCosts.drakeCrests,
        wyrmCrests = upgradeCosts.wyrmCrests,
        aspectCrests = upgradeCosts.aspectCrests,
        flightstones = upgradeCosts.flightstones
    }
    
    if upgradeInfo.rank == 7 or upgradeInfo.rank == 8 then
        results.flightstones = Round(results.flightstones * 0.5)
    end

    return results
end

--- Parses the given upgrade costs to generate a table for use in tooltip
---@param equipLoc string
---@param itemLink string
---@return Array<integer>?
local function GetItemExtendedCosts(equipLoc, itemLink)
    local inventoryTypeSlotMask = inventoryTypeSlotMasks[equipLoc]
    if not inventoryTypeSlotMask then
        private.Debug(equipLoc, "was not found in the Flightstones inventory slot mask table");
        return nil
    end

    local inventoryTypeSlotMaskOverride = inventoryTypeSlotMaskOverrides[equipLoc];
    if inventoryTypeSlotMaskOverride then
        local stats = C_Item.GetItemStats(itemLink)
        if not stats then
            private.Debug("Could not extract Flightstones item stats from", itemLink);
            return nil
        end
        local hasInt = (stats["ITEM_MOD_INTELLECT_SHORT"] and stats["ITEM_MOD_INTELLECT_SHORT"] > 0)
        if hasInt then
            private.Debug("Upgrade cost for has been overridden because the item has Intellect on it.");
            inventoryTypeSlotMask = inventoryTypeSlotMaskOverride
        end
    end

    local itemExtendedCosts = itemExtendedCostLookup[inventoryTypeSlotMask];
    if not itemExtendedCosts then
        private.Debug(inventoryTypeSlotMask, "was not found in the Flightstones item extended cost lookup table");
        return nil
    end

    return itemExtendedCosts
end

--- Parses the given upgrade costs to generate a table for use in tooltip
---@param upgradeCostData FlightstoneUpgradeCostData
---@return table
local function ParseUpgradeCost(upgradeCostData)
    local lines = {}
    local compactCostLine = {}

    for upgradeId, upgradeItem in pairs(flightstoneUpgradeData) do
        if upgradeCostData[upgradeId] ~= nil and upgradeCostData[upgradeId] > 0 then
            local icon = upgradeItem.icon and CreateTextureMarkup(upgradeItem.icon, 64, 64, 0, 0, 0.1, 0.9, 0.1, 0.9) or ""
            local costLine = ""
            local upgradeCost = upgradeCostData[upgradeId];

            if upgradeItem.currencyId ~= nil then
                -- Check currency against cap
                local currencyInfo = private.currencyInfo[upgradeItem.currencyId]
                if currencyInfo == nil then
                    costLine = WHITE_FONT_COLOR:WrapTextInColorCode(BreakUpLargeNumbers(upgradeCost))

                    table.insert(compactCostLine, icon .. " " .. costLine)
                else
                    local itemCount = currencyInfo.quantity;
                    local requiredColor = itemCount >= upgradeCost and GREEN_FONT_COLOR or ERROR_COLOR;
                    local heldColor = (currencyInfo.maxQuantity > 0 and currencyInfo.quantity == currencyInfo.maxQuantity) and ERROR_COLOR or WHITE_FONT_COLOR

                    costLine = requiredColor:WrapTextInColorCode(BreakUpLargeNumbers(upgradeCost)) .. " / " .. heldColor:WrapTextInColorCode(BreakUpLargeNumbers(currencyInfo.quantity))

                    table.insert(compactCostLine, icon .. " " .. requiredColor:WrapTextInColorCode(BreakUpLargeNumbers(upgradeCost)))
                end
            elseif upgradeItem.itemId ~= nil then
                -- Get item count and compare to required
                local itemCount = C_Item.GetItemCount(upgradeItem.itemId, true);
                local requiredColor = itemCount >= upgradeCost and GREEN_FONT_COLOR or ERROR_COLOR;

                costLine = requiredColor:WrapTextInColorCode(BreakUpLargeNumbers(upgradeCost)) .. " / " .. WHITE_FONT_COLOR:WrapTextInColorCode(BreakUpLargeNumbers(itemCount))

                table.insert(compactCostLine, icon .. " " .. requiredColor:WrapTextInColorCode(BreakUpLargeNumbers(upgradeCost)))
            else
                costLine = WHITE_FONT_COLOR:WrapTextInColorCode(BreakUpLargeNumbers(upgradeCost))

                table.insert(compactCostLine, icon .. " " .. costLine)
            end

            if not private.DB.profile.CompactTooltips then
                table.insert(lines, {
                    left = icon .. " " .. upgradeItem.color:WrapTextInColorCode(upgradeItem.name),
                    right = costLine,
                    color = upgradeItem.color
                })
            end
        end
    end

    if private.DB.profile.CompactTooltips then
        table.insert(lines, {
            left = "",
            right = table.concat(compactCostLine, "  "),
            color = WHITE_FONT_COLOR
        })
    end

    if #lines == 0 then
        private.Debug("Parsing Flightstones upgrade cost returned no tooltip lines");
    end

    return lines;
end

--- Updates the tooltip when a Flightstone item is the item in question
---@param tooltip GameTooltip
---@param itemExtendedCosts Array<integer>
---@param bonusId integer
---@param bonusInfo FlightstoneBonusData
---@param itemLink string
local function HandleFlightstones(tooltip, itemExtendedCosts, bonusId, bonusInfo, itemLink)
    if not bonusId or not bonusInfo then
        private.Debug(bonusId, "or Flightstones bonus info table was not found");
        return
    end

    local WeaponSetHighWatermarkSlots = {
        Enum.ItemRedundancySlot.Twohand,
        Enum.ItemRedundancySlot.OnehandWeapon,
        Enum.ItemRedundancySlot.MainhandWeapon,
        Enum.ItemRedundancySlot.Offhand,
    };

    local characterHighWatermark, accountHighWatermark

    local highWatermarkSlot = C_ItemUpgrade.GetHighWatermarkSlotForItem(itemLink);
    if highWatermarkSlot then
        if tContains(WeaponSetHighWatermarkSlots, highWatermarkSlot) then
            local twoHandCharacterWatermark, twoHandAccountWatermark = C_ItemUpgrade.GetHighWatermarkForSlot(Enum.ItemRedundancySlot.Twohand)
            local oneHandCharacterWatermark, oneHandAccountWatermark = C_ItemUpgrade.GetHighWatermarkForSlot(Enum.ItemRedundancySlot.OnehandWeapon)
            local mainHandCharacterWatermark, mainHandAccountWatermark = C_ItemUpgrade.GetHighWatermarkForSlot(Enum.ItemRedundancySlot.MainhandWeapon)
            local offHandCharacterWatermark, offHandAccountWatermark = C_ItemUpgrade.GetHighWatermarkForSlot(Enum.ItemRedundancySlot.Offhand)

            local highestCharacterWatermarkForSet = 0
            local highestAccountWatermarkForSet = 0

            if twoHandCharacterWatermark > highestCharacterWatermarkForSet then highestCharacterWatermarkForSet = twoHandCharacterWatermark end
            if twoHandAccountWatermark > highestAccountWatermarkForSet then highestAccountWatermarkForSet = twoHandAccountWatermark end

            if oneHandCharacterWatermark > highestCharacterWatermarkForSet then highestCharacterWatermarkForSet = oneHandCharacterWatermark end
            if oneHandAccountWatermark > highestAccountWatermarkForSet then highestAccountWatermarkForSet = oneHandAccountWatermark end

            if mainHandCharacterWatermark  > highestCharacterWatermarkForSet and offHandCharacterWatermark > highestCharacterWatermarkForSet then
                highestCharacterWatermarkForSet = min(mainHandCharacterWatermark, offHandCharacterWatermark)
            end

            if mainHandAccountWatermark  > highestAccountWatermarkForSet and offHandAccountWatermark > highestAccountWatermarkForSet then
                highestAccountWatermarkForSet = min(mainHandAccountWatermark, offHandAccountWatermark)
            end

            characterHighWatermark, accountHighWatermark = C_ItemUpgrade.GetHighWatermarkForSlot(highWatermarkSlot)

            private.Debug("2H Character Watermark:", twoHandCharacterWatermark)
            private.Debug("2H Account Watermark:", twoHandAccountWatermark)
            private.Debug("1H Character Watermark:", oneHandCharacterWatermark)
            private.Debug("1H Account Watermark:", oneHandAccountWatermark)
            private.Debug("Mainhand Character Watermark:", mainHandCharacterWatermark)
            private.Debug("Mainhand Account Watermark:", mainHandAccountWatermark)
            private.Debug("Off-Hand Character Watermark:", offHandCharacterWatermark)
            private.Debug("Off-Hand Account Watermark:", offHandAccountWatermark)

            if highWatermarkSlot == Enum.ItemRedundancySlot.Twohand then
                -- 2H weapons can receive a partial discount if player has upgraded 1H weapons
                -- but I don't have info on what that partial discount looks like
            end

            -- all weapons benefit from the highest ilvl "set" of all weapon slots (set = one 2H, two 1H, or main + offhand)
            characterHighWatermark = max(characterHighWatermark, highestCharacterWatermarkForSet)
            accountHighWatermark = max(accountHighWatermark, highestAccountWatermarkForSet)
        else
            -- Regular discount specific to this HWM slot
            characterHighWatermark, accountHighWatermark = C_ItemUpgrade.GetHighWatermarkForSlot(highWatermarkSlot)
        end
    else
        characterHighWatermark, accountHighWatermark = C_ItemUpgrade.GetHighWatermarkForItem(itemLink)
    end

    ---@type FlightstoneUpgradeCostData?
    local nextUpgradeCost = nil

    ---@type FlightstoneBonusData?
    local nextUpgrade = nil

    ---@type FlightstoneBonusData?
    local maxUpgrade = nil

    ---@type FlightstoneUpgradeCostData
    local totalUpgradeCosts = {
        whelpCrests = 0,
        drakeCrests = 0,
        wyrmCrests = 0,
        aspectCrests = 0,
        flightstones = 0,
    }

    for _, upgradeInfo in pairs(flightstoneBonusIds) do
        if upgradeInfo.rank == bonusInfo.rank and upgradeInfo.upgradeLevel > bonusInfo.upgradeLevel then
            local upgradeCosts = GetItemUpgradeCosts(itemExtendedCosts, upgradeInfo);
            if upgradeCosts ~= nil then
                local isCharacterDiscounted = upgradeInfo.itemLevel <= characterHighWatermark
                local isAccountDiscounted = upgradeInfo.itemLevel <= accountHighWatermark

                local whelpCrests = upgradeCosts.whelpCrests * (isCharacterDiscounted and 0 or 1)
                local drakeCrests = upgradeCosts.drakeCrests * (isCharacterDiscounted and 0 or 1)
                local wyrmCrests = upgradeCosts.wyrmCrests * (isCharacterDiscounted and 0 or 1)
                local aspectCrests = upgradeCosts.aspectCrests * (isCharacterDiscounted and 0 or 1)
                local flightstones = Round(upgradeCosts.flightstones * (isAccountDiscounted and 0.5 or 1))

                if upgradeInfo.upgradeLevel == (bonusInfo.upgradeLevel + 1) then
                    nextUpgrade = upgradeInfo

                    nextUpgradeCost = {
                        whelpCrests = whelpCrests,
                        drakeCrests = drakeCrests,
                        wyrmCrests = wyrmCrests,
                        aspectCrests = aspectCrests,
                        flightstones = flightstones,
                    }
                end
                totalUpgradeCosts.whelpCrests = totalUpgradeCosts.whelpCrests + whelpCrests
                totalUpgradeCosts.drakeCrests = totalUpgradeCosts.drakeCrests + drakeCrests
                totalUpgradeCosts.wyrmCrests = totalUpgradeCosts.wyrmCrests + wyrmCrests
                totalUpgradeCosts.aspectCrests = totalUpgradeCosts.aspectCrests + aspectCrests
                totalUpgradeCosts.flightstones = totalUpgradeCosts.flightstones + flightstones

                if not maxUpgrade or maxUpgrade.upgradeLevel < upgradeInfo.upgradeLevel then
                    maxUpgrade = upgradeInfo
                end
            end
        end
    end

    if nextUpgradeCost and nextUpgrade then
        local nextLevelLines = ParseUpgradeCost(nextUpgradeCost)
        local totalLines = ParseUpgradeCost(totalUpgradeCosts)

        if #nextLevelLines > 0 or #totalLines > 0 then
            tooltip:AddLine("\n")
            tooltip:AddLine(ARTIFACT_GOLD_COLOR:WrapTextInColorCode(L["FLIGHTSTONE_CREST_UPGRADES"]))

            if nextLevelLines then
                if not private.DB.profile.CompactTooltips then
                    -- Standard tooltip
                    tooltip:AddLine(HEIRLOOM_BLUE_COLOR:WrapTextInColorCode(L["COST_FOR_NEXT_LEVEL"] .. " (" .. nextUpgrade.itemLevel .. ")"))

                    for _, newLine in pairs(nextLevelLines) do
                        tooltip:AddDoubleLine(newLine.left, newLine.right)
                    end
                else
                    -- Compact tooltips
                    tooltip:AddDoubleLine(
                        WHITE_FONT_COLOR:WrapTextInColorCode(L["NEXT_UPGRADE_X"]:format(nextUpgrade.itemLevel)),
                        nextLevelLines[1].right
                    )
                end
            end

            if totalLines and maxUpgrade then
                if not private.DB.profile.CompactTooltips then
                    -- Standard tooltip
                    if nextLevelLines then
                        tooltip:AddLine("\n")
                    end

                    tooltip:AddLine(HEIRLOOM_BLUE_COLOR:WrapTextInColorCode(L["COST_TO_UPGRADE_TO_MAX"] .. " (" .. maxUpgrade.itemLevel .. ")"))

                    for _, newLine in pairs(totalLines) do
                        tooltip:AddDoubleLine(newLine.left, newLine.right)
                    end
                else
                    -- Compact tooltips
                    tooltip:AddDoubleLine(
                        WHITE_FONT_COLOR:WrapTextInColorCode(L["MAX_UPGRADE_X"]:format(maxUpgrade.itemLevel)),
                        totalLines[1].right
                    )
                end
            end
        end
    else
        private.Debug("No next Flightstones upgrade cost could be found for", itemLink);
    end
end

--- Checks for valid bonus IDs and chains call to HandleFlightstones if found
---@diagnostic disable: unused-local
---@param tooltip GameTooltip
---@param itemId integer
---@param itemLink string
---@param currentUpgrade integer
---@param maxUpgrade integer
---@param bonusIds table<integer, integer>
---@return boolean
local function CheckFlightstoneBonusIDs(tooltip, itemId, itemLink, currentUpgrade, maxUpgrade, bonusIds)
    if private.DB.profile.DisabledIntegrations.Flightstones then
        private.Debug("Flightstones integration is disabled");

        return false
    end

    local equipLoc = select(9, C_Item.GetItemInfo(itemLink))

    private.Debug(itemLink, "has equipLoc", equipLoc);

    local upgradeCosts = GetItemExtendedCosts(equipLoc, itemLink);
    if upgradeCosts == nil then
        -- Debug statements should already be added by GetItemExtendedCosts
        return false
    end

    for i = 1, #bonusIds do
        ---@type FlightstoneBonusData?
        local bonusInfo = flightstoneBonusIds[bonusIds[i]]
        if bonusInfo ~= nil then
            private.Debug(bonusIds[i], "matched a Flighstones bonus ID");
            HandleFlightstones(tooltip, upgradeCosts, i, bonusInfo, itemLink)
            return true
        end
    end

    private.Debug(itemId, "did not match a Flightstones bonus ID");
    return false
end

table.insert(private.upgradeHandlers, CheckFlightstoneBonusIDs)
