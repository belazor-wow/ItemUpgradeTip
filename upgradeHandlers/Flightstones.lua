-- ----------------------------------------------------------------------------
-- AddOn Namespace
-- ----------------------------------------------------------------------------
local private = select(2, ...) ---@class PrivateNamespace
local L = private.L

-- Add currency information
private.currencyIds.Flightstones = 2245
private.currencyIndexes[private.currencyIds.Flightstones] = true

---@type { [number] : flightstoneBonusData }
local flightstoneBonusIds = {
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

---@type { [number] : flightstoneUpgradeData }
local flightstoneUpgradeData = {
    {
        id = "flightstones",
        name = L["Flightstones"],
        color = WHITE_FONT_COLOR,
        icon = 5172976,
        itemId = nil,
        fragment = nil,
        currencyId = private.currencyIds.Flightstones
    },

    {
        id = "whelpCrests",
        name = L["Whelpling's Crests"],
        color = UNCOMMON_GREEN_COLOR,
        icon = 5062634,
        itemId = 204193,
        fragment = {
            name = L["Whelpling's Crest Fragments"],
            itemId = 204075,
            icon = 5062636
        },
        currencyId = nil
    },

    {
        id = "drakeCrests",
        name = L["Drake's Crests"],
        color = RARE_BLUE_COLOR,
        icon = 5062613,
        itemId = 204195,
        fragment = {
            name = L["Drake's Crest Fragments"],
            itemId = 204076,
            icon = 5062624
        },
        currencyId = nil
    },

    {
        id = "wyrmCrests",
        name = L["Wyrm's Crests"],
        color = EPIC_PURPLE_COLOR,
        icon = 5062637,
        itemId = 204196,
        fragment = { 
            name = L["Wyrm's Crest Fragments"],
            itemId = 204077,
            icon = 5062642
        },
        currencyId = nil
    },

    {
        id = "aspectCrests",
        name = L["Aspect's Crests"],
        color = LEGENDARY_ORANGE_COLOR,
        icon = 5062582,
        itemId = 204194,
        fragment = { 
            name = L["Aspect's Crest Fragments"],
            itemId = 204078,
            icon = 5062612
        },
        currencyId = nil
    },
}

---@type { [string]: number }
local itemUpgradeIndexes = {
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

--- Parses the given upgrade costs to generate a table for use in tooltip
---@param upgradeCost table
local function ParseUpgradeCost(upgradeCost)
    local lines = {}

    for _, upgradeItem in ipairs(flightstoneUpgradeData) do
        if upgradeCost[upgradeItem.id] ~= nil and upgradeCost[upgradeItem.id] > 0 then
            local icon = upgradeItem.icon and CreateTextureMarkup(upgradeItem.icon, 64, 64, 0, 0, 0.1, 0.9, 0.1, 0.9) or ""
            local costLine = ""
            local fragmentName, fragmentId, fragmentIcon = nil, nil, nil

            if upgradeItem.currencyId ~= nil then
                -- Check currency against cap
                local currencyInfo = private.currencyInfo[upgradeItem.currencyId]
                if currencyInfo == nil then
                    costLine = WHITE_FONT_COLOR:WrapTextInColorCode(BreakUpLargeNumbers(upgradeCost[upgradeItem.id]))
                else
                    local itemCount = currencyInfo.quantity;
                    local requiredColor = itemCount >= upgradeCost[upgradeItem.id] and GREEN_FONT_COLOR or ERROR_COLOR;
                    local heldColor = (currencyInfo.maxQuantity and currencyInfo.quantity == currencyInfo.maxQuantity) and ERROR_COLOR or WHITE_FONT_COLOR

                    costLine = requiredColor:WrapTextInColorCode(BreakUpLargeNumbers(upgradeCost[upgradeItem.id])) .. " / " .. heldColor:WrapTextInColorCode(BreakUpLargeNumbers(currencyInfo.quantity))
                end
            elseif upgradeItem.itemId ~= nil then
                -- Get item count and compare to required
                -- Means we can also have matching fragments
                local itemCount = GetItemCount(upgradeItem.itemId, true);
                local color = itemCount >= upgradeCost[upgradeItem.id] and GREEN_FONT_COLOR or ERROR_COLOR;

                costLine = color:WrapTextInColorCode(BreakUpLargeNumbers(upgradeCost[upgradeItem.id])) .. " / " .. WHITE_FONT_COLOR:WrapTextInColorCode(BreakUpLargeNumbers(itemCount))

                fragmentName = upgradeItem.fragment and upgradeItem.fragment.name or nil
                fragmentId = upgradeItem.fragment and upgradeItem.fragment.itemId or nil
                fragmentIcon = upgradeItem.fragment and upgradeItem.fragment.icon or nil
            else
                costLine = WHITE_FONT_COLOR:WrapTextInColorCode(BreakUpLargeNumbers(upgradeCost[upgradeItem.id]))
            end

            table.insert(lines, {
                left = icon .. " " .. upgradeItem.color:WrapTextInColorCode(upgradeItem.name),
                right = costLine,
                color = upgradeItem.color,
                fragmentData = {name = fragmentName, itemId = fragmentId, icon = fragmentIcon}
            })
        end
    end

    return lines;
end

--- Updates the tooltip when a Flightstone item is the item in question
---@param tooltip GameTooltip
---@param itemGroup number
---@param bonusId number
---@param bonusInfo flightstoneBonusData
---@param itemLink string
local function HandleFlightstones(tooltip, itemGroup, bonusId, bonusInfo, itemLink)
    if not bonusId or not bonusInfo then
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

    ---@type flightstoneUpgradeCostData?
    local nextUpgradeCost = nil

    ---@type flightstoneBonusData?
    local nextUpgrade = nil

    ---@type flightstoneBonusData?
    local maxUpgrade = nil

    ---@type flightstoneUpgradeCostData
    local totalUpgradeCosts = {
        whelpCrests = 0,
        drakeCrests = 0,
        wyrmCrests = 0,
        aspectCrests = 0,
        flightstones = 0,
    }

    for _, upgradeInfo in pairs(flightstoneBonusIds) do
        if upgradeInfo.rank == bonusInfo.rank and upgradeInfo.upgradeLevel > bonusInfo.upgradeLevel then
            local isCharacterDiscounted = upgradeInfo.itemLevel <= characterHighWatermark
            local isAccountDiscounted = upgradeInfo.itemLevel <= accountHighWatermark

            local whelpCrests = upgradeInfo.whelpCrestCost * (isCharacterDiscounted and 0 or 1)
            local drakeCrests = upgradeInfo.drakeCrestCost * (isCharacterDiscounted and 0 or 1)
            local wyrmCrests = upgradeInfo.wyrmCrestCost * (isCharacterDiscounted and 0 or 1)
            local aspectCrests = upgradeInfo.aspectCrestCost * (isCharacterDiscounted and 0 or 1)
            local flightstones = Round(upgradeInfo.flightstoneCosts[itemGroup] * (isAccountDiscounted and 0.5 or 1))

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

    if nextUpgradeCost and nextUpgrade then
        local nextLevelLines = ParseUpgradeCost(nextUpgradeCost)
        local totalLines = ParseUpgradeCost(totalUpgradeCosts)

        if #nextLevelLines > 0 or #totalLines > 0 then
            tooltip:AddLine("\n")
            tooltip:AddLine("\n")
            tooltip:AddLine(ARTIFACT_GOLD_COLOR:WrapTextInColorCode(L["Flightstone / Crest Upgrades"]))

            if nextLevelLines then
                tooltip:AddLine(HEIRLOOM_BLUE_COLOR:WrapTextInColorCode(L["Cost for next level:"] .. " (" .. nextUpgrade.itemLevel .. ")"))

                for _, newLine in pairs(nextLevelLines) do
                    tooltip:AddDoubleLine(newLine.left, newLine.right)
                end
            end

            if totalLines and maxUpgrade then
                if nextLevelLines then
                    tooltip:AddLine("\n")
                end

                tooltip:AddLine(HEIRLOOM_BLUE_COLOR:WrapTextInColorCode(L["Cost to upgrade to max level:"] .. " (" .. maxUpgrade.itemLevel .. ")"))

                for _, newLine in pairs(totalLines) do
                    tooltip:AddDoubleLine(newLine.left, newLine.right)
                end
            end
        end

        -- Fragment data collection: use the 'totalLines' because that have all needed crest in it
        local emptyLineAdded = false
        for _, data in ipairs(totalLines) do
            if data.fragmentData and data.fragmentData.name then
                local itemCount = GetItemCount(data.fragmentData.itemId, true)
                if itemCount and itemCount >= 15 then
                    if not emptyLineAdded then
                        tooltip:AddLine("\n")
                        emptyLineAdded = true
                    end
                    tooltip:AddDoubleLine(
                        (CreateTextureMarkup(data.fragmentData.icon, 64, 64, 0, 0, 0.1, 0.9, 0.1, 0.9) or "") .. " " .. data.color:WrapTextInColorCode(data.fragmentData.name),
                        WHITE_FONT_COLOR:WrapTextInColorCode(BreakUpLargeNumbers(itemCount))
                    )
                end
            end
        end
    end
end

--- Checks for valid bonus IDs and chains call to HandleFlightstones if found
---@diagnostic disable: unused-local
---@param tooltip GameTooltip
---@param itemId number
---@param itemLink string
---@param currentUpgrade number
---@param maxUpgrade number
---@param bonusIds table<number, number>
---@return boolean
local function CheckFlightstoneBonusIDs(tooltip, itemId, itemLink, currentUpgrade, maxUpgrade, bonusIds)
    local equipLoc = select(9, GetItemInfo(itemLink))

    local itemGroup = itemUpgradeIndexes[equipLoc]
    if not itemGroup then
        return false
    end

    if itemGroup == 4 then
        local stats = GetItemStats(itemLink)
        if not stats then
            return false
        end
        local hasInt = (stats["ITEM_MOD_INTELLECT_SHORT"] and stats["ITEM_MOD_INTELLECT_SHORT"] > 0)
        if hasInt then
            itemGroup = 5
        end
    end

    for i = 1, #bonusIds do
        ---@type flightstoneBonusData?
        local bonusInfo = flightstoneBonusIds[bonusIds[i]]
        if bonusInfo ~= nil then
            HandleFlightstones(tooltip, itemGroup, i, bonusInfo, itemLink)
            return true
        end
    end

    return false
end

table.insert(private.upgradeHandlers, CheckFlightstoneBonusIDs)
