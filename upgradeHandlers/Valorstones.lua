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

---@type Array<ItemBonusInfo>
local itemBonusIds = {}

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
