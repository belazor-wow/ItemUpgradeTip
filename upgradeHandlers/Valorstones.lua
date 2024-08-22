-- ----------------------------------------------------------------------------
-- AddOn Namespace
-- ----------------------------------------------------------------------------
local AddOnFolderName = ... ---@type string
local private = select(2, ...) ---@class PrivateNamespace

---@type Localizations
local L = LibStub("AceLocale-3.0"):GetLocale(AddOnFolderName)

-- Add currency information
private.currencyIds["Valorstones"] = 3008
private.currencyIndexes[private.currencyIds.Valorstones] = true

private.currencyIds["weatheredCrest"] = 2914
private.currencyIndexes[private.currencyIds.weatheredCrest] = true

private.currencyIds["carvedCrest"] = 2915
private.currencyIndexes[private.currencyIds.carvedCrest] = true

private.currencyIds["runedCrest"] = 2916
private.currencyIndexes[private.currencyIds.runedCrest] = true

private.currencyIds["gildedCrest"] = 2917
private.currencyIndexes[private.currencyIds.gildedCrest] = true

-- Add preferences
private.Preferences.DefaultValues.profile.DisabledIntegrations.Valorstones = false;
private.Preferences.DisabledIntegrations.Valorstones = {
    type = "toggle",
    name = L["VALORSTONE_CREST_UPGRADES"],
    order = 110,
    width = "double",
}

-- ----------------------------------------------------------------------------
-- Valorstone Upgrade Cost
-- ----------------------------------------------------------------------------
---@class ValorstoneUpgradeCostData
---@field weatheredCrests integer
---@field carvedCrests integer
---@field runedCrests integer
---@field gildedCrests integer
---@field valorstones integer


---@type Dictionary<UpgradeData>
local valorstoneUpgradeData = {
    ["valorstones"] = {
       name = L["VALORSTONES"],
       shortName = L["VALORSTONES"],
       color = WHITE_FONT_COLOR,
       icon = 5868902,
       itemId = nil,
       currencyId = private.currencyIds.Valorstones
    },

    ["weatheredCrests"] = {
       name = L["WEATHERED_CRESTS"],
       shortName = L["WEATHERED_CRESTS_SHORT"],
       color = UNCOMMON_GREEN_COLOR,
       icon = 5872034,
       itemId = nil,
       currencyId = private.currencyIds.weatheredCrest
    },

    ["carvedCrests"] = {
       name = L["CARVED_CRESTS"],
       shortName = L["CARVED_CRESTS_SHORT"],
       color = RARE_BLUE_COLOR,
       icon = 5872028,
       itemId = nil,
       currencyId = private.currencyIds.carvedCrest
    },

    ["runedCrests"] = {
       name = L["RUNED_CRESTS"],
       shortName = L["RUNED_CRESTS_SHORT"],
       color = EPIC_PURPLE_COLOR,
       icon = 5872032,
       itemId = nil,
       currencyId = private.currencyIds.runedCrest
    },

    ["gildedCrests"] = {
       name = L["GILDED_CRESTS"],
       shortName = L["GILDED_CRESTS_SHORT"],
       color = LEGENDARY_ORANGE_COLOR,
       icon = 5872030,
       itemId = nil,
       currencyId = private.currencyIds.gildedCrest
    },
}

---@type Array<MythicPlusInfo>
private.mythicPlusInfo = {
    {keyLevel = 2, lootDrops = 597, vaultReward = 606, currency = valorstoneUpgradeData["carvedCrests"]},
    {keyLevel = 3, lootDrops = 597, vaultReward = 610, currency = valorstoneUpgradeData["carvedCrests"]},
    {keyLevel = 4, lootDrops = 600, vaultReward = 610, currency = valorstoneUpgradeData["runedCrests"]},
    {keyLevel = 5, lootDrops = 603, vaultReward = 613, currency = valorstoneUpgradeData["runedCrests"]},
    {keyLevel = 6, lootDrops = 606, vaultReward = 613, currency = valorstoneUpgradeData["runedCrests"]},
    {keyLevel = 7, lootDrops = 610, vaultReward = 616, currency = valorstoneUpgradeData["runedCrests"]},
    {keyLevel = 8, lootDrops = 610, vaultReward = 619, currency = valorstoneUpgradeData["runedCrests"]},
    {keyLevel = 9, lootDrops = 613, vaultReward = 619, currency = valorstoneUpgradeData["gildedCrests"]},
    {keyLevel = "10+", lootDrops = 613, vaultReward = 623, currency = valorstoneUpgradeData["gildedCrests"]},
}

---@type Array<RaidInfo>
private.raidInfo = {
    {boss = 1,                  lfr = 584, normal = 597, heroic = 610, mythic = 623},
    {boss = 2,                  lfr = 584, normal = 597, heroic = 610, mythic = 623},
    {boss = 3,                  lfr = 587, normal = 600, heroic = 613, mythic = 626},
    {boss = L["X_RARE"]:format(3),  lfr = 600, normal = 613, heroic = 626, mythic = 639},
    {boss = 4,                  lfr = 587, normal = 600, heroic = 613, mythic = 626},
    {boss = L["X_RARE"]:format(4),  lfr = 600, normal = 606, heroic = 626, mythic = 639},
    {boss = 5,                  lfr = 590, normal = 603, heroic = 616, mythic = 629},
    {boss = 6,                  lfr = 590, normal = 603, heroic = 616, mythic = 629},
    {boss = L["X_RARE"]:format(6),  lfr = 600, normal = 606, heroic = 626, mythic = 639},
    {boss = 7,                  lfr = 593, normal = 606, heroic = 619, mythic = 632},
    {boss = 8,                  lfr = 593, normal = 606, heroic = 619, mythic = 632},
    {boss = L["X_RARE"]:format(8),  lfr = 600, normal = 613, heroic = 626, mythic = 639},
}

---@type RaidCurrencyInfo
 private.raidCurrencyInfo = {
    -- LFR
    lfrCurrency = valorstoneUpgradeData["weatheredCrests"],

    -- Normal
    normalCurrency = valorstoneUpgradeData["carvedCrests"],

    -- Heroic
    heroicCurrency = valorstoneUpgradeData["runedCrests"],

    -- Mythic
    mythicCurrency = valorstoneUpgradeData["gildedCrests"],
}

---@type Array<UpgradeTrackInfo>
private.upgradeTrackInfo = {
    {
        itemLevel = 572,
        upgrade1 = {rank = 2, upgradeLevel = 1, maxUpgradeLevel = 8},
        currency = valorstoneUpgradeData["valorstones"]
    },
    {
        itemLevel = 575,
        upgrade1 = {rank = 2, upgradeLevel = 2, maxUpgradeLevel = 8},
        currency = valorstoneUpgradeData["valorstones"]
    },
    {
        itemLevel = 578,
        upgrade1 = {rank = 2, upgradeLevel = 3, maxUpgradeLevel = 8},
        currency = valorstoneUpgradeData["valorstones"]
    },
    {
        itemLevel = 581,
        upgrade1 = {rank = 2, upgradeLevel = 4, maxUpgradeLevel = 8},
        currency = valorstoneUpgradeData["valorstones"]
    },
    {
        itemLevel = 584,
        upgrade1 = {rank = 2, upgradeLevel = 5, maxUpgradeLevel = 8},
        upgrade2 = {rank = 3, upgradeLevel = 1, maxUpgradeLevel = 8},
        currency = valorstoneUpgradeData["weatheredCrests"]
    },
    {
        itemLevel = 587,
        upgrade1 = {rank = 2, upgradeLevel = 6, maxUpgradeLevel = 8},
        upgrade2 = {rank = 3, upgradeLevel = 2, maxUpgradeLevel = 8},
        currency = valorstoneUpgradeData["weatheredCrests"]
    },
    {
        itemLevel = 590,
        upgrade1 = {rank = 2, upgradeLevel = 7, maxUpgradeLevel = 8},
        upgrade2 = {rank = 3, upgradeLevel = 3, maxUpgradeLevel = 8},
        currency = valorstoneUpgradeData["weatheredCrests"]
    },
    {
        itemLevel = 593,
        upgrade1 = {rank = 2, upgradeLevel = 8, maxUpgradeLevel = 8},
        upgrade2 = {rank = 3, upgradeLevel = 4, maxUpgradeLevel = 8},
        currency = valorstoneUpgradeData["weatheredCrests"]
    },
    {
        itemLevel = 597,
        upgrade1 = {rank = 3, upgradeLevel = 5, maxUpgradeLevel = 8},
        upgrade2 = {rank = 4, upgradeLevel = 1, maxUpgradeLevel = 8},
        currency = valorstoneUpgradeData["carvedCrests"]
    },
    {
        itemLevel = 600,
        upgrade1 = {rank = 3, upgradeLevel = 6, maxUpgradeLevel = 8},
        upgrade2 = {rank = 4, upgradeLevel = 2, maxUpgradeLevel = 8},
        currency = valorstoneUpgradeData["carvedCrests"]
    },
    {
        itemLevel = 603,
        upgrade1 = {rank = 3, upgradeLevel = 7, maxUpgradeLevel = 8},
        upgrade2 = {rank = 4, upgradeLevel = 3, maxUpgradeLevel = 8},
        currency = valorstoneUpgradeData["carvedCrests"]
    },
    {
        itemLevel = 606,
        upgrade1 = {rank = 3, upgradeLevel = 8, maxUpgradeLevel = 8},
        upgrade2 = {rank = 4, upgradeLevel = 4, maxUpgradeLevel = 8},
        currency = valorstoneUpgradeData["carvedCrests"]
    },
    {
        itemLevel = 610,
        upgrade1 = {rank = 4, upgradeLevel = 5, maxUpgradeLevel = 8},
        upgrade2 = {rank = 5, upgradeLevel = 1, maxUpgradeLevel = 6},
        currency = valorstoneUpgradeData["runedCrests"]
    },
    {
        itemLevel = 613,
        upgrade1 = {rank = 4, upgradeLevel = 6, maxUpgradeLevel = 8},
        upgrade2 = {rank = 5, upgradeLevel = 2, maxUpgradeLevel = 6},
        currency = valorstoneUpgradeData["runedCrests"]
    },
    {
        itemLevel = 616,
        upgrade1 = {rank = 4, upgradeLevel = 7, maxUpgradeLevel = 8},
        upgrade2 = {rank = 5, upgradeLevel = 3, maxUpgradeLevel = 6},
        currency = valorstoneUpgradeData["runedCrests"]
    },
    {
        itemLevel = 619,
        upgrade1 = {rank = 4, upgradeLevel = 8, maxUpgradeLevel = 8},
        upgrade2 = {rank = 5, upgradeLevel = 4, maxUpgradeLevel = 6},
        currency = valorstoneUpgradeData["runedCrests"]
    },
    {
        itemLevel = 623,
        upgrade1 = {rank = 5, upgradeLevel = 5, maxUpgradeLevel = 6},
        upgrade2 = {rank = 6, upgradeLevel = 1, maxUpgradeLevel = 6},
        currency = valorstoneUpgradeData["gildedCrests"]
    },
    {
        itemLevel = 626,
        upgrade1 = {rank = 5, upgradeLevel = 6, maxUpgradeLevel = 6},
        upgrade2 = {rank = 6, upgradeLevel = 2, maxUpgradeLevel = 6},
        currency = valorstoneUpgradeData["gildedCrests"]
    },
    {
        itemLevel = 629,
        upgrade1 = {rank = 6, upgradeLevel = 3, maxUpgradeLevel = 6},
        currency = valorstoneUpgradeData["gildedCrests"]
    },
    {
        itemLevel = 632,
        upgrade1 = {rank = 6, upgradeLevel = 4, maxUpgradeLevel = 6},
        currency = valorstoneUpgradeData["gildedCrests"]
    },
    {
        itemLevel = 635,
        upgrade1 = {rank = 6, upgradeLevel = 5, maxUpgradeLevel = 6},
        currency = valorstoneUpgradeData["gildedCrests"]
    },
    {
        itemLevel = 639,
        upgrade1 = {rank = 6, upgradeLevel = 6, maxUpgradeLevel = 6},
        currency = valorstoneUpgradeData["gildedCrests"]
    },
}

---@type Array<CraftingInfo>
private.craftingInfo = {
    -- Weathered
    {itemLevel = 578, itemId = 224069, rank = 1, iconPath = "Professions-ChatIcon-Quality-Tier1"},
    {itemLevel = 581, itemId = 224069, rank = 2, iconPath = "Professions-ChatIcon-Quality-Tier2"},
    {itemLevel = 584, itemId = 224069, rank = 3, iconPath = "Professions-ChatIcon-Quality-Tier3"},
    {itemLevel = 587, itemId = 224069, rank = 4, iconPath = "Professions-ChatIcon-Quality-Tier4"},
    {itemLevel = 590, itemId = 224069, rank = 5, iconPath = "Professions-ChatIcon-Quality-Tier5"},

    -- Line break
    {itemLevel = 0, itemId = 0, rank = 0, iconPath = ""},

    -- Spark
    {itemLevel = 584, itemId = 211296, rank = 1, iconPath = "Professions-ChatIcon-Quality-Tier1"},
    {itemLevel = 587, itemId = 211296, rank = 2, iconPath = "Professions-ChatIcon-Quality-Tier2"},
    {itemLevel = 590, itemId = 211296, rank = 3, iconPath = "Professions-ChatIcon-Quality-Tier3"},
    {itemLevel = 593, itemId = 211296, rank = 4, iconPath = "Professions-ChatIcon-Quality-Tier4"},
    {itemLevel = 597, itemId = 211296, rank = 5, iconPath = "Professions-ChatIcon-Quality-Tier5"},

    -- Line break
    {itemLevel = 0, itemId = 0, rank = 0, iconPath = ""},

    -- Runed
    {itemLevel = 606, itemId = 224072, rank = 1, iconPath = "Professions-ChatIcon-Quality-Tier1"},
    {itemLevel = 610, itemId = 224072, rank = 2, iconPath = "Professions-ChatIcon-Quality-Tier2"},
    {itemLevel = 613, itemId = 224072, rank = 3, iconPath = "Professions-ChatIcon-Quality-Tier3"},
    {itemLevel = 616, itemId = 224072, rank = 4, iconPath = "Professions-ChatIcon-Quality-Tier4"},
    {itemLevel = 619, itemId = 224072, rank = 5, iconPath = "Professions-ChatIcon-Quality-Tier5"},

    -- Line break
    {itemLevel = 0, itemId = 0, rank = 0, iconPath = ""},

    -- Gilded
    {itemLevel = 623, itemId = 224073, rank = 1, iconPath = "Professions-ChatIcon-Quality-Tier1"},
    {itemLevel = 626, itemId = 224073, rank = 2, iconPath = "Professions-ChatIcon-Quality-Tier2"},
    {itemLevel = 629, itemId = 224073, rank = 3, iconPath = "Professions-ChatIcon-Quality-Tier3"},
    {itemLevel = 633, itemId = 224073, rank = 4, iconPath = "Professions-ChatIcon-Quality-Tier4"},
    {itemLevel = 636, itemId = 224073, rank = 5, iconPath = "Professions-ChatIcon-Quality-Tier5"},
}

---@type Array<ItemBonusInfo>
local itemBonusIds = {

       -- Explorer (8)
       [10282] = {
          itemLevel = 580,
          rank = 1,
          upgradeLevel = 8,
          maxUpgradeLevel = 8,
          upgradeGroup = 329,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 75}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 65}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 40}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 40}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 80}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 160}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 120}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 160}
             }
          }
       },
       [10283] = {
          itemLevel = 577,
          rank = 1,
          upgradeLevel = 7,
          maxUpgradeLevel = 8,
          upgradeGroup = 329,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 75}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 65}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 40}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 40}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 80}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 160}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 120}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 160}
             }
          }
       },
       [10284] = {
          itemLevel = 574,
          rank = 1,
          upgradeLevel = 6,
          maxUpgradeLevel = 8,
          upgradeGroup = 329,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 75}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 65}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 40}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 40}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 80}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 160}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 120}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 160}
             }
          }
       },
       [10285] = {
          itemLevel = 571,
          rank = 1,
          upgradeLevel = 5,
          maxUpgradeLevel = 8,
          upgradeGroup = 329,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 75}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 65}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 40}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 40}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 80}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 160}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 120}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 160}
             }
          }
       },
       [10286] = {
          itemLevel = 567,
          rank = 1,
          upgradeLevel = 4,
          maxUpgradeLevel = 8,
          upgradeGroup = 329,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 50}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 40}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 25}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 25}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 50}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 100}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 75}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 100}
             }
          }
       },
       [10287] = {
          itemLevel = 564,
          rank = 1,
          upgradeLevel = 3,
          maxUpgradeLevel = 8,
          upgradeGroup = 329,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 50}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 40}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 25}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 25}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 50}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 100}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 75}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 100}
             }
          }
       },
       [10288] = {
          itemLevel = 561,
          rank = 1,
          upgradeLevel = 2,
          maxUpgradeLevel = 8,
          upgradeGroup = 329,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 50}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 40}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 25}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 25}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 50}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 100}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 75}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 100}
             }
          }
       },
       [10289] = {
          itemLevel = 558,
          rank = 1,
          upgradeLevel = 1,
          maxUpgradeLevel = 8,
          upgradeGroup = 329,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 50}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 40}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 25}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 25}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 50}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 100}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 75}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 100}
             }
          }
       },

       -- Adventurer (8)
       [10290] = {
          itemLevel = 593,
          rank = 2,
          upgradeLevel = 8,
          maxUpgradeLevel = 8,
          upgradeGroup = 330,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 120},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 100},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 65},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 65},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 125},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 250},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 200},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 250},
                 [2] = {currencyId = 2914, amount = 15}
             }
          }
       },
       [10291] = {
          itemLevel = 590,
          rank = 2,
          upgradeLevel = 7,
          maxUpgradeLevel = 8,
          upgradeGroup = 330,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 120},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 100},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 65},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 65},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 125},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 250},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 200},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 250},
                 [2] = {currencyId = 2914, amount = 15}
             }
          }
       },
       [10292] = {
          itemLevel = 587,
          rank = 2,
          upgradeLevel = 6,
          maxUpgradeLevel = 8,
          upgradeGroup = 330,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 120},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 100},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 65},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 65},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 125},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 250},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 200},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 250},
                 [2] = {currencyId = 2914, amount = 15}
             }
          }
       },
       [10293] = {
          itemLevel = 584,
          rank = 2,
          upgradeLevel = 5,
          maxUpgradeLevel = 8,
          upgradeGroup = 330,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 120},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 100},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 65},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 65},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 125},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 250},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 200},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 250},
                 [2] = {currencyId = 2914, amount = 15}
             }
          }
       },
       [10294] = {
          itemLevel = 580,
          rank = 2,
          upgradeLevel = 4,
          maxUpgradeLevel = 8,
          upgradeGroup = 330,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 75}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 65}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 40}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 40}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 80}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 160}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 120}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 160}
             }
          }
       },
       [10295] = {
          itemLevel = 577,
          rank = 2,
          upgradeLevel = 3,
          maxUpgradeLevel = 8,
          upgradeGroup = 330,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 75}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 65}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 40}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 40}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 80}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 160}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 120}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 160}
             }
          }
       },
       [10296] = {
          itemLevel = 574,
          rank = 2,
          upgradeLevel = 2,
          maxUpgradeLevel = 8,
          upgradeGroup = 330,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 75}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 65}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 40}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 40}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 80}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 160}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 120}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 160}
             }
          }
       },
       [10297] = {
          itemLevel = 571,
          rank = 2,
          upgradeLevel = 1,
          maxUpgradeLevel = 8,
          upgradeGroup = 330,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 75}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 65}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 40}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 40}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 80}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 160}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 120}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 160}
             }
          }
       },

       -- Veteran (8)
       [10274] = {
          itemLevel = 606,
          rank = 3,
          upgradeLevel = 8,
          maxUpgradeLevel = 8,
          upgradeGroup = 331,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 145},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 120},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 75},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 75},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 150},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 300},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 225},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 300},
                 [2] = {currencyId = 2915, amount = 15}
             }
          }
       },
       [10275] = {
          itemLevel = 603,
          rank = 3,
          upgradeLevel = 7,
          maxUpgradeLevel = 8,
          upgradeGroup = 331,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 145},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 120},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 75},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 75},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 150},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 300},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 225},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 300},
                 [2] = {currencyId = 2915, amount = 15}
             }
          }
       },
       [10276] = {
          itemLevel = 600,
          rank = 3,
          upgradeLevel = 6,
          maxUpgradeLevel = 8,
          upgradeGroup = 331,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 145},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 120},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 75},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 75},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 150},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 300},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 225},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 300},
                 [2] = {currencyId = 2915, amount = 15}
             }
          }
       },
       [10277] = {
          itemLevel = 597,
          rank = 3,
          upgradeLevel = 5,
          maxUpgradeLevel = 8,
          upgradeGroup = 331,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 145},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 120},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 75},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 75},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 150},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 300},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 225},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 300},
                 [2] = {currencyId = 2915, amount = 15}
             }
          }
       },
       [10278] = {
          itemLevel = 593,
          rank = 3,
          upgradeLevel = 4,
          maxUpgradeLevel = 8,
          upgradeGroup = 331,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 120},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 100},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 65},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 65},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 125},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 250},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 200},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 250},
                 [2] = {currencyId = 2914, amount = 15}
             }
          }
       },
       [10279] = {
          itemLevel = 590,
          rank = 3,
          upgradeLevel = 3,
          maxUpgradeLevel = 8,
          upgradeGroup = 331,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 120},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 100},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 65},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 65},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 125},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 250},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 200},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 250},
                 [2] = {currencyId = 2914, amount = 15}
             }
          }
       },
       [10280] = {
          itemLevel = 587,
          rank = 3,
          upgradeLevel = 2,
          maxUpgradeLevel = 8,
          upgradeGroup = 331,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 120},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 100},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 65},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 65},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 125},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 250},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 200},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 250},
                 [2] = {currencyId = 2914, amount = 15}
             }
          }
       },
       [10281] = {
          itemLevel = 584,
          rank = 3,
          upgradeLevel = 1,
          maxUpgradeLevel = 8,
          upgradeGroup = 331,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 120},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 100},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 65},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 65},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 125},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 250},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 200},
                 [2] = {currencyId = 2914, amount = 15}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 250},
                 [2] = {currencyId = 2914, amount = 15}
             }
          }
       },

       -- Champion (8)
       [10266] = {
          itemLevel = 619,
          rank = 4,
          upgradeLevel = 8,
          maxUpgradeLevel = 8,
          upgradeGroup = 332,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 170},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 140},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 90},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 90},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 175},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 350},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 275},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 350},
                 [2] = {currencyId = 2916, amount = 15}
             }
          }
       },
       [10267] = {
          itemLevel = 616,
          rank = 4,
          upgradeLevel = 7,
          maxUpgradeLevel = 8,
          upgradeGroup = 332,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 170},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 140},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 90},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 90},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 175},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 350},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 275},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 350},
                 [2] = {currencyId = 2916, amount = 15}
             }
          }
       },
       [10268] = {
          itemLevel = 613,
          rank = 4,
          upgradeLevel = 6,
          maxUpgradeLevel = 8,
          upgradeGroup = 332,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 170},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 140},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 90},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 90},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 175},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 350},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 275},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 350},
                 [2] = {currencyId = 2916, amount = 15}
             }
          }
       },
       [10269] = {
          itemLevel = 610,
          rank = 4,
          upgradeLevel = 5,
          maxUpgradeLevel = 8,
          upgradeGroup = 332,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 170},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 140},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 90},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 90},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 175},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 350},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 275},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 350},
                 [2] = {currencyId = 2916, amount = 15}
             }
          }
       },
       [10270] = {
          itemLevel = 606,
          rank = 4,
          upgradeLevel = 4,
          maxUpgradeLevel = 8,
          upgradeGroup = 332,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 145},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 120},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 75},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 75},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 150},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 300},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 225},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 300},
                 [2] = {currencyId = 2915, amount = 15}
             }
          }
       },
       [10271] = {
          itemLevel = 603,
          rank = 4,
          upgradeLevel = 3,
          maxUpgradeLevel = 8,
          upgradeGroup = 332,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 145},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 120},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 75},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 75},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 150},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 300},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 225},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 300},
                 [2] = {currencyId = 2915, amount = 15}
             }
          }
       },
       [10272] = {
          itemLevel = 600,
          rank = 4,
          upgradeLevel = 2,
          maxUpgradeLevel = 8,
          upgradeGroup = 332,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 145},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 120},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 75},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 75},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 150},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 300},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 225},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 300},
                 [2] = {currencyId = 2915, amount = 15}
             }
          }
       },
       [10273] = {
          itemLevel = 597,
          rank = 4,
          upgradeLevel = 1,
          maxUpgradeLevel = 8,
          upgradeGroup = 332,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 145},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 120},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 75},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 75},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 150},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 300},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 225},
                 [2] = {currencyId = 2915, amount = 15}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 300},
                 [2] = {currencyId = 2915, amount = 15}
             }
          }
       },

       -- Hero (6)
       [10256] = {
          itemLevel = 626,
          rank = 5,
          upgradeLevel = 6,
          maxUpgradeLevel = 6,
          upgradeGroup = 333,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 190},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 160},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 100},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 100},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 200},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 400},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 300},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 400},
                 [2] = {currencyId = 2917, amount = 15}
             }
          }
       },
       [10261] = {
          itemLevel = 623,
          rank = 5,
          upgradeLevel = 5,
          maxUpgradeLevel = 6,
          upgradeGroup = 333,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 190},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 160},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 100},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 100},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 200},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 400},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 300},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 400},
                 [2] = {currencyId = 2917, amount = 15}
             }
          }
       },
       [10262] = {
          itemLevel = 619,
          rank = 5,
          upgradeLevel = 4,
          maxUpgradeLevel = 6,
          upgradeGroup = 333,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 170},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 140},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 90},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 90},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 175},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 350},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 275},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 350},
                 [2] = {currencyId = 2916, amount = 15}
             }
          }
       },
       [10263] = {
          itemLevel = 616,
          rank = 5,
          upgradeLevel = 3,
          maxUpgradeLevel = 6,
          upgradeGroup = 333,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 170},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 140},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 90},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 90},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 175},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 350},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 275},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 350},
                 [2] = {currencyId = 2916, amount = 15}
             }
          }
       },
       [10264] = {
          itemLevel = 613,
          rank = 5,
          upgradeLevel = 2,
          maxUpgradeLevel = 6,
          upgradeGroup = 333,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 170},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 140},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 90},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 90},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 175},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 350},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 275},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 350},
                 [2] = {currencyId = 2916, amount = 15}
             }
          }
       },
       [10265] = {
          itemLevel = 610,
          rank = 5,
          upgradeLevel = 1,
          maxUpgradeLevel = 6,
          upgradeGroup = 333,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 170},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 140},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 90},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 90},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 175},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 350},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 275},
                 [2] = {currencyId = 2916, amount = 15}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 350},
                 [2] = {currencyId = 2916, amount = 15}
             }
          }
       },

       -- Myth (6)
       [10257] = {
          itemLevel = 632,
          rank = 6,
          upgradeLevel = 4,
          maxUpgradeLevel = 6,
          upgradeGroup = 334,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 190},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 160},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 100},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 100},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 200},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 400},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 300},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 400},
                 [2] = {currencyId = 2917, amount = 15}
             }
          }
       },
       [10258] = {
          itemLevel = 629,
          rank = 6,
          upgradeLevel = 3,
          maxUpgradeLevel = 6,
          upgradeGroup = 334,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 190},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 160},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 100},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 100},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 200},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 400},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 300},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 400},
                 [2] = {currencyId = 2917, amount = 15}
             }
          }
       },
       [10259] = {
          itemLevel = 626,
          rank = 6,
          upgradeLevel = 2,
          maxUpgradeLevel = 6,
          upgradeGroup = 334,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 190},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 160},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 100},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 100},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 200},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 400},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 300},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 400},
                 [2] = {currencyId = 2917, amount = 15}
             }
          }
       },
       [10260] = {
          itemLevel = 623,
          rank = 6,
          upgradeLevel = 1,
          maxUpgradeLevel = 6,
          upgradeGroup = 334,
          costs = {
             [1048738] = {
                 [1] = {currencyId = 3008, amount = 190},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [5448] = {
                 [1] = {currencyId = 3008, amount = 160},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [68100] = {
                 [1] = {currencyId = 3008, amount = 100},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [8404992] = {
                 [1] = {currencyId = 3008, amount = 100},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [8192] = {
                 [1] = {currencyId = 3008, amount = 200},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [67272704] = {
                 [1] = {currencyId = 3008, amount = 400},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [67117056] = {
                 [1] = {currencyId = 3008, amount = 300},
                 [2] = {currencyId = 2917, amount = 15}
             },
             [131072] = {
                 [1] = {currencyId = 3008, amount = 400},
                 [2] = {currencyId = 2917, amount = 15}
             }
          }
       }
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
---@param inventoryTypeSlotMask integer
---@param upgradeInfo ItemBonusInfo
---@return ValorstoneUpgradeCostData?
local function GetItemUpgradeCosts(inventoryTypeSlotMask, upgradeInfo)
    ---@type ValorstoneUpgradeCostData
    local results = {
       weatheredCrests = 0,
       carvedCrests = 0,
       runedCrests = 0,
       gildedCrests = 0,
       valorstones = 0
    }

    for _, upgradeCost in pairs(upgradeInfo.costs[inventoryTypeSlotMask]) do
       if upgradeCost.currencyId == private.currencyIds["Valorstones"] then
          results.valorstones = upgradeCost.amount
       elseif upgradeCost.currencyId == private.currencyIds["weatheredCrest"] then
          results.weatheredCrests = upgradeCost.amount
       elseif upgradeCost.currencyId == private.currencyIds["carvedCrest"] then
          results.carvedCrests = upgradeCost.amount
       elseif upgradeCost.currencyId == private.currencyIds["runedCrest"] then
          results.runedCrests = upgradeCost.amount
       elseif upgradeCost.currencyId == private.currencyIds["gildedCrest"] then
          results.gildedCrests = upgradeCost.amount
       end
    end

    return results
end

--- Parses the given upgrade costs to generate a table for use in tooltip
---@param upgradeCostData ValorstoneUpgradeCostData
---@return table
local function ParseUpgradeCost(upgradeCostData)
    local lines = {}
    local compactCostLine = {}

    for upgradeId, upgradeItem in pairs(valorstoneUpgradeData) do
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
       private.Debug("Parsing Valorstones upgrade cost returned no tooltip lines");
    end

    return lines;
end

--- Updates the tooltip when a Valorstone item is the item in question
---@param tooltip GameTooltip
---@param inventoryTypeSlotMask integer
---@param bonusId integer
---@param bonusInfo ItemBonusInfo
---@param itemLink string
local function HandleValorstones(tooltip, inventoryTypeSlotMask, bonusId, bonusInfo, itemLink)
    if not bonusId or not bonusInfo then
       private.Debug(bonusId, "or Valorstones bonus info table was not found");
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

    ---@type ValorstoneUpgradeCostData?
    local nextUpgradeCost = nil

    ---@type ItemBonusInfo?
    local nextUpgrade = nil

    ---@type ItemBonusInfo?
    local maxUpgrade = nil

    ---@type ValorstoneUpgradeCostData
    local totalUpgradeCosts = {
       weatheredCrests = 0,
       carvedCrests = 0,
       runedCrests = 0,
       gildedCrests = 0,
       valorstones = 0,
    }

    for _, upgradeInfo in pairs(itemBonusIds) do
       if upgradeInfo.rank == bonusInfo.rank and upgradeInfo.upgradeGroup == bonusInfo.upgradeGroup and upgradeInfo.upgradeLevel > bonusInfo.upgradeLevel then
          local upgradeCosts = GetItemUpgradeCosts(inventoryTypeSlotMask, upgradeInfo);
          if upgradeCosts ~= nil then
             local isCharacterDiscounted = upgradeInfo.itemLevel <= characterHighWatermark
             local isAccountDiscounted = upgradeInfo.itemLevel <= accountHighWatermark

             local weatheredCrests = upgradeCosts.weatheredCrests * (isCharacterDiscounted and 0 or 1)
             local carvedCrests = upgradeCosts.carvedCrests * (isCharacterDiscounted and 0 or 1)
             local runedCrests = upgradeCosts.runedCrests * (isCharacterDiscounted and 0 or 1)
             local gildedCrests = upgradeCosts.gildedCrests * (isCharacterDiscounted and 0 or 1)
             local valorstones = Round(upgradeCosts.valorstones * (isAccountDiscounted and 0.5 or 1))

             if upgradeInfo.upgradeLevel == (bonusInfo.upgradeLevel + 1) then
                nextUpgrade = upgradeInfo

                nextUpgradeCost = {
                    weatheredCrests = weatheredCrests,
                    carvedCrests = carvedCrests,
                    runedCrests = runedCrests,
                    gildedCrests = gildedCrests,
                    valorstones = valorstones,
                }
             end

             totalUpgradeCosts.weatheredCrests = totalUpgradeCosts.weatheredCrests + weatheredCrests
             totalUpgradeCosts.carvedCrests = totalUpgradeCosts.carvedCrests + carvedCrests
             totalUpgradeCosts.runedCrests = totalUpgradeCosts.runedCrests + runedCrests
             totalUpgradeCosts.gildedCrests = totalUpgradeCosts.gildedCrests + gildedCrests
             totalUpgradeCosts.valorstones = totalUpgradeCosts.valorstones + valorstones

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
          tooltip:AddLine(ARTIFACT_GOLD_COLOR:WrapTextInColorCode(L["VALORSTONE_CREST_UPGRADES"]))

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
       private.Debug("No next Valorstones upgrade cost could be found for", itemLink);
    end
end

--- Checks for valid bonus IDs and chains call to HandleValorstones if found
---@diagnostic disable: unused-local
---@param tooltip GameTooltip
---@param itemId integer
---@param itemLink string
---@param currentUpgrade integer
---@param maxUpgrade integer
---@param bonusIds table<integer, integer>
---@return boolean
local function CheckValorstoneBonusIDs(tooltip, itemId, itemLink, currentUpgrade, maxUpgrade, bonusIds)
    if private.DB.profile.DisabledIntegrations.Valorstones then
       private.Debug("Valorstones integration is disabled");

       return false
    end

    for i = 1, #bonusIds do
       private.Debug("Checking Valorstone bonus IDs for", bonusIds[i]);

       ---@type ItemBonusInfo?
       local bonusInfo = itemBonusIds[bonusIds[i]]
       if bonusInfo ~= nil then
          private.Debug(bonusIds[i], "matched a Valorstone bonus ID");

          local equipLoc = select(9, C_Item.GetItemInfo(itemLink))
          private.Debug(itemLink, "has equipLoc", equipLoc);

          local inventoryTypeSlotMask = inventoryTypeSlotMasks[equipLoc]
          if not inventoryTypeSlotMask then
             private.Debug(equipLoc, "was not found in the Valorstones inventory slot mask table");
             return false
          end

          local inventoryTypeSlotMaskOverride = inventoryTypeSlotMaskOverrides[equipLoc];
          if inventoryTypeSlotMaskOverride then
             local stats = C_Item.GetItemStats(itemLink)
             if not stats then
                private.Debug("Could not extract Valorstones item stats from", itemLink);
                return false
             end
             local hasInt = (stats["ITEM_MOD_INTELLECT_SHORT"] and stats["ITEM_MOD_INTELLECT_SHORT"] > 0)
             if hasInt then
                private.Debug("Upgrade cost for has been overridden because the item has Intellect on it.");
                inventoryTypeSlotMask = inventoryTypeSlotMaskOverride
             end
          end

          if not bonusInfo.costs[inventoryTypeSlotMask] then
             private.Debug(inventoryTypeSlotMask, "was not found in the Valorstones item extended cost lookup table");
             return false
          end

          HandleValorstones(tooltip, inventoryTypeSlotMask, i, bonusInfo, itemLink)
          return true
       end
    end

    private.Debug(itemId, "did not match a Valorstones bonus ID");
    return false;
end

table.insert(private.upgradeHandlers, CheckValorstoneBonusIDs)
