local _, ItemUpgradeTip = ...
local L = ItemUpgradeTip.L


--- Generic currency handler based on bonusInfo table
---@param tooltip GameTooltipTemplate
---@param currentUpgrade number
---@param maxUpgrade number
---@param bonusInfo table
local function HandleCurrency(tooltip, currentUpgrade, maxUpgrade, bonusInfo)
    local upgradesRemaining = maxUpgrade - currentUpgrade
    local currencyInfo = C_CurrencyInfo.GetCurrencyInfo(bonusInfo.currencyId)
    local currencyOwned = currencyInfo.quantity
    local currencyIconId = currencyInfo.iconFileID

    tooltip:AddLine("\n")

    tooltip:AddLine("|cffa335ee" .. L["%s Upgrades"]:format(currencyInfo.name) .. "|r")
    tooltip:AddTexture(currencyIconId)

    if currencyOwned >= bonusInfo.toMax and upgradesRemaining > 0 then
        tooltip:AddLine(L["Item can be upgraded to max level!"])
    end

    if upgradesRemaining == 0 then
        tooltip:AddLine("|cffffffee" .. L["Item upgraded to max level!"] .. "|r")
    else
        tooltip:AddDoubleLine("|cffffffee" .. L["Cost for next level:"] .. "|r", "|cffffffee" .. bonusInfo.amount .. "|r")
        tooltip:AddDoubleLine("|cffffffee" .. L["Cost to upgrade to max level:"] .. "|r", "|cffffffee" .. bonusInfo.toMax .. "|r")
        if currencyOwned >= bonusInfo.toMax then
            tooltip:AddDoubleLine("|cffffffee" .. L["Currency remaining after upgrading:"] .. "|r", "|cffffffee" .. (currencyOwned - bonusInfo.toMax) .. "|r")
        else
            tooltip:AddDoubleLine("|cffffffee" .. L["Currency needed for max level:"] .. "|r", "|cffffffee" .. (bonusInfo.toMax - currencyOwned) .. "|r")
        end
    end
end
ItemUpgradeTip.HandleCurrency = HandleCurrency


--- Updates the tooltip when a Heirloom is the item in question
---@param tooltip GameTooltipTemplate
---@param currentUpgrade number
---@param maxUpgrade number
local function HandleHeirloom(tooltip, currentUpgrade, maxUpgrade)
    tooltip:AddLine("\n")
    
    tooltip:AddLine("|cffa335ee" .. L["Heirloom Upgrades"] .. "|r")
    tooltip:AddTexture("Interface/Icons/inv_staff_13")

    local upgradesRemaining = maxUpgrade - currentUpgrade
    if upgradesRemaining == 0 then
        tooltip:AddLine("|cffffffee" .. L["Item upgraded to max level!"] .. "|r")
    else
        tooltip:AddLine("|cffffffee" .. L["Upgrade level: %d / %d"]:format(currentUpgrade, maxUpgrade) .. "|r")
    end
end
ItemUpgradeTip.HandleHeirloom = HandleHeirloom

--- Checks for valid bonus IDs and chains call to HandleCurrency if found
---@param tooltip GameTooltipTemplate
---@param currentUpgrade number
---@param maxUpgrade number
---@return boolean
local function CheckBonusIDs(tooltip, currentUpgrade, maxUpgrade, bonusIds, bonusTable)
    for i = 1, #bonusIds do
        local bonusInfo = bonusTable[bonusIds[i]]
        if bonusInfo ~= nil then
            HandleCurrency(tooltip, currentUpgrade, maxUpgrade, bonusInfo)
            return true
        end
    end

    return false
end
ItemUpgradeTip.CheckBonusIDs = CheckBonusIDs


--- Handles updating an item tooltip to add additional information about upgrade costs
---@param tooltip GameTooltipTemplate
---@param tooltipData table
local function HandleTooltipSetItem(tooltip, tooltipData)
    if tooltip ~= _G.GameTooltip then
        return
    end

    local clipAfter = string.find(ITEM_UPGRADE_TOOLTIP_FORMAT, "%%d") -1
    local searchValue = string.sub(ITEM_UPGRADE_TOOLTIP_FORMAT, 1, clipAfter)

    for _, tooltipLine in pairs(tooltipData.lines) do
        local currentUpgrade, maxUpgrade = tooltipLine.leftText:match(searchValue .. "(%d+)/(%d+)")
        if currentUpgrade ~= nil and maxUpgrade ~= nil then            
            local isHeirloom = C_Heirloom.GetHeirloomInfo(tooltipData.id)
            if isHeirloom then
                HandleHeirloom(tooltip, currentUpgrade, maxUpgrade)
                return
            end

            local itemName, itemLink = tooltip:GetItem()
            local equipLoc, _, _, classID, subclassID = select(9, GetItemInfo(itemLink))
            if classID == nil or subclassID == nil or (tonumber(classID) ~= 2 and tonumber(classID) ~= 4) then
                return
            end

            local itemString = string.match(itemLink, "item:([%-?%d:]+)")
            if not itemString then
                return
            end

            local bonusIds = {}
            local itemSplit = {}
            local itemId = tonumber(itemSplit[1])

            for v in string.gmatch(itemString, "(%d*:?)") do
                if v == ":" then
                    itemSplit[#itemSplit + 1] = 0
                else
                    itemSplit[#itemSplit + 1] = string.gsub(v, ":", "")
                end
            end

            for index = 1, tonumber(itemSplit[13]) do
                bonusIds[#bonusIds + 1] = tonumber(itemSplit[13 + index])
            end

            -- Scan all bonusIds for Anima upgrade bonus IDs
            local handled = CheckBonusIDs(
                tooltip, 
                currentUpgrade, 
                maxUpgrade, 
                bonusIds, 
                ItemUpgradeTip.bonusIds[ItemUpgradeTip.animaUpgradeIndex]
            )

            if handled then 
                return
            end

            if ItemUpgradeTip.honorUpgradeIndexes[itemId] ~= nil then
                -- Hardcoded honor item IDs
                CheckBonusIDs(
                    tooltip, 
                    currentUpgrade, 
                    maxUpgrade, 
                    bonusIds, 
                    ItemUpgradeTip.bonusIds[ItemUpgradeTip.honorUpgradeIndexes[itemId]]
                )
            elseif ItemUpgradeTip.conquestUpgradeIndexes[itemId] ~= nil then
                -- Hardcoded conquest item IDs
                CheckBonusIDs(
                    tooltip, 
                    currentUpgrade, 
                    maxUpgrade, 
                    bonusIds, 
                    ItemUpgradeTip.bonusIds[ItemUpgradeTip.conquestUpgradeIndexes[itemId]]
                )
            elseif ItemUpgradeTip.valorUpgradeIndexes[itemId] ~= nil then
                -- Hardcoded valor item IDs (unused at the moment, but maybe this ends up being needed for int weapons)
                CheckBonusIDs(
                    tooltip, 
                    currentUpgrade, 
                    maxUpgrade, 
                    bonusIds, 
                    ItemUpgradeTip.bonusIds[ItemUpgradeTip.valorUpgradeIndexes[itemId]]
                )
            elseif tonumber(classID) == 2 and ItemUpgradeTip.weaponUpgradeIndexes[subclassID] ~= nil then
                -- Weapon
                CheckBonusIDs(
                    tooltip, 
                    currentUpgrade, 
                    maxUpgrade, 
                    bonusIds, 
                    ItemUpgradeTip.bonusIds[ItemUpgradeTip.weaponUpgradeIndexes[subclassID]]
                )
            elseif tonumber(classID) == 4 and ItemUpgradeTip.armorUpgradeIndexes[equipLoc] ~= nil then
                -- Armor
                CheckBonusIDs(
                    tooltip, 
                    currentUpgrade, 
                    maxUpgrade, 
                    bonusIds, 
                    ItemUpgradeTip.bonusIds[ItemUpgradeTip.armorUpgradeIndexes[equipLoc]]
                )
            end

            return
        end
    end
end
ItemUpgradeTip.HandleTooltipSetItem = HandleTooltipSetItem

--- Handles updating a currency tooltip to add additional information (currently only Valor is supported)
---@param tooltip GameTooltipTemplate
---@param tooltipData table
local function HandleTooltipCurrency(tooltip, tooltipData)
    if tooltip ~= _G.GameTooltip then
        return
    end

    if tooltipData.id == ItemUpgradeTip.currencyIds.Valor and tooltipData.type == Enum.TooltipDataType.Currency then
        local currencyInfo = C_CurrencyInfo.GetCurrencyInfo(tooltipData.id)

        if not currencyInfo.maxQuantity then
            -- Valor is not capped at the moment
            return
        end

        local quantity, maxQuantity = currencyInfo.quantityEarnedThisWeek, currencyInfo.maxQuantity
        local remaining = {
            mPlus = "|cffcc00000 |cffffffee" .. L["(Weekly cap reached)"] .. "|r",
            rareCallings = "|cffcc00000 |cffffffee" .. L["(Weekly cap reached)"] .. "|r",
            epicCallings = "|cffcc00000 |cffffffee" .. L["(Weekly cap reached)"] .. "|r"
        }
        if quantity < maxQuantity then
            local outstanding = maxQuantity - quantity
            remaining.mPlus = "|cffffffee" .. ceil(outstanding / 135) .. "|r"
            --remaining.rareCallings = "|cffffffee" .. ceil(outstanding / 35) .. "|r"
            --remaining.epicCallings = "|cffffffee" .. ceil(outstanding / 50) .. "|r"
        end

        tooltip:AddLine("\n")
        tooltip:AddLine(L["M+ runs left: %s"]:format(remaining.mPlus))
        --tooltip:AddLine(L["Rare callings left: %s"]:format(remaining.rareCallings))
        --tooltip:AddLine(L["Epic callings left: %s"]:format(remaining.epicCallings))
    end
end
ItemUpgradeTip.HandleTooltipCurrency = HandleTooltipCurrency


-- Tooltip integration
TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Currency, ItemUpgradeTip.HandleTooltipCurrency)
TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, ItemUpgradeTip.HandleTooltipSetItem)
