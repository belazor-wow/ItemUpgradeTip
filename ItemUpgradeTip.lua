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
            local itemName, itemLink = tooltip:GetItem()
            local isHeirloom = C_Heirloom.GetHeirloomInfo(tooltipData.id)
            local numBonusIDs, bonusID1, bonusID2, bonusID3, bonusID4, bonusID5, bonusID6 = select(13, strsplit(":", itemLink))

            if isHeirloom then
                ItemUpgradeTip.HandleHeirloom(tooltip, currentUpgrade, maxUpgrade)
            elseif numBonusIDs ~= nil and numBonusIDs ~= "" then
                local bonusIds = {bonusID1, bonusID2, bonusID3, bonusID4, bonusID5, bonusID6}
                for i = 1, tonumber(numBonusIDs) do
                    local bonusInfo = ItemUpgradeTip.bonusIds[tonumber(bonusIds[i])]
                    if bonusInfo ~= nil then
                        ItemUpgradeTip.HandleCurrency(tooltip, currentUpgrade, maxUpgrade, bonusInfo)
                    end
                end
            end
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

        if not currencyInfo.canEarnPerWeek then
            -- Valor is not capped at the moment
            return
        end

        local quantity, maxWeeklyQuantity = currencyInfo.quantityEarnedThisWeek, currencyInfo.maxWeeklyQuantity
        local remaining = {
            mPlus = "|cffcc00000 |cffffffee" .. L["(Weekly cap reached)"] .. "|r",
            rareCallings = "|cffcc00000 |cffffffee" .. L["(Weekly cap reached)"] .. "|r",
            epicCallings = "|cffcc00000 |cffffffee" .. L["(Weekly cap reached)"] .. "|r"
        }
        if quantity < maxWeeklyQuantity then
            local outstanding = maxWeeklyQuantity - quantity
            remaining.mPlus = "|cffffffee" .. ceil(outstanding / 135) .. "|r"
            remaining.rareCallings = "|cffffffee" .. ceil(outstanding / 35) .. "|r"
            remaining.epicCallings = "|cffffffee" .. ceil(outstanding / 50) .. "|r"
        end

        tooltip:AddLine("\n")
        tooltip:AddLine(L["M+ runs left: %s"]:format(remaining.mPlus))
        tooltip:AddLine(L["Rare callings left: %s"]:format(remaining.rareCallings))
        tooltip:AddLine(L["Epic callings left: %s"]:format(remaining.epicCallings))
    end
end
ItemUpgradeTip.HandleTooltipCurrency = HandleTooltipCurrency


-- Tooltip integration
TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Currency, ItemUpgradeTip.HandleTooltipCurrency)
TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, ItemUpgradeTip.HandleTooltipSetItem)
