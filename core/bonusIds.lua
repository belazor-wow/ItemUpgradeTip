local _, ItemUpgradeTip = ...
local L = ItemUpgradeTip.L

ItemUpgradeTip.currencyIndexes = {
    [1813] = true,
    [1792] = true,
    [2245] = true
}

ItemUpgradeTip.currencyIds = {
    Anima = 1813,
    Honor = 1792,
    Flightstones = 2245
}

ItemUpgradeTip.flightstoneUpgradeItems = {
    whelpCrests = { name = L["Whelpling's Crests"], color = UNCOMMON_GREEN_COLOR, icon = 5062634 },
    drakeCrests = { name = L["Drake's Crests"], color = RARE_BLUE_COLOR, icon = 5062613 },
    wyrmCrests = { name = L["Wyrm's Crests"], color = EPIC_PURPLE_COLOR, icon = 5062637 },
    aspectCrests = { name = L["Aspect's Crests"], color = LEGENDARY_ORANGE_COLOR, icon = 5062582 },
    flightstones = { name = L["Flightstones"], color = WHITE_FONT_COLOR, icon = 5172976 },
}

ItemUpgradeTip.itemUpgradeIndexes = {
    ["INVTYPE_WEAPONOFFHAND"] = 1,
    ["INVTYPE_SHIELD"] = 1,
    ["INVTYPE_FINGER"] = 1,
    ["INVTYPE_CLOAK"] = 1,
    ["INVTYPE_WRIST"] = 1,
    ["INVTYPE_NECK"] = 1,
    ["INVTYPE_HOLDABLE"] = 1,
    ["INVTYPE_SHOULDER"] = 2,
    ["INVTYPE_HAND"] = 2,
    ["INVTYPE_TRINKET"] = 2,
    ["INVTYPE_FEET"] = 2,
    ["INVTYPE_WAIST"] = 2,
    ["INVTYPE_HEAD"] = 3,
    ["INVTYPE_CHEST"] = 3,
    ["INVTYPE_ROBE"] = 3,
    ["INVTYPE_LEGS"] = 3,
    ["INVTYPE_WEAPONMAINHAND"] = 4,
    ["INVTYPE_RANGEDRIGHT"] = 5,
    ["INVTYPE_WEAPON"] = 4,
    ["INVTYPE_2HWEAPON"] = 6,
}

ItemUpgradeTip.honorUpgradeIndexes = {
    [201093] = 9,
    [201094] = 9,
    [201095] = 9,
    [201096] = 9,
    [201097] = 9,
    [201098] = 8,
    [201099] = 8,
    [201100] = 8,
    [201101] = 8,
    [201102] = 8,
    [201103] = 8,
    [201104] = 8,
    [201105] = 8,
    [201106] = 9,
    [201107] = 9,
    [201108] = 9,
    [201109] = 9,
    [201110] = 9,
    [201111] = 9,
    [201112] = 9,
    [201113] = 8,
    [201114] = 8,
    [201115] = 8,
    [201116] = 8,
    [201117] = 8,
    [201118] = 8,
    [201119] = 8,
    [201120] = 8,
    [201121] = 7,
    [201122] = 7,
    [201123] = 7,
    [201124] = 7,
    [201125] = 9,
    [201126] = 9,
    [201127] = 9,
    [201128] = 9,
    [201129] = 9,
    [201130] = 8,
    [201132] = 8,
    [201133] = 8,
    [201135] = 8,
    [201136] = 8,
    [201137] = 8,
    [201138] = 8,
    [201139] = 9,
    [201140] = 9,
    [201141] = 9,
    [201142] = 9,
    [201143] = 9,
    [201144] = 9,
    [201145] = 9,
    [201146] = 8,
    [201147] = 8,
    [201148] = 8,
    [201149] = 8,
    [201150] = 8,
    [201151] = 8,
    [201152] = 8,
    [201153] = 8,
    [201154] = 7,
    [201155] = 7,
    [201156] = 7,
    [201157] = 7,
    [201449] = 8,
    [201450] = 6,
    [201451] = 6,
    [201452] = 6,
    [201453] = 6,
    [201744] = 7,
    [201745] = 7,
    [201746] = 7,
    [201747] = 7,
    [201748] = 7,
    [201749] = 7,
    [201750] = 7,
    [201751] = 7,
    [201752] = 7,
    [201753] = 7,
    [201762] = 9,
    [201760] = 9,
    [201764] = 11,
    [201765] = 11,
    [201768] = 10,
    [201769] = 6,
    [201770] = 9,
    [201771] = 11,
    [201772] = 11,
    [201774] = 9,
    [201963] = 9,
    [201964] = 11,
}

-- TODO
ItemUpgradeTip.conquestUpgradeIndexes = {}

ItemUpgradeTip.animaUpgradeIndex = 18

--[[
    Flightstone cost data taken from https://wago.io/upgradehelper
]]
ItemUpgradeTip.flightstoneBonusIds = {
    -- Explorer 1/8
    [9294] = { itemLevel = 376, rank = 1, upgradeLevel = 1, maxUpgradeLevel = 8, whelpCrestCost = 0, drakeCrestCost = 0, wyrmCrestCost = 0, aspectCrestCost = 0,
        flightstoneCosts = {
            25, -- Off-Hands, Shields, Rings, Cloaks, Bracers, Necks
            40, -- Shoulders, Gloves, Trinkets, Boots, Belts
            50, -- Helms, Chests, Legs
            50, -- 1H Agility/Strength Weapon
            75, -- 1H Intellect Weapon
            100 -- 2H Weapon
        }
    },

    -- Explorer 2/8
    [9295] = { itemLevel = 379, rank = 1, upgradeLevel = 2, maxUpgradeLevel = 8, whelpCrestCost = 0, drakeCrestCost = 0, wyrmCrestCost = 0, aspectCrestCost = 0,
        flightstoneCosts = {
            25, -- Off-Hands, Shields, Rings, Cloaks, Bracers, Necks
            40, -- Shoulders, Gloves, Trinkets, Boots, Belts
            50, -- Helms, Chests, Legs
            50, -- 1H Agility/Strength Weapon
            75, -- 1H Intellect Weapon
            100 -- 2H Weapon
        }
    },

    -- Explorer 3/8
    [9296] = { itemLevel = 382, rank = 1, upgradeLevel = 3, maxUpgradeLevel = 8, whelpCrestCost = 0, drakeCrestCost = 0, wyrmCrestCost = 0, aspectCrestCost = 0,
        flightstoneCosts = {
            25, -- Off-Hands, Shields, Rings, Cloaks, Bracers, Necks
            40, -- Shoulders, Gloves, Trinkets, Boots, Belts
            50, -- Helms, Chests, Legs
            50, -- 1H Agility/Strength Weapon
            75, -- 1H Intellect Weapon
            100 -- 2H Weapon
        }
    },

    -- Explorer 4/8
    [9297] = { itemLevel = 385, rank = 1, upgradeLevel = 4, maxUpgradeLevel = 8, whelpCrestCost = 0, drakeCrestCost = 0, wyrmCrestCost = 0, aspectCrestCost = 0,
        flightstoneCosts = {
            25, -- Off-Hands, Shields, Rings, Cloaks, Bracers, Necks
            40, -- Shoulders, Gloves, Trinkets, Boots, Belts
            50, -- Helms, Chests, Legs
            50, -- 1H Agility/Strength Weapon
            75, -- 1H Intellect Weapon
            100 -- 2H Weapon
        }
    },

    -- Explorer 5/8
    [9298] = { itemLevel = 389, rank = 1, upgradeLevel = 5, maxUpgradeLevel = 8, whelpCrestCost = 0, drakeCrestCost = 0, wyrmCrestCost = 0, aspectCrestCost = 0,
        flightstoneCosts = {
            40, -- Off-Hands, Shields, Rings, Cloaks, Bracers, Necks
            66, -- Shoulders, Gloves, Trinkets, Boots, Belts
            75, -- Helms, Chests, Legs
            80, -- 1H Agility/Strength Weapon
            120, -- 1H Intellect Weapon
            160 -- 2H Weapon
        }
    },

    -- Explorer 6/8
    [9299] = { itemLevel = 392, rank = 1, upgradeLevel = 6, maxUpgradeLevel = 8, whelpCrestCost = 0, drakeCrestCost = 0, wyrmCrestCost = 0, aspectCrestCost = 0,
        flightstoneCosts = {
            40, -- Off-Hands, Shields, Rings, Cloaks, Bracers, Necks
            66, -- Shoulders, Gloves, Trinkets, Boots, Belts
            75, -- Helms, Chests, Legs
            80, -- 1H Agility/Strength Weapon
            120, -- 1H Intellect Weapon
            160 -- 2H Weapon
        }
    },

    -- Explorer 7/8
    [9300] = { itemLevel = 395, rank = 1, upgradeLevel = 7, maxUpgradeLevel = 8, whelpCrestCost = 0, drakeCrestCost = 0, wyrmCrestCost = 0, aspectCrestCost = 0,
        flightstoneCosts = {
            40, -- Off-Hands, Shields, Rings, Cloaks, Bracers, Necks
            66, -- Shoulders, Gloves, Trinkets, Boots, Belts
            75, -- Helms, Chests, Legs
            80, -- 1H Agility/Strength Weapon
            120, -- 1H Intellect Weapon
            160 -- 2H Weapon
        }
    },

    -- Explorer 8/8
    [9301] = { itemLevel = 398, rank = 1, upgradeLevel = 8, maxUpgradeLevel = 8, whelpCrestCost = 0, drakeCrestCost = 0, wyrmCrestCost = 0, aspectCrestCost = 0,
        flightstoneCosts = {
            40, -- Off-Hands, Shields, Rings, Cloaks, Bracers, Necks
            66, -- Shoulders, Gloves, Trinkets, Boots, Belts
            75, -- Helms, Chests, Legs
            80, -- 1H Agility/Strength Weapon
            120, -- 1H Intellect Weapon
            160 -- 2H Weapon
        }
    }, 

    -- Adventurer 1/8
    [9302] = { itemLevel = 389, rank = 2, upgradeLevel = 1, maxUpgradeLevel = 8, whelpCrestCost = 0, drakeCrestCost = 0, wyrmCrestCost = 0, aspectCrestCost = 0,
        flightstoneCosts = {
            40, -- Off-Hands, Shields, Rings, Cloaks, Bracers, Necks
            66, -- Shoulders, Gloves, Trinkets, Boots, Belts
            75, -- Helms, Chests, Legs
            80, -- 1H Agility/Strength Weapon
            120, -- 1H Intellect Weapon
            160 -- 2H Weapon
        }
    },

    -- Adventurer 2/8
    [9303] = { itemLevel = 392, rank = 2, upgradeLevel = 2, maxUpgradeLevel = 8, whelpCrestCost = 0, drakeCrestCost = 0, wyrmCrestCost = 0, aspectCrestCost = 0,
        flightstoneCosts = {
            40, -- Off-Hands, Shields, Rings, Cloaks, Bracers, Necks
            66, -- Shoulders, Gloves, Trinkets, Boots, Belts
            75, -- Helms, Chests, Legs
            80, -- 1H Agility/Strength Weapon
            120, -- 1H Intellect Weapon
            160 -- 2H Weapon
        }
    },

    -- Adventurer 3/8
    [9304] = { itemLevel = 395, rank = 2, upgradeLevel = 3, maxUpgradeLevel = 8, whelpCrestCost = 0, drakeCrestCost = 0, wyrmCrestCost = 0, aspectCrestCost = 0,
        flightstoneCosts = {
            40, -- Off-Hands, Shields, Rings, Cloaks, Bracers, Necks
            66, -- Shoulders, Gloves, Trinkets, Boots, Belts
            75, -- Helms, Chests, Legs
            80, -- 1H Agility/Strength Weapon
            120, -- 1H Intellect Weapon
            160 -- 2H Weapon
        }
    },

    -- Adventurer 4/8
    [9305] = { itemLevel = 398, rank = 2, upgradeLevel = 4, maxUpgradeLevel = 8, whelpCrestCost = 0, drakeCrestCost = 0, wyrmCrestCost = 0, aspectCrestCost = 0,
        flightstoneCosts = {
            40, -- Off-Hands, Shields, Rings, Cloaks, Bracers, Necks
            66, -- Shoulders, Gloves, Trinkets, Boots, Belts
            75, -- Helms, Chests, Legs
            80, -- 1H Agility/Strength Weapon
            120, -- 1H Intellect Weapon
            160 -- 2H Weapon
        }
    },

    -- Adventurer 5/8
    [9306] = { itemLevel = 402, rank = 2, upgradeLevel = 5, maxUpgradeLevel = 8, whelpCrestCost = 1, drakeCrestCost = 0, wyrmCrestCost = 0, aspectCrestCost = 0,
        flightstoneCosts = {
            66, -- Off-Hands, Shields, Rings, Cloaks, Bracers, Necks
            100, -- Shoulders, Gloves, Trinkets, Boots, Belts
            120, -- Helms, Chests, Legs
            125, -- 1H Agility/Strength Weapon
            200, -- 1H Intellect Weapon
            250 -- 2H Weapon
        }
    },

    -- Adventurer 6/8
    [9307] = { itemLevel = 405, rank = 2, upgradeLevel = 6, maxUpgradeLevel = 8, whelpCrestCost = 1, drakeCrestCost = 0, wyrmCrestCost = 0, aspectCrestCost = 0,
        flightstoneCosts = {
            66, -- Off-Hands, Shields, Rings, Cloaks, Bracers, Necks
            100, -- Shoulders, Gloves, Trinkets, Boots, Belts
            120, -- Helms, Chests, Legs
            125, -- 1H Agility/Strength Weapon
            200, -- 1H Intellect Weapon
            250 -- 2H Weapon
        }
    },

    -- Adventurer 7/8
    [9308] = { itemLevel = 408, rank = 2, upgradeLevel = 7, maxUpgradeLevel = 8, whelpCrestCost = 1, drakeCrestCost = 0, wyrmCrestCost = 0, aspectCrestCost = 0,
        flightstoneCosts = {
            66, -- Off-Hands, Shields, Rings, Cloaks, Bracers, Necks
            100, -- Shoulders, Gloves, Trinkets, Boots, Belts
            120, -- Helms, Chests, Legs
            125, -- 1H Agility/Strength Weapon
            200, -- 1H Intellect Weapon
            250 -- 2H Weapon
        }
    },

    -- Adventurer 8/8
    [9309] = { itemLevel = 411, rank = 2, upgradeLevel = 8, maxUpgradeLevel = 8, whelpCrestCost = 1, drakeCrestCost = 0, wyrmCrestCost = 0, aspectCrestCost = 0,
        flightstoneCosts = {
            66, -- Off-Hands, Shields, Rings, Cloaks, Bracers, Necks
            100, -- Shoulders, Gloves, Trinkets, Boots, Belts
            120, -- Helms, Chests, Legs
            125, -- 1H Agility/Strength Weapon
            200, -- 1H Intellect Weapon
            250 -- 2H Weapon
        }
    },

    -- Veteran 1/8
    [9313] = { itemLevel = 402, rank = 3, upgradeLevel = 1, maxUpgradeLevel = 8, whelpCrestCost = 1, drakeCrestCost = 0, wyrmCrestCost = 0, aspectCrestCost = 0,
        flightstoneCosts = {
            66, -- Off-Hands, Shields, Rings, Cloaks, Bracers, Necks
            100, -- Shoulders, Gloves, Trinkets, Boots, Belts
            120, -- Helms, Chests, Legs
            125, -- 1H Agility/Strength Weapon
            200, -- 1H Intellect Weapon
            250 -- 2H Weapon
        }
    },

    -- Veteran 2/8
    [9314] = { itemLevel = 405, rank = 3, upgradeLevel = 2, maxUpgradeLevel = 8, whelpCrestCost = 1, drakeCrestCost = 0, wyrmCrestCost = 0, aspectCrestCost = 0,
        flightstoneCosts = {
            66, -- Off-Hands, Shields, Rings, Cloaks, Bracers, Necks
            100, -- Shoulders, Gloves, Trinkets, Boots, Belts
            120, -- Helms, Chests, Legs
            125, -- 1H Agility/Strength Weapon
            200, -- 1H Intellect Weapon
            250 -- 2H Weapon
        }
    },

    -- Veteran 3/8
    [9315] = { itemLevel = 408, rank = 3, upgradeLevel = 3, maxUpgradeLevel = 8, whelpCrestCost = 1, drakeCrestCost = 0, wyrmCrestCost = 0, aspectCrestCost = 0,
        flightstoneCosts = {
            66, -- Off-Hands, Shields, Rings, Cloaks, Bracers, Necks
            100, -- Shoulders, Gloves, Trinkets, Boots, Belts
            120, -- Helms, Chests, Legs
            125, -- 1H Agility/Strength Weapon
            200, -- 1H Intellect Weapon
            250 -- 2H Weapon
        }
    },

    -- Veteran 4/8
    [9316] = { itemLevel = 411, rank = 3, upgradeLevel = 4, maxUpgradeLevel = 8, whelpCrestCost = 1, drakeCrestCost = 0, wyrmCrestCost = 0, aspectCrestCost = 0,
        flightstoneCosts = {
            66, -- Off-Hands, Shields, Rings, Cloaks, Bracers, Necks
            100, -- Shoulders, Gloves, Trinkets, Boots, Belts
            120, -- Helms, Chests, Legs
            125, -- 1H Agility/Strength Weapon
            200, -- 1H Intellect Weapon
            250 -- 2H Weapon
        }
    },

    -- Veteran 5/8
    [9317] = { itemLevel = 415, rank = 3, upgradeLevel = 5, maxUpgradeLevel = 8, whelpCrestCost = 0, drakeCrestCost = 1, wyrmCrestCost = 0, aspectCrestCost = 0,
        flightstoneCosts = {
            75, -- Off-Hands, Shields, Rings, Cloaks, Bracers, Necks
            120, -- Shoulders, Gloves, Trinkets, Boots, Belts
            145, -- Helms, Chests, Legs
            150, -- 1H Agility/Strength Weapon
            225, -- 1H Intellect Weapon
            300 -- 2H Weapon
        }
    },

    -- Veteran 6/8
    [9318] = { itemLevel = 418, rank = 3, upgradeLevel = 6, maxUpgradeLevel = 8, whelpCrestCost = 0, drakeCrestCost = 1, wyrmCrestCost = 0, aspectCrestCost = 0,
        flightstoneCosts = {
            75, -- Off-Hands, Shields, Rings, Cloaks, Bracers, Necks
            120, -- Shoulders, Gloves, Trinkets, Boots, Belts
            145, -- Helms, Chests, Legs
            150, -- 1H Agility/Strength Weapon
            225, -- 1H Intellect Weapon
            300 -- 2H Weapon
        }
    },

    -- Veteran 7/8
    [9319] = { itemLevel = 421, rank = 3, upgradeLevel = 7, maxUpgradeLevel = 8, whelpCrestCost = 0, drakeCrestCost = 1, wyrmCrestCost = 0, aspectCrestCost = 0,
        flightstoneCosts = {
            75, -- Off-Hands, Shields, Rings, Cloaks, Bracers, Necks
            120, -- Shoulders, Gloves, Trinkets, Boots, Belts
            145, -- Helms, Chests, Legs
            150, -- 1H Agility/Strength Weapon
            225, -- 1H Intellect Weapon
            300 -- 2H Weapon
        }
    },

    -- Veteran 8/8
    [9320] = { itemLevel = 424, rank = 3, upgradeLevel = 8, maxUpgradeLevel = 8, whelpCrestCost = 0, drakeCrestCost = 1, wyrmCrestCost = 0, aspectCrestCost = 0,
        flightstoneCosts = {
            75, -- Off-Hands, Shields, Rings, Cloaks, Bracers, Necks
            120, -- Shoulders, Gloves, Trinkets, Boots, Belts
            145, -- Helms, Chests, Legs
            150, -- 1H Agility/Strength Weapon
            225, -- 1H Intellect Weapon
            300 -- 2H Weapon
        }
    },

    -- Champion 1/8
    [9321] = { itemLevel = 415, rank = 4, upgradeLevel = 1, maxUpgradeLevel = 8, whelpCrestCost = 0, drakeCrestCost = 1, wyrmCrestCost = 0, aspectCrestCost = 0,
        flightstoneCosts = {
            75, -- Off-Hands, Shields, Rings, Cloaks, Bracers, Necks
            120, -- Shoulders, Gloves, Trinkets, Boots, Belts
            145, -- Helms, Chests, Legs
            150, -- 1H Agility/Strength Weapon
            225, -- 1H Intellect Weapon
            300 -- 2H Weapon
        }
    },

    -- Champion 2/8
    [9322] = { itemLevel = 418, rank = 4, upgradeLevel = 2, maxUpgradeLevel = 8, whelpCrestCost = 0, drakeCrestCost = 1, wyrmCrestCost = 0, aspectCrestCost = 0,
        flightstoneCosts = {
            75, -- Off-Hands, Shields, Rings, Cloaks, Bracers, Necks
            120, -- Shoulders, Gloves, Trinkets, Boots, Belts
            145, -- Helms, Chests, Legs
            150, -- 1H Agility/Strength Weapon
            225, -- 1H Intellect Weapon
            300 -- 2H Weapon
        }
    },

    -- Champion 3/8
    [9323] = { itemLevel = 421, rank = 4, upgradeLevel = 3, maxUpgradeLevel = 8, whelpCrestCost = 0, drakeCrestCost = 1, wyrmCrestCost = 0, aspectCrestCost = 0,
        flightstoneCosts = {
            75, -- Off-Hands, Shields, Rings, Cloaks, Bracers, Necks
            120, -- Shoulders, Gloves, Trinkets, Boots, Belts
            145, -- Helms, Chests, Legs
            150, -- 1H Agility/Strength Weapon
            225, -- 1H Intellect Weapon
            300 -- 2H Weapon
        }
    },

    -- Champion 4/8
    [9324] = { itemLevel = 424, rank = 4, upgradeLevel = 4, maxUpgradeLevel = 8, whelpCrestCost = 0, drakeCrestCost = 1, wyrmCrestCost = 0, aspectCrestCost = 0,
        flightstoneCosts = {
            75, -- Off-Hands, Shields, Rings, Cloaks, Bracers, Necks
            120, -- Shoulders, Gloves, Trinkets, Boots, Belts
            145, -- Helms, Chests, Legs
            150, -- 1H Agility/Strength Weapon
            225, -- 1H Intellect Weapon
            300 -- 2H Weapon
        }
    },

    -- Champion 5/8
    [9325] = { itemLevel = 428, rank = 4, upgradeLevel = 5, maxUpgradeLevel = 8, whelpCrestCost = 0, drakeCrestCost = 0, wyrmCrestCost = 1, aspectCrestCost = 0,
        flightstoneCosts = {
            90, -- Off-Hands, Shields, Rings, Cloaks, Bracers, Necks
            140, -- Shoulders, Gloves, Trinkets, Boots, Belts
            170, -- Helms, Chests, Legs
            175, -- 1H Agility/Strength Weapon
            275, -- 1H Intellect Weapon
            350 -- 2H Weapon
        }
    },

    -- Champion 6/8
    [9327] = { itemLevel = 431, rank = 4, upgradeLevel = 6, maxUpgradeLevel = 8, whelpCrestCost = 0, drakeCrestCost = 0, wyrmCrestCost = 1, aspectCrestCost = 0,
        flightstoneCosts = {
            90, -- Off-Hands, Shields, Rings, Cloaks, Bracers, Necks
            140, -- Shoulders, Gloves, Trinkets, Boots, Belts
            170, -- Helms, Chests, Legs
            175, -- 1H Agility/Strength Weapon
            275, -- 1H Intellect Weapon
            350 -- 2H Weapon
        }
    },

    -- Champion 7/8
    [9328] = { itemLevel = 434, rank = 4, upgradeLevel = 7, maxUpgradeLevel = 8, whelpCrestCost = 0, drakeCrestCost = 0, wyrmCrestCost = 1, aspectCrestCost = 0,
        flightstoneCosts = {
            90, -- Off-Hands, Shields, Rings, Cloaks, Bracers, Necks
            140, -- Shoulders, Gloves, Trinkets, Boots, Belts
            170, -- Helms, Chests, Legs
            175, -- 1H Agility/Strength Weapon
            275, -- 1H Intellect Weapon
            350 -- 2H Weapon
        }
    },

    -- Champion 8/8
    [9329] = { itemLevel = 437, rank = 4, upgradeLevel = 8, maxUpgradeLevel = 8, whelpCrestCost = 0, drakeCrestCost = 0, wyrmCrestCost = 1, aspectCrestCost = 0,
        flightstoneCosts = {
            90, -- Off-Hands, Shields, Rings, Cloaks, Bracers, Necks
            140, -- Shoulders, Gloves, Trinkets, Boots, Belts
            170, -- Helms, Chests, Legs
            175, -- 1H Agility/Strength Weapon
            275, -- 1H Intellect Weapon
            350 -- 2H Weapon
        }
    },

    -- Hero 1/5
    [9330] = { itemLevel = 428, rank = 5, upgradeLevel = 1, maxUpgradeLevel = 5, whelpCrestCost = 0, drakeCrestCost = 0, wyrmCrestCost = 1, aspectCrestCost = 0,
        flightstoneCosts = {
            90, -- Off-Hands, Shields, Rings, Cloaks, Bracers, Necks
            140, -- Shoulders, Gloves, Trinkets, Boots, Belts
            170, -- Helms, Chests, Legs
            175, -- 1H Agility/Strength Weapon
            275, -- 1H Intellect Weapon
            350 -- 2H Weapon
        }
    },

    -- Hero 2/5
    [9331] = { itemLevel = 431, rank = 5, upgradeLevel = 2, maxUpgradeLevel = 5, whelpCrestCost = 0, drakeCrestCost = 0, wyrmCrestCost = 1, aspectCrestCost = 0,
        flightstoneCosts = {
            90, -- Off-Hands, Shields, Rings, Cloaks, Bracers, Necks
            140, -- Shoulders, Gloves, Trinkets, Boots, Belts
            170, -- Helms, Chests, Legs
            175, -- 1H Agility/Strength Weapon
            275, -- 1H Intellect Weapon
            350 -- 2H Weapon
        }
    },

    -- Hero 3/5
    [9332] = { itemLevel = 434, rank = 5, upgradeLevel = 3, maxUpgradeLevel = 5, whelpCrestCost = 0, drakeCrestCost = 0, wyrmCrestCost = 1, aspectCrestCost = 0,
        flightstoneCosts = {
            90, -- Off-Hands, Shields, Rings, Cloaks, Bracers, Necks
            140, -- Shoulders, Gloves, Trinkets, Boots, Belts
            170, -- Helms, Chests, Legs
            175, -- 1H Agility/Strength Weapon
            275, -- 1H Intellect Weapon
            350 -- 2H Weapon
        }
    },

    -- Hero 4/5
    [9333] = { itemLevel = 437, rank = 5, upgradeLevel = 4, maxUpgradeLevel = 5, whelpCrestCost = 0, drakeCrestCost = 0, wyrmCrestCost = 1, aspectCrestCost = 0,
        flightstoneCosts = {
            90, -- Off-Hands, Shields, Rings, Cloaks, Bracers, Necks
            140, -- Shoulders, Gloves, Trinkets, Boots, Belts
            170, -- Helms, Chests, Legs
            175, -- 1H Agility/Strength Weapon
            275, -- 1H Intellect Weapon
            350 -- 2H Weapon
        }
    },

    -- Hero 5/5
    [9334] = { itemLevel = 441, rank = 5, upgradeLevel = 5, maxUpgradeLevel = 5, whelpCrestCost = 0, drakeCrestCost = 0, wyrmCrestCost = 0, aspectCrestCost = 1,
        flightstoneCosts = {
            100, -- Off-Hands, Shields, Rings, Cloaks, Bracers, Necks
            160, -- Shoulders, Gloves, Trinkets, Boots, Belts
            190, -- Helms, Chests, Legs
            200, -- 1H Agility/Strength Weapon
            300, -- 1H Intellect Weapon
            400 -- 2H Weapon
        }
    }
}

ItemUpgradeTip.bonusIds = {

    --[[ Honor ]]

    -- Off-Hands
    [6] = {
        [8985] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 250, toMax = 1625},
        [8986] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 300, toMax = 1375},
        [8987] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 500, toMax = 1125},
        [8988] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 625, toMax = 625},
        [8989] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 625, toMax = 0},
    },

    -- Gladiator Trinkets, Wrists, Cloaks, Rings, Necks
    [7] = {
        [8985] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 300, toMax = 2025},
        [8986] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 375, toMax = 1725},
        [8987] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 600, toMax = 1350},
        [8988] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 750, toMax = 750},
        [8989] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 750, toMax = 0},
    },

    -- Damage Trinkets, Boots, Gloves, Shoulder, Belt
    [8] = {
        [8985] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 400,  toMax = 2700},
        [8986] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 500,  toMax = 2300},
        [8987] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 800,  toMax = 1800},
        [8988] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 1000, toMax = 1000},
        [8989] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 1000, toMax = 0},
    },

    -- Melee One Handed Weapons, Shields, Chest, Helms, Legs
    [9] = {
        [8985] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 500,  toMax = 3375},
        [8986] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 625,  toMax = 2875},
        [8987] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 1000, toMax = 2250},
        [8988] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 1250, toMax = 1250},
        [8989] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 1250, toMax = 0},
    },

    -- Intellect One-Handed Weapons
    [10] = {
        [8985] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 750,  toMax = 5075},
        [8986] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 950,  toMax = 4325},
        [8987] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 1500, toMax = 3375},
        [8988] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 1875, toMax = 1875},
        [8989] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 1875, toMax = 0},
    },

    -- Two-Handed Weapons
    [11] = {
        [8985] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 1000, toMax = 7750},
        [8986] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 1250, toMax = 6750},
        [8987] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 2000, toMax = 5500},
        [8988] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 2500, toMax = 2500},
        [8989] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 2500, toMax = 0},
    },



    --[[ Conquest ]]

    -- Off-Hands
    [12] = {
        [8985] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8986] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8987] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8988] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8989] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
    },

    -- Gladiator Trinkets, Wrists, Cloaks, Rings, Necks
    [13] = {
        [8985] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8986] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8987] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8988] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8989] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
    },

    -- Damage Trinkets, Boots, Gloves, Shoulder, Belt
    [14] = {
        [8985] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8986] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8987] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8988] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8989] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
    },

    -- Melee One Handed Weapons, Shields, Chest, Helms, Legs
    [15] = {
        [8985] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8986] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8987] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8988] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8989] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
    },

    -- Intellect One-Handed Weapons
    [16] = {
        [8985] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8986] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8987] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8988] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8989] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
    },

    -- Two-Handed Weapons
    [17] = {
        [8985] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8986] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8987] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8988] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8989] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
    },



    --[[ Anima ]]

    [18] = {
        [7195] = {currencyId = ItemUpgradeTip.currencyIds.Anima, amount = 50,  toMax = 1050},
        [7196] = {currencyId = ItemUpgradeTip.currencyIds.Anima, amount = 100, toMax = 1000},
        [7197] = {currencyId = ItemUpgradeTip.currencyIds.Anima, amount = 150, toMax = 900},
        [7198] = {currencyId = ItemUpgradeTip.currencyIds.Anima, amount = 200, toMax = 750},
        [7199] = {currencyId = ItemUpgradeTip.currencyIds.Anima, amount = 250, toMax = 550},
        [7200] = {currencyId = ItemUpgradeTip.currencyIds.Anima, amount = 300, toMax = 300},
        [7201] = {currencyId = ItemUpgradeTip.currencyIds.Anima, amount = 0,   toMax = 0},
    }
}