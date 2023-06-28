-- ----------------------------------------------------------------------------
-- AddOn Namespace
-- ----------------------------------------------------------------------------
local AddOnFolderName = ... ---@type string
local private = select(2, ...) ---@class PrivateNamespace

---@type Localizations
local L = LibStub("AceLocale-3.0"):GetLocale(AddOnFolderName)

-- Add currency information
private.currencyIds.Flightstones = 2245
private.currencyIndexes[private.currencyIds.Flightstones] = true

-- Add preferences
private.Preferences.DefaultValues.profile.DisabledIntegrations.Flightstones = false;
private.Preferences.DisabledIntegrations.Flightstones = {
    type = "toggle",
    name = L["Flightstone / Crest Upgrades"],
    order = 110,
    width = "double",
}

---@type { [number]: flightstoneUpgradeCostData }
local itemExtendedCosts = {

    [7984] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 0, flightstones = 50},
    [7991] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 0, flightstones = 75},
    [7992] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 0, flightstones = 25},
    [7993] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 0, flightstones = 40},
    [7994] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 0, flightstones = 65},
    [7995] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 0, flightstones = 80},
    [7997] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 0, flightstones = 100},
    [7998] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 0, flightstones = 120},
    [8003] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 0, flightstones = 160},

    [8045] = {whelpCrests = 1, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 0, flightstones = 120},
    [8046] = {whelpCrests = 1, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 0, flightstones = 100},
    [8047] = {whelpCrests = 1, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 0, flightstones = 65},
    [8049] = {whelpCrests = 1, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 0, flightstones = 125},
    [8050] = {whelpCrests = 1, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 0, flightstones = 250},
    [8051] = {whelpCrests = 1, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 0, flightstones = 200},

    [8053] = {whelpCrests = 0, drakeCrests = 1, wyrmCrests = 0, aspectCrests = 0, flightstones = 145},
    [8054] = {whelpCrests = 0, drakeCrests = 1, wyrmCrests = 0, aspectCrests = 0, flightstones = 120},
    [8055] = {whelpCrests = 0, drakeCrests = 1, wyrmCrests = 0, aspectCrests = 0, flightstones = 75},
    [8056] = {whelpCrests = 0, drakeCrests = 1, wyrmCrests = 0, aspectCrests = 0, flightstones = 150},
    [8057] = {whelpCrests = 0, drakeCrests = 1, wyrmCrests = 0, aspectCrests = 0, flightstones = 300},
    [8058] = {whelpCrests = 0, drakeCrests = 1, wyrmCrests = 0, aspectCrests = 0, flightstones = 225},

    [8059] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 1, aspectCrests = 0, flightstones = 170},
    [8060] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 1, aspectCrests = 0, flightstones = 140},
    [8061] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 1, aspectCrests = 0, flightstones = 90},
    [8062] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 1, aspectCrests = 0, flightstones = 175},
    [8063] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 1, aspectCrests = 0, flightstones = 350},
    [8064] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 1, aspectCrests = 0, flightstones = 275},

    [8065] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 1, flightstones = 190},
    [8066] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 1, flightstones = 160},
    [8067] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 1, flightstones = 100},
    [8068] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 1, flightstones = 200},
    [8069] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 1, flightstones = 400},
    [8070] = {whelpCrests = 0, drakeCrests = 0, wyrmCrests = 0, aspectCrests = 1, flightstones = 300},
}

---@type { [string]: { [number]: flightstoneUpgradeCostData } }
local itemUpgradeCosts = {

    -- InventoryTypeSlotMask 1048738
    ["INVTYPE_HEAD"] = {
        [12] = itemExtendedCosts[7984],
        [13] = itemExtendedCosts[7991],
        [14] = itemExtendedCosts[8045],
        [15] = itemExtendedCosts[8053],
        [16] = itemExtendedCosts[8059],
        [17] = itemExtendedCosts[8065],
    },
    ["INVTYPE_CHEST"] = {
        [12] = itemExtendedCosts[7984],
        [13] = itemExtendedCosts[7991],
        [14] = itemExtendedCosts[8045],
        [15] = itemExtendedCosts[8053],
        [16] = itemExtendedCosts[8059],
        [17] = itemExtendedCosts[8065],
    },
    ["INVTYPE_LEGS"] = {
        [12] = itemExtendedCosts[7984],
        [13] = itemExtendedCosts[7991],
        [14] = itemExtendedCosts[8045],
        [15] = itemExtendedCosts[8053],
        [16] = itemExtendedCosts[8059],
        [17] = itemExtendedCosts[8065],
    },
    ["INVTYPE_ROBE"] = {
        [12] = itemExtendedCosts[7984],
        [13] = itemExtendedCosts[7991],
        [14] = itemExtendedCosts[8045],
        [15] = itemExtendedCosts[8053],
        [16] = itemExtendedCosts[8059],
        [17] = itemExtendedCosts[8065],
    },

    -- InventoryTypeSlotMask 5448
    ["INVTYPE_SHOULDER"] = {
        [12] = itemExtendedCosts[7993],
        [13] = itemExtendedCosts[7994],
        [14] = itemExtendedCosts[8046],
        [15] = itemExtendedCosts[8054],
        [16] = itemExtendedCosts[8060],
        [17] = itemExtendedCosts[8066],
    },
    ["INVTYPE_WAIST"] = {
        [12] = itemExtendedCosts[7993],
        [13] = itemExtendedCosts[7994],
        [14] = itemExtendedCosts[8046],
        [15] = itemExtendedCosts[8054],
        [16] = itemExtendedCosts[8060],
        [17] = itemExtendedCosts[8066],
    },
    ["INVTYPE_FEET"] = {
        [12] = itemExtendedCosts[7993],
        [13] = itemExtendedCosts[7994],
        [14] = itemExtendedCosts[8046],
        [15] = itemExtendedCosts[8054],
        [16] = itemExtendedCosts[8060],
        [17] = itemExtendedCosts[8066],
    },
    ["INVTYPE_HAND"] = {
        [12] = itemExtendedCosts[7993],
        [13] = itemExtendedCosts[7994],
        [14] = itemExtendedCosts[8046],
        [15] = itemExtendedCosts[8054],
        [16] = itemExtendedCosts[8060],
        [17] = itemExtendedCosts[8066],
    },
    ["INVTYPE_TRINKET"] = {
        [12] = itemExtendedCosts[7993],
        [13] = itemExtendedCosts[7994],
        [14] = itemExtendedCosts[8046],
        [15] = itemExtendedCosts[8054],
        [16] = itemExtendedCosts[8060],
        [17] = itemExtendedCosts[8066],
    },

    -- InventoryTypeSlotMask 68100
    ["INVTYPE_NECK"] = {
        [12] = itemExtendedCosts[7992],
        [13] = itemExtendedCosts[7993],
        [14] = itemExtendedCosts[8047],
        [15] = itemExtendedCosts[8055],
        [16] = itemExtendedCosts[8061],
        [17] = itemExtendedCosts[8067],
    },
    ["INVTYPE_WRIST"] = {
        [12] = itemExtendedCosts[7992],
        [13] = itemExtendedCosts[7993],
        [14] = itemExtendedCosts[8047],
        [15] = itemExtendedCosts[8055],
        [16] = itemExtendedCosts[8061],
        [17] = itemExtendedCosts[8067],
    },
    ["INVTYPE_FINGER"] = {
        [12] = itemExtendedCosts[7992],
        [13] = itemExtendedCosts[7993],
        [14] = itemExtendedCosts[8047],
        [15] = itemExtendedCosts[8055],
        [16] = itemExtendedCosts[8061],
        [17] = itemExtendedCosts[8067],
    },
    ["INVTYPE_CLOAK"] = {
        [12] = itemExtendedCosts[7992],
        [13] = itemExtendedCosts[7993],
        [14] = itemExtendedCosts[8047],
        [15] = itemExtendedCosts[8055],
        [16] = itemExtendedCosts[8061],
        [17] = itemExtendedCosts[8067],
    },

    -- InventoryTypeSlotMask 8404992
    ["INVTYPE_HOLDABLE"] = {
        [12] = itemExtendedCosts[7992],
        [13] = itemExtendedCosts[7993],
        [14] = itemExtendedCosts[8047],
        [15] = itemExtendedCosts[8055],
        [16] = itemExtendedCosts[8061],
        [17] = itemExtendedCosts[8067],
    },
    ["INVTYPE_SHIELD"] = {
        [12] = itemExtendedCosts[7992],
        [13] = itemExtendedCosts[7993],
        [14] = itemExtendedCosts[8047],
        [15] = itemExtendedCosts[8055],
        [16] = itemExtendedCosts[8061],
        [17] = itemExtendedCosts[8067],
    },

    -- InventoryTypeSlotMask 8192
    ["INVTYPE_WEAPON"] = {
        [12] = itemExtendedCosts[7984],
        [13] = itemExtendedCosts[7995],
        [14] = itemExtendedCosts[8049],
        [15] = itemExtendedCosts[8056],
        [16] = itemExtendedCosts[8062],
        [17] = itemExtendedCosts[8068],
    },

    -- InventoryTypeSlotMask 67272704
    ["INVTYPE_RANGED"] = {
        [12] = itemExtendedCosts[7997],
        [13] = itemExtendedCosts[8003],
        [14] = itemExtendedCosts[8050],
        [15] = itemExtendedCosts[8057],
        [16] = itemExtendedCosts[8063],
        [17] = itemExtendedCosts[8069],
    },
    ["INVTYPE_2HWEAPON"] = {
        [12] = itemExtendedCosts[7997],
        [13] = itemExtendedCosts[8003],
        [14] = itemExtendedCosts[8050],
        [15] = itemExtendedCosts[8057],
        [16] = itemExtendedCosts[8063],
        [17] = itemExtendedCosts[8069],
    },
    ["INVTYPE_RANGEDRIGHT"] = {
        [12] = itemExtendedCosts[7997],
        [13] = itemExtendedCosts[8003],
        [14] = itemExtendedCosts[8050],
        [15] = itemExtendedCosts[8057],
        [16] = itemExtendedCosts[8063],
        [17] = itemExtendedCosts[8069],
    },
}

-- Override costs for Intellect items
---@type { [string]: { [number]: flightstoneUpgradeCostData } }
local itemUpgradeCostOverrides = {
    -- InventoryTypeSlotMask 131072
    ["INVTYPE_2HWEAPON"] = {
        [12] = itemExtendedCosts[7997],
        [13] = itemExtendedCosts[8003],
        [14] = itemExtendedCosts[8050],
        [15] = itemExtendedCosts[8057],
        [16] = itemExtendedCosts[8063],
        [17] = itemExtendedCosts[8069],
    },

    -- InventoryTypeSlotMask 67117056
    ["INVTYPE_WEAPON"] = {
        [12] = itemExtendedCosts[7991],
        [13] = itemExtendedCosts[7998],
        [14] = itemExtendedCosts[8051],
        [15] = itemExtendedCosts[8058],
        [16] = itemExtendedCosts[8064],
        [17] = itemExtendedCosts[8070],
    },
    ["INVTYPE_RANGEDRIGHT"] = {
        [12] = itemExtendedCosts[7991],
        [13] = itemExtendedCosts[7998],
        [14] = itemExtendedCosts[8051],
        [15] = itemExtendedCosts[8058],
        [16] = itemExtendedCosts[8064],
        [17] = itemExtendedCosts[8070],
    },
}

---@type { [number] : flightstoneBonusData }
local flightstoneBonusIds = {
    -- Explorer 1/8
    [9294] = {itemLevel = 376, rank = 1, upgradeLevel = 1, maxUpgradeLevel = 8, upgradeGroup = 12},

    -- Explorer 2/8
    [9295] = {itemLevel = 379, rank = 1, upgradeLevel = 2, maxUpgradeLevel = 8, upgradeGroup = 12},

    -- Explorer 3/8
    [9296] = {itemLevel = 382, rank = 1, upgradeLevel = 3, maxUpgradeLevel = 8, upgradeGroup = 12},

    -- Explorer 4/8
    [9297] = {itemLevel = 385, rank = 1, upgradeLevel = 4, maxUpgradeLevel = 8, upgradeGroup = 12},

    -- Explorer 5/8
    [9298] = {itemLevel = 389, rank = 1, upgradeLevel = 5, maxUpgradeLevel = 8, upgradeGroup = 13},

    -- Explorer 6/8
    [9299] = {itemLevel = 392, rank = 1, upgradeLevel = 6, maxUpgradeLevel = 8, upgradeGroup = 13},

    -- Explorer 7/8
    [9300] = {itemLevel = 395, rank = 1, upgradeLevel = 7, maxUpgradeLevel = 8, upgradeGroup = 13},

    -- Explorer 8/8
    [9301] = {itemLevel = 398, rank = 1, upgradeLevel = 8, maxUpgradeLevel = 8, upgradeGroup = 13},

    -- Adventurer 1/8
    [9302] = {itemLevel = 389, rank = 2, upgradeLevel = 1, maxUpgradeLevel = 8, upgradeGroup = 13},

    -- Adventurer 2/8
    [9303] = {itemLevel = 392, rank = 2, upgradeLevel = 2, maxUpgradeLevel = 8, upgradeGroup = 13},

    -- Adventurer 3/8
    [9304] = {itemLevel = 395, rank = 2, upgradeLevel = 3, maxUpgradeLevel = 8, upgradeGroup = 13},

    -- Adventurer 4/8
    [9305] = {itemLevel = 398, rank = 2, upgradeLevel = 4, maxUpgradeLevel = 8, upgradeGroup = 13},

    -- Adventurer 5/8
    [9306] = {itemLevel = 402, rank = 2, upgradeLevel = 5, maxUpgradeLevel = 8, upgradeGroup = 14},

    -- Adventurer 6/8
    [9307] = {itemLevel = 405, rank = 2, upgradeLevel = 6, maxUpgradeLevel = 8, upgradeGroup = 14},

    -- Adventurer 7/8
    [9308] = {itemLevel = 408, rank = 2, upgradeLevel = 7, maxUpgradeLevel = 8, upgradeGroup = 14},

    -- Adventurer 8/8
    [9309] = {itemLevel = 411, rank = 2, upgradeLevel = 8, maxUpgradeLevel = 8, upgradeGroup = 14},

    -- Veteran 1/8
    [9313] = {itemLevel = 402, rank = 3, upgradeLevel = 1, maxUpgradeLevel = 8, upgradeGroup = 14},

    -- Veteran 2/8
    [9314] = {itemLevel = 405, rank = 3, upgradeLevel = 2, maxUpgradeLevel = 8, upgradeGroup = 14},

    -- Veteran 3/8
    [9315] = {itemLevel = 408, rank = 3, upgradeLevel = 3, maxUpgradeLevel = 8, upgradeGroup = 14},

    -- Veteran 4/8
    [9316] = {itemLevel = 411, rank = 3, upgradeLevel = 4, maxUpgradeLevel = 8, upgradeGroup = 14},

    -- Veteran 5/8
    [9317] = {itemLevel = 415, rank = 3, upgradeLevel = 5, maxUpgradeLevel = 8, upgradeGroup = 15},

    -- Veteran 6/8
    [9318] = {itemLevel = 418, rank = 3, upgradeLevel = 6, maxUpgradeLevel = 8, upgradeGroup = 15},

    -- Veteran 7/8
    [9319] = {itemLevel = 421, rank = 3, upgradeLevel = 7, maxUpgradeLevel = 8, upgradeGroup = 15},

    -- Veteran 8/8
    [9320] = {itemLevel = 424, rank = 3, upgradeLevel = 8, maxUpgradeLevel = 8, upgradeGroup = 15},

    -- Champion 1/8
    [9321] = {itemLevel = 415, rank = 4, upgradeLevel = 1, maxUpgradeLevel = 8, upgradeGroup = 15},

    -- Champion 2/8
    [9322] = {itemLevel = 418, rank = 4, upgradeLevel = 2, maxUpgradeLevel = 8, upgradeGroup = 15},

    -- Champion 3/8
    [9323] = {itemLevel = 421, rank = 4, upgradeLevel = 3, maxUpgradeLevel = 8, upgradeGroup = 15},

    -- Champion 4/8
    [9324] = {itemLevel = 424, rank = 4, upgradeLevel = 4, maxUpgradeLevel = 8, upgradeGroup = 15},

    -- Champion 5/8
    [9325] = {itemLevel = 428, rank = 4, upgradeLevel = 5, maxUpgradeLevel = 8, upgradeGroup = 16},

    -- Champion 6/8
    [9327] = {itemLevel = 431, rank = 4, upgradeLevel = 6, maxUpgradeLevel = 8, upgradeGroup = 16},

    -- Champion 7/8
    [9328] = {itemLevel = 434, rank = 4, upgradeLevel = 7, maxUpgradeLevel = 8, upgradeGroup = 16},

    -- Champion 8/8
    [9329] = {itemLevel = 437, rank = 4, upgradeLevel = 8, maxUpgradeLevel = 8, upgradeGroup = 16},

    -- Hero 1/5
    [9330] = {itemLevel = 428, rank = 5, upgradeLevel = 1, maxUpgradeLevel = 5, upgradeGroup = 16},

    -- Hero 2/5
    [9331] = {itemLevel = 431, rank = 5, upgradeLevel = 2, maxUpgradeLevel = 5, upgradeGroup = 16},

    -- Hero 3/5
    [9332] = {itemLevel = 434, rank = 5, upgradeLevel = 3, maxUpgradeLevel = 5, upgradeGroup = 16},

    -- Hero 4/5
    [9333] = {itemLevel = 437, rank = 5, upgradeLevel = 4, maxUpgradeLevel = 5, upgradeGroup = 16},

    -- Hero 5/5
    [9334] = {itemLevel = 441, rank = 5, upgradeLevel = 5, maxUpgradeLevel = 5, upgradeGroup = 17},

    -- Myth 1/3
    [9380] = {itemLevel = 441, rank = 6, upgradeLevel = 1, maxUpgradeLevel = 3, upgradeGroup = 17},

    -- Myth 2/3
    [9381] = {itemLevel = 444, rank = 6, upgradeLevel = 2, maxUpgradeLevel = 3, upgradeGroup = 17},

    -- Myth 3/3
    [9382] = {itemLevel = 447, rank = 6, upgradeLevel = 3, maxUpgradeLevel = 3, upgradeGroup = 17}
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

--- Parses the given upgrade costs to generate a table for use in tooltip
---@param upgradeCost table
---@return table
local function ParseUpgradeCost(upgradeCost)
    local lines = {}
    local compactCostLine = {}

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

                    table.insert(compactCostLine, icon .. " " .. costLine)
                else
                    local itemCount = currencyInfo.quantity;
                    local requiredColor = itemCount >= upgradeCost[upgradeItem.id] and GREEN_FONT_COLOR or ERROR_COLOR;
                    local heldColor = (currencyInfo.maxQuantity and currencyInfo.quantity == currencyInfo.maxQuantity) and ERROR_COLOR or WHITE_FONT_COLOR

                    costLine = requiredColor:WrapTextInColorCode(BreakUpLargeNumbers(upgradeCost[upgradeItem.id])) .. " / " .. heldColor:WrapTextInColorCode(BreakUpLargeNumbers(currencyInfo.quantity))

                    table.insert(compactCostLine, icon .. " " .. requiredColor:WrapTextInColorCode(BreakUpLargeNumbers(upgradeCost[upgradeItem.id])))
                end
            elseif upgradeItem.itemId ~= nil then
                -- Get item count and compare to required
                -- Means we can also have matching fragments
                local itemCount = GetItemCount(upgradeItem.itemId, true);
                local requiredColor = itemCount >= upgradeCost[upgradeItem.id] and GREEN_FONT_COLOR or ERROR_COLOR;

                costLine = requiredColor:WrapTextInColorCode(BreakUpLargeNumbers(upgradeCost[upgradeItem.id])) .. " / " .. WHITE_FONT_COLOR:WrapTextInColorCode(BreakUpLargeNumbers(itemCount))

                table.insert(compactCostLine, icon .. " " .. requiredColor:WrapTextInColorCode(BreakUpLargeNumbers(upgradeCost[upgradeItem.id])))

                fragmentName = upgradeItem.fragment and upgradeItem.fragment.name or nil
                fragmentId = upgradeItem.fragment and upgradeItem.fragment.itemId or nil
                fragmentIcon = upgradeItem.fragment and upgradeItem.fragment.icon or nil
            else
                costLine = WHITE_FONT_COLOR:WrapTextInColorCode(BreakUpLargeNumbers(upgradeCost[upgradeItem.id]))

                table.insert(compactCostLine, icon .. " " .. costLine)
            end

            if not private.DB.profile.CompactTooltips then
                table.insert(lines, {
                    left = icon .. " " .. upgradeItem.color:WrapTextInColorCode(upgradeItem.name),
                    right = costLine,
                    color = upgradeItem.color,
                    fragmentData = {name = fragmentName, itemId = fragmentId, icon = fragmentIcon}
                })
            end
        end
    end

    if private.DB.profile.CompactTooltips then
        table.insert(lines, {
            left = "",
            right = table.concat(compactCostLine, "  "),
            color = WHITE_FONT_COLOR,
            fragmentData = nil
        })
    end

    if #lines == 0 then
        private.Debug("Parsing Flightstones upgrade cost returned no tooltip lines");
    end

    return lines;
end

--- Updates the tooltip when a Flightstone item is the item in question
---@param tooltip GameTooltip
---@param upgradeCosts { [number]: flightstoneUpgradeCostData }
---@param bonusId number
---@param bonusInfo flightstoneBonusData
---@param itemLink string
local function HandleFlightstones(tooltip, upgradeCosts, bonusId, bonusInfo, itemLink)
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

            local whelpCrests = upgradeCosts[upgradeInfo.upgradeGroup].whelpCrests * (isCharacterDiscounted and 0 or 1)
            local drakeCrests = upgradeCosts[upgradeInfo.upgradeGroup].drakeCrests * (isCharacterDiscounted and 0 or 1)
            local wyrmCrests = upgradeCosts[upgradeInfo.upgradeGroup].wyrmCrests * (isCharacterDiscounted and 0 or 1)
            local aspectCrests = upgradeCosts[upgradeInfo.upgradeGroup].aspectCrests * (isCharacterDiscounted and 0 or 1)
            local flightstones = Round(upgradeCosts[upgradeInfo.upgradeGroup].flightstones * (isAccountDiscounted and 0.5 or 1))

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
            tooltip:AddLine(ARTIFACT_GOLD_COLOR:WrapTextInColorCode(L["Flightstone / Crest Upgrades"]))

            if nextLevelLines then
                if not private.DB.profile.CompactTooltips then
                    -- Standard tooltip
                    tooltip:AddLine(HEIRLOOM_BLUE_COLOR:WrapTextInColorCode(L["Cost for next level:"] .. " (" .. nextUpgrade.itemLevel .. ")"))

                    for _, newLine in pairs(nextLevelLines) do
                        tooltip:AddDoubleLine(newLine.left, newLine.right)
                    end
                else
                    -- Compact tooltips
                    tooltip:AddDoubleLine(
                        WHITE_FONT_COLOR:WrapTextInColorCode(L["Next Upgrade (%d):"]:format(nextUpgrade.itemLevel)),
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

                    tooltip:AddLine(HEIRLOOM_BLUE_COLOR:WrapTextInColorCode(L["Cost to upgrade to max level:"] .. " (" .. maxUpgrade.itemLevel .. ")"))

                    for _, newLine in pairs(totalLines) do
                        tooltip:AddDoubleLine(newLine.left, newLine.right)
                    end
                else
                    -- Compact tooltips
                    tooltip:AddDoubleLine(
                        WHITE_FONT_COLOR:WrapTextInColorCode(L["Max Upgrade (%d):"]:format(maxUpgrade.itemLevel)),
                        totalLines[1].right
                    )
                end
            end
        end

        if not private.DB.profile.CompactTooltips then
           -- Fragment data collection: use the 'totalLines' because that have all needed crests in it
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
    else
        private.Debug("No next Flightstones upgrade cost could be found for", itemLink);
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
    if private.DB.profile.DisabledIntegrations.Flightstones then
        private.Debug("Flightstones integration is disabled");

        return false
    end

    local equipLoc = select(9, GetItemInfo(itemLink))

    private.Debug(itemLink, "has equipLoc", equipLoc);

    local upgradeCosts = itemUpgradeCosts[equipLoc]
    if not upgradeCosts then
        private.Debug(equipLoc, "was not found in the Flightstones upgrade cost table");
        return false
    end

    local upgradeCostOverride = itemUpgradeCostOverrides[equipLoc];
    if upgradeCostOverride then
        local stats = GetItemStats(itemLink)
        if not stats then
            private.Debug("Could not extract Flightstones item stats from", itemLink);
            return false
        end
        local hasInt = (stats["ITEM_MOD_INTELLECT_SHORT"] and stats["ITEM_MOD_INTELLECT_SHORT"] > 0)
        if hasInt then
            private.Debug("Upgrade cost for has been overridden because the item has Intellect on it.");
            upgradeCosts = upgradeCostOverride
        end
    end

    for i = 1, #bonusIds do
        ---@type flightstoneBonusData?
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
