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

private.currencyIds.whelpDreamingCrest = 2706
private.currencyIndexes[private.currencyIds.whelpDreamingCrest] = true

private.currencyIds.drakeDreamingCrest = 2707
private.currencyIndexes[private.currencyIds.drakeDreamingCrest] = true

private.currencyIds.wyrmDreamingCrest = 2708
private.currencyIndexes[private.currencyIds.wyrmDreamingCrest] = true

private.currencyIds.aspectDreamingCrest = 2709
private.currencyIndexes[private.currencyIds.aspectDreamingCrest] = true


-- Add preferences
private.Preferences.DefaultValues.profile.DisabledIntegrations.Flightstones = false;
private.Preferences.DisabledIntegrations.Flightstones = {
    type = "toggle",
    name = L["Flightstone / Crest Upgrades"],
    order = 110,
    width = "double",
}

---@type Array<flightstoneBonusData>
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

---@type Array<flightstoneUpgradeCostData>
local itemExtendedCostTable = {
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

---@type Array<flightstoneUpgradeData>
local flightstoneUpgradeData = {
    {
        id = "flightstones",
        name = L["Flightstones"],
        color = WHITE_FONT_COLOR,
        icon = 5172976,
        itemId = nil,
        currencyId = private.currencyIds.Flightstones
    },

    {
        id = "whelpCrests",
        name = L["Whelpling's Crests"],
        color = UNCOMMON_GREEN_COLOR,
        icon = 5309872,
        itemId = nil,
        currencyId = private.currencyIds.whelpDreamingCrest
    },

    {
        id = "drakeCrests",
        name = L["Drake's Crests"],
        color = RARE_BLUE_COLOR,
        icon = 5309870,
        itemId = nil,
        currencyId = private.currencyIds.drakeDreamingCrest
    },

    {
        id = "wyrmCrests",
        name = L["Wyrm's Crests"],
        color = EPIC_PURPLE_COLOR,
        icon = 5309874,
        itemId = nil,
        currencyId = private.currencyIds.wyrmDreamingCrest
    },

    {
        id = "aspectCrests",
        name = L["Aspect's Crests"],
        color = LEGENDARY_ORANGE_COLOR,
        icon = 5309868,
        itemId = nil,
        currencyId = private.currencyIds.aspectDreamingCrest
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

--- Parses the given upgrade costs to generate a table for use in tooltip
---@param itemExtendedCosts Array<integer>
---@param upgradeInfo flightstoneBonusData
---@return flightstoneUpgradeCostData?
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
---@param upgradeCostData flightstoneUpgradeCostData
---@return table
local function ParseUpgradeCost(upgradeCostData)
    local lines = {}
    local compactCostLine = {}

    for _, upgradeItem in ipairs(flightstoneUpgradeData) do
        if upgradeCostData[upgradeItem.id] ~= nil and upgradeCostData[upgradeItem.id] > 0 then
            local icon = upgradeItem.icon and CreateTextureMarkup(upgradeItem.icon, 64, 64, 0, 0, 0.1, 0.9, 0.1, 0.9) or ""
            local costLine = ""
            local upgradeCost = upgradeCostData[upgradeItem.id];

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
---@param bonusInfo flightstoneBonusData
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
