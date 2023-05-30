-- ----------------------------------------------------------------------------
-- AddOn Namespace
-- ----------------------------------------------------------------------------
local private = select(2, ...) ---@class PrivateNamespace
local L = private.L

private.currencyIds.Honor = 1792
private.currencyIndexes[private.currencyIds.Honor] = true

--[[
    ItemBonusListGroupEntry.ItemBonusListID
    ItemBonusListGroup.ItemLogicalCostGroupID
    ItemLogicalCost.ItemExtendedCostID
    ItemExtendedCost.CurrencyID_0 / ItemExtendedCost.CurrencyCount_0

    https://wago.tools/db2/ItemBonusListGroupEntry?filter[ItemBonusListID]=9426&page=1
    https://wago.tools/db2/ItemBonusListGroupEntry?filter[ItemBonusListID]=9427&page=1
    https://wago.tools/db2/ItemBonusListGroupEntry?filter[ItemBonusListID]=9428&page=1
    https://wago.tools/db2/ItemBonusListGroupEntry?filter[ItemBonusListID]=9429&page=1
    https://wago.tools/db2/ItemBonusListGroupEntry?filter[ItemBonusListID]=9430&page=1
    https://wago.tools/db2/ItemBonusListGroupEntry?filter[ItemBonusListID]=9431&page=1
    https://wago.tools/db2/ItemBonusListGroupEntry?filter[ItemBonusListID]=9431&page=1
    https://wago.tools/db2/ItemBonusListGroupEntry?filter[ItemBonusListID]=9433&page=1
    https://wago.tools/db2/ItemBonusListGroupEntry?filter[ItemBonusListID]=9434&page=1
    https://wago.tools/db2/ItemLogicalCost?filter[ItemLogicalCostGroupID]=exact%3A3&page=1&sort[ItemExtendedCostID]=asc
]]

---@type { [number] : honorBonusData }
local conquestBonusIds = {
    [9426] = { itemLevel = 408, upgradeLevel = 1, maxUpgradeLevel = 9},
    [9427] = { itemLevel = 411, upgradeLevel = 2, maxUpgradeLevel = 9},
    [9428] = { itemLevel = 415, upgradeLevel = 3, maxUpgradeLevel = 9},
    [9429] = { itemLevel = 418, upgradeLevel = 4, maxUpgradeLevel = 9},
    [9430] = { itemLevel = 421, upgradeLevel = 5, maxUpgradeLevel = 9},
    [9431] = { itemLevel = 424, upgradeLevel = 6, maxUpgradeLevel = 9},
    [9432] = { itemLevel = 428, upgradeLevel = 7, maxUpgradeLevel = 9},
    [9433] = { itemLevel = 431, upgradeLevel = 8, maxUpgradeLevel = 9},
    [9434] = { itemLevel = 434, upgradeLevel = 9, maxUpgradeLevel = 9},
}

---@type { [number]: number }
local itemExtendedCosts = {
    [7690] = 1175,
    [7691] = 950,
    [7692] = 700,
    [7693] = 600,
    [7694] = 1175,
    [7695] = 2375,
    [7696] = 1775,
    [7697] = 2375,
}

---@type { [string]: number }
local itemUpgradeCosts = {

    -- InventoryTypeSlotMask 1048738
    ["INVTYPE_HEAD"] = itemExtendedCosts[7690],
    ["INVTYPE_CHEST"] = itemExtendedCosts[7690],
    ["INVTYPE_LEGS"] = itemExtendedCosts[7690],
    ["INVTYPE_ROBE"] = itemExtendedCosts[7690],

    -- InventoryTypeSlotMask 5448
    ["INVTYPE_SHOULDER"] = itemExtendedCosts[7691],
    ["INVTYPE_WAIST"] = itemExtendedCosts[7691],
    ["INVTYPE_FEET"] = itemExtendedCosts[7691],
    ["INVTYPE_HAND"] = itemExtendedCosts[7691],
    ["INVTYPE_TRINKET"] = itemExtendedCosts[7691],

    -- InventoryTypeSlotMask 72196
    ["INVTYPE_NECK"] = itemExtendedCosts[7692],
    ["INVTYPE_WRIST"] = itemExtendedCosts[7692],
    ["INVTYPE_FINGER"] = itemExtendedCosts[7692],
    ["INVTYPE_CLOAK"] = itemExtendedCosts[7692],

    -- InventoryTypeSlotMask 8404992
    ["INVTYPE_HOLDABLE"] = itemExtendedCosts[7693],
    ["INVTYPE_SHIELD"] = itemExtendedCosts[7693],

    -- InventoryTypeSlotMask 8192
    ["INVTYPE_WEAPON"] = itemExtendedCosts[7694],

    -- InventoryTypeSlotMask 67272704
    ["INVTYPE_RANGED"] = itemExtendedCosts[7695],
    ["INVTYPE_2HWEAPON"] = itemExtendedCosts[7695],
    ["INVTYPE_RANGEDRIGHT"] = itemExtendedCosts[7695],
}

-- Override costs for Intellect items
---@type { [string]: number }
local itemUpgradeCostOverrides = {
    -- InventoryTypeSlotMask 67117056
    ["INVTYPE_WEAPON"] = itemExtendedCosts[7696],
    ["INVTYPE_RANGEDRIGHT"] = itemExtendedCosts[7696],

    -- InventoryTypeSlotMask 131072
    ["INVTYPE_2HWEAPON"] = itemExtendedCosts[7697],
}

-- Override costs for non-Gladiator trinkets
---@type { [number]: number } }
local trinketUpgradeCostOverrides = {
    [205711] = itemExtendedCosts[7692],
    [205712] = itemExtendedCosts[7692],
}

--- Parses the given upgrade costs to generate a table for use in tooltip
---@param upgradeCost number
local function ParseUpgradeCost(upgradeCost)
    local lines = {}

    ---@type CurrencyInfo
    local currencyInfo = private.currencyInfo[private.currencyIds.Honor];
    if currencyInfo == nil then
        return lines
    end

    local icon = currencyInfo.iconFileID and CreateTextureMarkup(currencyInfo.iconFileID, 64, 64, 0, 0, 0.1, 0.9, 0.1, 0.9) or ""

    -- Check currency against cap
    local itemCount = currencyInfo.quantity;
    local requiredColor = itemCount >= upgradeCost and GREEN_FONT_COLOR or ERROR_COLOR;
    local heldColor = (currencyInfo.maxQuantity and currencyInfo.quantity == currencyInfo.maxQuantity) and ERROR_COLOR or WHITE_FONT_COLOR

    local costLine = requiredColor:WrapTextInColorCode(BreakUpLargeNumbers(upgradeCost)) .. " / " .. heldColor:WrapTextInColorCode(BreakUpLargeNumbers(currencyInfo.quantity))

    table.insert(lines, {
        left = icon .. " " .. EPIC_PURPLE_COLOR:WrapTextInColorCode(currencyInfo.name),
        right = costLine,
    })

    return lines;
end

--- Updates the tooltip when parsing a Conquest item
---@param tooltip GameTooltip
---@param upgradeCost number
---@param bonusId number
---@param bonusInfo honorBonusData
local function HandleConquest(tooltip, upgradeCost, bonusId, bonusInfo)
    if not bonusId or not bonusInfo then
        return
    end

    ---@type number
    local nextUpgradeCost = 0

    ---@type honorBonusData?
    local nextUpgrade = nil

    ---@type honorBonusData?
    local maxUpgrade = nil

    ---@type number
    local totalUpgradeCost = 0

    ---@type CurrencyInfo
    local currencyInfo = private.currencyInfo[private.currencyIds.Honor];

    for _, upgradeInfo in pairs(conquestBonusIds) do
        if upgradeInfo.upgradeLevel > bonusInfo.upgradeLevel then
            if upgradeInfo.upgradeLevel == (bonusInfo.upgradeLevel + 1) then
                nextUpgrade = upgradeInfo

                nextUpgradeCost = upgradeCost
            end
            totalUpgradeCost = totalUpgradeCost + upgradeCost

            if not maxUpgrade or maxUpgrade.upgradeLevel < upgradeInfo.upgradeLevel then
                maxUpgrade = upgradeInfo
            end
        end
    end

    if nextUpgradeCost and nextUpgrade then
        local nextLevelLines = ParseUpgradeCost(nextUpgradeCost)
        local totalLines = ParseUpgradeCost(totalUpgradeCost)

        if #nextLevelLines > 0 or #totalLines > 0 then
            tooltip:AddLine("\n")
            tooltip:AddLine("\n")
            tooltip:AddLine(ARTIFACT_GOLD_COLOR:WrapTextInColorCode(L["%s Upgrades"]:format(currencyInfo.name)))

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
    end
end

--- Checks for Conquest item and bonus IDs and chains call to HandleConquest if found
---@diagnostic disable: unused-local
---@param tooltip GameTooltip
---@param itemId number
---@param itemLink string
---@param currentUpgrade number
---@param maxUpgrade number
---@param bonusIds table<number, number>
---@return boolean
local function CheckConquestBonusIds(tooltip, itemId, itemLink, currentUpgrade, maxUpgrade, bonusIds)
    local equipLoc = select(9, GetItemInfo(itemLink))

    local upgradeCost = itemUpgradeCosts[equipLoc]
    if not upgradeCost then
        return false
    end

    local upgradeCostOverride = itemUpgradeCostOverrides[equipLoc];
    if upgradeCostOverride then
        local stats = GetItemStats(itemLink)
        if not stats then
            return false
        end
        local hasInt = (stats["ITEM_MOD_INTELLECT_SHORT"] and stats["ITEM_MOD_INTELLECT_SHORT"] > 0)
        if hasInt then
            upgradeCost = upgradeCostOverride
        end
    elseif equipLoc == "INVTYPE_TRINKET" then
        local trinketUpgradeCostOverride = trinketUpgradeCostOverrides[itemId];
        if trinketUpgradeCostOverride ~= nil then
            upgradeCost = trinketUpgradeCostOverride
        end
    end

    for i = 1, #bonusIds do
        ---@type honorBonusData?
        local bonusInfo = conquestBonusIds[bonusIds[i]]
        if bonusInfo ~= nil then
            HandleConquest(tooltip, upgradeCost, i, bonusInfo)
            return true
        end
    end

    return false
end

table.insert(private.upgradeHandlers, CheckConquestBonusIds)
