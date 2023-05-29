-- ----------------------------------------------------------------------------
-- AddOn Namespace
-- ----------------------------------------------------------------------------
local private = select(2, ...) ---@class PrivateNamespace
local L = private.L

private.currencyIds.Honor = 1792
private.currencyIndexes[private.currencyIds.Honor] = true

---@type { [number] : honorBonusData }
local honorBonusIds = {
    -- 1/5
    [9421] = { itemLevel = 366, upgradeLevel = 1, maxUpgradeLevel = 5,
        honorCosts = {
            875, -- 1h Melee Weapon, Helms, Chests, Legs
            525, -- Trinket #1, Rings, Cloaks, Bracers, Necks
            700, -- Shoulders, Gloves, Trinket #2, Boots, Belts
            1325, -- 1H Caster Weapon
            425, -- Offhand (caster)
            1750 -- 2H Weapon
        }
    },

    -- 2/5
    [9422] = { itemLevel = 372, upgradeLevel = 2, maxUpgradeLevel = 5,
        honorCosts = {
            700, -- 1h Melee Weapon, Helms, Chests, Legs
            425, -- Trinket #1, Rings, Cloaks, Bracers, Necks
            550, -- Shoulders, Gloves, Trinket #2, Boots, Belts
            1050, -- 1H Caster Weapon
            375, -- Offhand (caster)
            1425 -- 2H Weapon
        }
    },

    -- 3/5
    [9423] = { itemLevel = 379, upgradeLevel = 3, maxUpgradeLevel = 5,
        honorCosts = {
            700, -- 1h Melee Weapon, Helms, Chests, Legs
            425, -- Trinket #1, Rings, Cloaks, Bracers, Necks
            550, -- Shoulders, Gloves, Trinket #2, Boots, Belts
            1050, -- 1H Caster Weapon
            375, -- Offhand (caster)
            1425 -- 2H Weapon
        }
    },

    -- 4/5
    [9424] = { itemLevel = 385, upgradeLevel = 4, maxUpgradeLevel = 5,
        honorCosts = {
            700, -- 1h Melee Weapon, Helms, Chests, Legs
            425, -- Trinket #1, Rings, Cloaks, Bracers, Necks
            550, -- Shoulders, Gloves, Trinket #2, Boots, Belts
            1050, -- 1H Caster Weapon
            375, -- Offhand (caster)
            1425 -- 2H Weapon
        }
    },

    -- 5/5
    [9425] = { itemLevel = 392, upgradeLevel = 5, maxUpgradeLevel = 5,
        honorCosts = {
            700, -- 1h Melee Weapon, Helms, Chests, Legs
            425, -- Trinket #1, Rings, Cloaks, Bracers, Necks
            550, -- Shoulders, Gloves, Trinket #2, Boots, Belts
            1050, -- 1H Caster Weapon
            375, -- Offhand (caster)
            1425 -- 2H Weapon
        }
    },
}

---@type { [string]: number }
local itemUpgradeIndexes = {
    ["INVTYPE_WEAPONOFFHAND"] = 5,
    ["INVTYPE_SHIELD"] = 5,
    ["INVTYPE_FINGER"] = 2,
    ["INVTYPE_CLOAK"] = 2,
    ["INVTYPE_WRIST"] = 2,
    ["INVTYPE_NECK"] = 2,
    ["INVTYPE_HOLDABLE"] = 2,
    ["INVTYPE_SHOULDER"] = 3,
    ["INVTYPE_HAND"] = 3,
    ["INVTYPE_TRINKET"] = 3,
    ["INVTYPE_FEET"] = 3,
    ["INVTYPE_WAIST"] = 3,
    ["INVTYPE_HEAD"] = 1,
    ["INVTYPE_CHEST"] = 1,
    ["INVTYPE_ROBE"] = 1,
    ["INVTYPE_LEGS"] = 1,
    ["INVTYPE_WEAPONMAINHAND"] = 1,
    ["INVTYPE_RANGEDRIGHT"] = 5,
    ["INVTYPE_WEAPON"] = 1,
    ["INVTYPE_2HWEAPON"] = 6,
}

---@type { [number]: boolean } }
local trinketOverrides = {
    [205779] = true,
    [205782] = true,
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
        left = icon .. " " .. RARE_BLUE_COLOR:WrapTextInColorCode(currencyInfo.name),
        right = costLine,
    })

    return lines;
end

--- Updates the tooltip parsing a Honor item
---@param tooltip GameTooltip
---@param itemGroup number
---@param bonusId number
---@param bonusInfo honorBonusData
local function HandleHonor(tooltip, itemGroup, bonusId, bonusInfo)
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

    for _, upgradeInfo in pairs(honorBonusIds) do
        if upgradeInfo.upgradeLevel > bonusInfo.upgradeLevel then
            local honor = Round(upgradeInfo.honorCosts[itemGroup])

            if upgradeInfo.upgradeLevel == (bonusInfo.upgradeLevel + 1) then
                nextUpgrade = upgradeInfo

                nextUpgradeCost = honor
            end
            totalUpgradeCost = totalUpgradeCost + honor

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

--- Checks for Honor item and bonus IDs and chains call to HandleHonor if found
---@diagnostic disable: unused-local
---@param tooltip GameTooltip
---@param itemId number
---@param itemLink string
---@param currentUpgrade number
---@param maxUpgrade number
---@param bonusIds table<number, number>
---@return boolean
local function CheckHonorBonusIds(tooltip, itemId, itemLink, currentUpgrade, maxUpgrade, bonusIds)
    local equipLoc = select(9, GetItemInfo(itemLink))

    local itemGroup = itemUpgradeIndexes[equipLoc]
    if not itemGroup then
        return false
    end

    if itemGroup == 1 then
        local stats = GetItemStats(itemLink)
        if not stats then
            return false
        end
        local hasInt = (stats["ITEM_MOD_INTELLECT_SHORT"] and stats["ITEM_MOD_INTELLECT_SHORT"] > 0)
        if hasInt then
            itemGroup = 4
        end
    elseif itemGroup == 3 and equipLoc == "INVTYPE_TRINKET" then
        if trinketOverrides[itemId] then
            itemGroup = 2
        end
    end

    for i = 1, #bonusIds do
        ---@type honorBonusData?
        local bonusInfo = honorBonusIds[bonusIds[i]]
        if bonusInfo ~= nil then
            HandleHonor(tooltip, itemGroup, i, bonusInfo)
            return true
        end
    end

    return false
end

table.insert(private.upgradeHandlers, CheckHonorBonusIds)
