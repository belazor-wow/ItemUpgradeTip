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

private.currencyIds["whelpCrest"] = 2706
private.currencyIndexes[private.currencyIds.whelpCrest] = true

private.currencyIds["drakeCrest"] = 2707
private.currencyIndexes[private.currencyIds.drakeCrest] = true

private.currencyIds["wyrmCrest"] = 2708
private.currencyIndexes[private.currencyIds.wyrmCrest] = true

private.currencyIds["aspectCrest"] = 2709
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
        icon = 5309872,
        itemId = nil,
        currencyId = private.currencyIds.whelpCrest
    },

    ["drakeCrests"] = {
        name = L["DRAKE_CRESTS"],
        shortName = L["DRAKE_CRESTS_SHORT"],
        color = RARE_BLUE_COLOR,
        icon = 5309870,
        itemId = nil,
        currencyId = private.currencyIds.drakeCrest
    },

    ["wyrmCrests"] = {
        name = L["WYRM_CRESTS"],
        shortName = L["WYRM_CRESTS_SHORT"],
        color = EPIC_PURPLE_COLOR,
        icon = 5309874,
        itemId = nil,
        currencyId = private.currencyIds.wyrmCrest
    },

    ["aspectCrests"] = {
        name = L["ASPECT_CRESTS"],
        shortName = L["ASPECT_CRESTS_SHORT"],
        color = LEGENDARY_ORANGE_COLOR,
        icon = 5309868,
        itemId = nil,
        currencyId = private.currencyIds.aspectCrest
    },
}

---@type Array<MythicPlusInfo>
private.mythicPlusInfo = {
    {keyLevel = 2, lootDrops = 441, vaultReward = 454, currency = flightstoneUpgradeData["whelpCrests"]},
    {keyLevel = 3, lootDrops = 444, vaultReward = 457, currency = flightstoneUpgradeData["whelpCrests"]},
    {keyLevel = 4, lootDrops = 444, vaultReward = 460, currency = flightstoneUpgradeData["whelpCrests"]},
    {keyLevel = 5, lootDrops = 447, vaultReward = 460, currency = flightstoneUpgradeData["whelpCrests"]},
    {keyLevel = 6, lootDrops = 447, vaultReward = 463, currency = flightstoneUpgradeData["drakeCrests"]},
    {keyLevel = 7, lootDrops = 450, vaultReward = 463, currency = flightstoneUpgradeData["drakeCrests"]},
    {keyLevel = 8, lootDrops = 450, vaultReward = 467, currency = flightstoneUpgradeData["drakeCrests"]},
    {keyLevel = 9, lootDrops = 454, vaultReward = 467, currency = flightstoneUpgradeData["drakeCrests"]},
    {keyLevel = 10, lootDrops = 454, vaultReward = 470, currency = flightstoneUpgradeData["drakeCrests"]},
    {keyLevel = 11, lootDrops = 457, vaultReward = 470, currency = flightstoneUpgradeData["wyrmCrests"]},
    {keyLevel = 12, lootDrops = 457, vaultReward = 473, currency = flightstoneUpgradeData["wyrmCrests"]},
    {keyLevel = 13, lootDrops = 460, vaultReward = 473, currency = flightstoneUpgradeData["wyrmCrests"]},
    {keyLevel = 14, lootDrops = 460, vaultReward = 473, currency = flightstoneUpgradeData["wyrmCrests"]},
    {keyLevel = 15, lootDrops = 463, vaultReward = 476, currency = flightstoneUpgradeData["wyrmCrests"]},
    {keyLevel = 16, lootDrops = 463, vaultReward = 476, currency = flightstoneUpgradeData["aspectCrests"]},
    {keyLevel = 17, lootDrops = 467, vaultReward = 476, currency = flightstoneUpgradeData["aspectCrests"]},
    {keyLevel = 18, lootDrops = 467, vaultReward = 480, currency = flightstoneUpgradeData["aspectCrests"]},
    {keyLevel = 19, lootDrops = 470, vaultReward = 480, currency = flightstoneUpgradeData["aspectCrests"]},
    {keyLevel = "20+", lootDrops = 470, vaultReward = 483, currency = flightstoneUpgradeData["aspectCrests"]},
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
        itemLevel = 441,
        upgrade1 = {rank = 3, upgradeLevel = 1, maxUpgradeLevel = 8},
        currency = flightstoneUpgradeData["whelpCrests"]
    },
    {
        itemLevel = 444,
        upgrade1 = {rank = 3, upgradeLevel = 2, maxUpgradeLevel = 8},
        currency = flightstoneUpgradeData["whelpCrests"]
    },
    {
        itemLevel = 447,
        upgrade1 = {rank = 3, upgradeLevel = 3, maxUpgradeLevel = 8},
        currency = flightstoneUpgradeData["whelpCrests"]
    },
    {
        itemLevel = 450,
        upgrade1 = {rank = 3, upgradeLevel = 4, maxUpgradeLevel = 8},
        currency = flightstoneUpgradeData["whelpCrests"]
    },
    {
        itemLevel = 454,
        upgrade1 = {rank = 3, upgradeLevel = 5, maxUpgradeLevel = 8},
        upgrade2 = {rank = 4, upgradeLevel = 1, maxUpgradeLevel = 8},
        currency = flightstoneUpgradeData["drakeCrests"]
    },
    {
        itemLevel = 457,
        upgrade1 = {rank = 3, upgradeLevel = 6, maxUpgradeLevel = 8},
        upgrade2 = {rank = 4, upgradeLevel = 2, maxUpgradeLevel = 8},
        currency = flightstoneUpgradeData["drakeCrests"]
    },
    {
        itemLevel = 460,
        upgrade1 = {rank = 3, upgradeLevel = 7, maxUpgradeLevel = 8},
        upgrade2 = {rank = 4, upgradeLevel = 3, maxUpgradeLevel = 8},
        currency = flightstoneUpgradeData["drakeCrests"]
    },
    {
        itemLevel = 463,
        upgrade1 = {rank = 3, upgradeLevel = 8, maxUpgradeLevel = 8},
        upgrade2 = {rank = 4, upgradeLevel = 4, maxUpgradeLevel = 8},
        currency = flightstoneUpgradeData["drakeCrests"]
    },
    {
        itemLevel = 467,
        upgrade1 = {rank = 4, upgradeLevel = 5, maxUpgradeLevel = 8},
        upgrade2 = {rank = 5, upgradeLevel = 1, maxUpgradeLevel = 6},
        currency = flightstoneUpgradeData["wyrmCrests"]
    },
    {
        itemLevel = 470,
        upgrade1 = {rank = 4, upgradeLevel = 6, maxUpgradeLevel = 8},
        upgrade2 = {rank = 5, upgradeLevel = 2, maxUpgradeLevel = 6},
        currency = flightstoneUpgradeData["wyrmCrests"]
    },
    {
        itemLevel = 473,
        upgrade1 = {rank = 4, upgradeLevel = 7, maxUpgradeLevel = 8},
        upgrade2 = {rank = 5, upgradeLevel = 3, maxUpgradeLevel = 6},
        currency = flightstoneUpgradeData["wyrmCrests"]
    },
    {
        itemLevel = 476,
        upgrade1 = {rank = 4, upgradeLevel = 8, maxUpgradeLevel = 8},
        upgrade2 = {rank = 5, upgradeLevel = 4, maxUpgradeLevel = 6},
        currency = flightstoneUpgradeData["wyrmCrests"]
    },
    {
        itemLevel = 480,
        upgrade1 = {rank = 5, upgradeLevel = 5, maxUpgradeLevel = 6},
        upgrade2 = {rank = 6, upgradeLevel = 1, maxUpgradeLevel = 4},
        currency = flightstoneUpgradeData["aspectCrests"]
    },
    {
        itemLevel = 483,
        upgrade1 = {rank = 5, upgradeLevel = 6, maxUpgradeLevel = 6},
        upgrade2 = {rank = 6, upgradeLevel = 2, maxUpgradeLevel = 4},
        currency = flightstoneUpgradeData["aspectCrests"]
    },
    {
        itemLevel = 486,
        upgrade1 = {rank = 6, upgradeLevel = 3, maxUpgradeLevel = 4},
        currency = flightstoneUpgradeData["aspectCrests"]
    },
    {
        itemLevel = 489,
        upgrade1 = {rank = 6, upgradeLevel = 4, maxUpgradeLevel = 4},
        currency = flightstoneUpgradeData["aspectCrests"]
    },
}

---@type Array<CraftingInfo>
private.craftingInfo = {
    -- Whelpling
    {itemLevel = 434, itemId = 206977, rank = 1},
    {itemLevel = 437, itemId = 206977, rank = 2},
    {itemLevel = 441, itemId = 206977, rank = 3},
    {itemLevel = 444, itemId = 206977, rank = 4},
    {itemLevel = 444, itemId = 206977, rank = 5},

    -- Spark
    {itemLevel = 450, itemId = 206959, rank = 1},
    {itemLevel = 454, itemId = 206959, rank = 2},
    {itemLevel = 457, itemId = 206959, rank = 3},
    {itemLevel = 460, itemId = 206959, rank = 4},
    {itemLevel = 463, itemId = 206959, rank = 5},

    -- Wyrm
    {itemLevel = 463, itemId = 206960, rank = 1},
    {itemLevel = 467, itemId = 206960, rank = 2},
    {itemLevel = 470, itemId = 206960, rank = 3},
    {itemLevel = 473, itemId = 206960, rank = 4},
    {itemLevel = 476, itemId = 206960, rank = 5},

    -- Aspect
    {itemLevel = 473, itemId = 206961, rank = 1},
    {itemLevel = 476, itemId = 206961, rank = 2},
    {itemLevel = 480, itemId = 206961, rank = 3},
    {itemLevel = 483, itemId = 206961, rank = 4},
    {itemLevel = 486, itemId = 206961, rank = 5},
}

---@type Array<FlightstoneBonusData>
local flightstoneBonusIds = {
    -- Explorer
    [9544] = {itemLevel = 415, rank = 1, upgradeLevel = 1, upgradeGroup = 23},
    [9545] = {itemLevel = 418, rank = 1, upgradeLevel = 2, upgradeGroup = 23},
    [9546] = {itemLevel = 421, rank = 1, upgradeLevel = 3, upgradeGroup = 23},
    [9547] = {itemLevel = 424, rank = 1, upgradeLevel = 4, upgradeGroup = 23},
    [9548] = {itemLevel = 428, rank = 1, upgradeLevel = 5, upgradeGroup = 24},
    [9549] = {itemLevel = 431, rank = 1, upgradeLevel = 6, upgradeGroup = 24},
    [9550] = {itemLevel = 434, rank = 1, upgradeLevel = 7, upgradeGroup = 24},
    [9551] = {itemLevel = 437, rank = 1, upgradeLevel = 8, upgradeGroup = 24},

    -- Adventurer
    [9536] = {itemLevel = 428, rank = 2, upgradeLevel = 1, upgradeGroup = 24},
    [9537] = {itemLevel = 431, rank = 2, upgradeLevel = 2, upgradeGroup = 24},
    [9538] = {itemLevel = 434, rank = 2, upgradeLevel = 3, upgradeGroup = 24},
    [9539] = {itemLevel = 437, rank = 2, upgradeLevel = 4, upgradeGroup = 24},
    [9540] = {itemLevel = 441, rank = 2, upgradeLevel = 5, upgradeGroup = 25},
    [9541] = {itemLevel = 444, rank = 2, upgradeLevel = 6, upgradeGroup = 25},
    [9542] = {itemLevel = 447, rank = 2, upgradeLevel = 7, upgradeGroup = 25},
    [9543] = {itemLevel = 450, rank = 2, upgradeLevel = 8, upgradeGroup = 25},

    -- Veteran
    [9552] = {itemLevel = 441, rank = 3, upgradeLevel = 1, upgradeGroup = 25},
    [9553] = {itemLevel = 444, rank = 3, upgradeLevel = 2, upgradeGroup = 25},
    [9554] = {itemLevel = 447, rank = 3, upgradeLevel = 3, upgradeGroup = 25},
    [9555] = {itemLevel = 450, rank = 3, upgradeLevel = 4, upgradeGroup = 25},
    [9556] = {itemLevel = 454, rank = 3, upgradeLevel = 5, upgradeGroup = 26},
    [9557] = {itemLevel = 457, rank = 3, upgradeLevel = 6, upgradeGroup = 26},
    [9558] = {itemLevel = 460, rank = 3, upgradeLevel = 7, upgradeGroup = 26},
    [9559] = {itemLevel = 463, rank = 3, upgradeLevel = 8, upgradeGroup = 26},

    -- Champion
    [9560] = {itemLevel = 454, rank = 4, upgradeLevel = 1, upgradeGroup = 26},
    [9561] = {itemLevel = 457, rank = 4, upgradeLevel = 2, upgradeGroup = 26},
    [9562] = {itemLevel = 460, rank = 4, upgradeLevel = 3, upgradeGroup = 26},
    [9563] = {itemLevel = 463, rank = 4, upgradeLevel = 4, upgradeGroup = 26},
    [9564] = {itemLevel = 467, rank = 4, upgradeLevel = 5, upgradeGroup = 27},
    [9565] = {itemLevel = 470, rank = 4, upgradeLevel = 6, upgradeGroup = 27},
    [9566] = {itemLevel = 473, rank = 4, upgradeLevel = 7, upgradeGroup = 27},
    [9567] = {itemLevel = 476, rank = 4, upgradeLevel = 8, upgradeGroup = 27},

    -- Hero
    [9568] = {itemLevel = 467, rank = 5, upgradeLevel = 1, upgradeGroup = 27},
    [9569] = {itemLevel = 470, rank = 5, upgradeLevel = 2, upgradeGroup = 27},
    [9570] = {itemLevel = 473, rank = 5, upgradeLevel = 3, upgradeGroup = 27},
    [9571] = {itemLevel = 476, rank = 5, upgradeLevel = 4, upgradeGroup = 27},
    [9572] = {itemLevel = 480, rank = 5, upgradeLevel = 5, upgradeGroup = 28},
    [9581] = {itemLevel = 483, rank = 5, upgradeLevel = 6, upgradeGroup = 28},

    -- Myth
    [9573] = {itemLevel = 480, rank = 6, upgradeLevel = 1, upgradeGroup = 28},
    [9574] = {itemLevel = 483, rank = 6, upgradeLevel = 2, upgradeGroup = 28},
    [9575] = {itemLevel = 486, rank = 6, upgradeLevel = 3, upgradeGroup = 28},
    [9576] = {itemLevel = 489, rank = 6, upgradeLevel = 4, upgradeGroup = 28},
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
        return nil
    end

    local upgradeCosts = itemExtendedCostTable[itemExtendedCost];
    if upgradeCosts == nil then
        return nil
    end

    return upgradeCosts
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
        local stats = GetItemStats(itemLink)
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
                local itemCount = GetItemCount(upgradeItem.itemId, true);
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

    local watermarkSlot = C_ItemUpgrade.GetHighWatermarkSlotForItem(itemLink);
    local characterHighWatermark, accountHighWatermark
    if watermarkSlot then
        -- This seems more accurate for Wands
        characterHighWatermark, accountHighWatermark = C_ItemUpgrade.GetHighWatermarkForSlot(watermarkSlot)
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

    local equipLoc = select(9, GetItemInfo(itemLink))

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
