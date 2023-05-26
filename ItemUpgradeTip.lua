local _, ItemUpgradeTip = ...
local L = ItemUpgradeTip.L

local flightstoneUpgradePattern = ITEM_UPGRADE_TOOLTIP_FORMAT_STRING:gsub("%%d", "(%%d+)"):gsub("%%s", "(%%a+)")

ItemUpgradeTip.currencyInfo = {};

--- Parses the given upgrade costs to generate a table for use in tooltip
---@param upgradeItem table
---@param upgradeCost table
local function ParseUpgradeCost(upgradeCost)
    local lines = {}

    for _, upgradeItem in ipairs(ItemUpgradeTip.flightstoneUpgradeData) do
        if upgradeCost[upgradeItem.id] ~= nil and upgradeCost[upgradeItem.id] > 0 then
            local icon = upgradeItem.icon and CreateTextureMarkup(upgradeItem.icon, 64, 64, 0, 0, 0.1, 0.9, 0.1, 0.9) or ""
            local costLine = ""
            local fragmentName, fragmentId, fragmentIcon = nil, nil, nil

            if upgradeItem.currencyId ~= nil then
                -- Check currency against cap
                local currencyInfo = ItemUpgradeTip.currencyInfo[upgradeItem.currencyId]
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
ItemUpgradeTip.ParseUpgradeCost = ParseUpgradeCost

--- Generic currency handler based on bonusInfo table
---@param tooltip GameTooltipTemplate
---@param currentUpgrade number
---@param maxUpgrade number
---@param bonusInfo table
local function HandleCurrency(tooltip, currentUpgrade, maxUpgrade, bonusInfo)
    local upgradesRemaining = maxUpgrade - currentUpgrade
    local currencyInfo = ItemUpgradeTip.currencyInfo[bonusInfo.currencyId]
    if not currencyInfo then
        return
    end

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


--- Updates the tooltip when a Flightstone item is the item in question
---@param tooltip GameTooltipTemplate
---@param itemGroup number
---@param bonusId number
---@param bonusInfo table
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

    local nextUpgradeCost = nil
    local nextUpgrade = nil
    local maxUpgrade = nil
    local totalUpgradeCosts = {
        whelpCrests = 0,
        drakeCrests = 0,
        wyrmCrests = 0,
        aspectCrests = 0,
        flightstones = 0,
    }

    for bonusID, upgradeInfo in pairs(ItemUpgradeTip.flightstoneBonusIds) do
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

    if nextUpgradeCost then
        local nextLevelLines = ItemUpgradeTip.ParseUpgradeCost(nextUpgradeCost)
        local totalLines = ItemUpgradeTip.ParseUpgradeCost(totalUpgradeCosts)

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

            if totalLines then
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
ItemUpgradeTip.HandleFlightstones = HandleFlightstones

--- Checks for valid bonus IDs and chains call to HandleCurrency if found
---@param tooltip GameTooltipTemplate
---@param currentUpgrade number
---@param maxUpgrade number
---@param bonusIds table
---@param bonusTable table
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

--- Checks for valid bonus IDs and chains call to HandleFlightstones if found
---@param tooltip GameTooltipTemplate
---@param itemLink string
---@param bonusIds table
---@return boolean
local function CheckFlightstoneBonusIDs(tooltip, itemLink, bonusIds)
    local equipLoc = select(9, GetItemInfo(itemLink))

    local itemGroup = ItemUpgradeTip.itemUpgradeIndexes[equipLoc]
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
        local bonusInfo = ItemUpgradeTip.flightstoneBonusIds[bonusIds[i]]
        if bonusInfo ~= nil then
            HandleFlightstones(tooltip, itemGroup, i, bonusInfo, itemLink)
            return true
        end
    end

    return false
end
ItemUpgradeTip.CheckFlightstoneBonusIDs = CheckFlightstoneBonusIDs

--- Handles updating an item tooltip to add additional information about upgrade costs
---@param tooltip GameTooltipTemplate
---@param tooltipData table
local function HandleTooltipSetItem(tooltip, tooltipData)
    if tooltip ~= _G.GameTooltip then
        return
    end

    for _, tooltipLine in pairs(tooltipData.lines) do
        local rank, currentUpgrade, maxUpgrade = tooltipLine.leftText:match(flightstoneUpgradePattern)
        if rank and currentUpgrade and maxUpgrade then
            if currentUpgrade == maxUpgrade then
                return
            end

            if C_Heirloom.GetHeirloomInfo(tooltipData.id) then
                HandleHeirloom(tooltip, currentUpgrade, maxUpgrade)
                return
            end

            local _, itemLink = tooltip:GetItem()

            local itemString = string.match(itemLink, "item:([%-?%d:]+)")
            if not itemString then
                return
            end

            local bonusIds = {}
            local itemSplit = {}

            for v in string.gmatch(itemString, "(%d*:?)") do
                if v == ":" then
                    itemSplit[#itemSplit + 1] = 0
                else
                    itemSplit[#itemSplit + 1] = string.gsub(v, ":", "")
                end
            end

            local itemId = tonumber(itemSplit[1])

            for index = 1, tonumber(itemSplit[13]) do
                bonusIds[#bonusIds + 1] = tonumber(itemSplit[13 + index])
            end

            -- Scan all bonusIds for Anima upgrade bonus IDs
            if CheckBonusIDs(tooltip, currentUpgrade, maxUpgrade, bonusIds, ItemUpgradeTip.bonusIds[ItemUpgradeTip.animaUpgradeIndex]) then return end

            -- Scan all bonusIds for Flightstone upgrade bonus IDs
            if CheckFlightstoneBonusIDs(tooltip, itemLink, bonusIds) then return end

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
            end

            return
        end
    end
end
ItemUpgradeTip.HandleTooltipSetItem = HandleTooltipSetItem

local function OnEvent(_, event, ...)
    if event == "PLAYER_LOGIN" then
        for currencyId, _ in pairs(ItemUpgradeTip.currencyIndexes) do
            ItemUpgradeTip.currencyInfo[currencyId] = C_CurrencyInfo.GetCurrencyInfo(currencyId)
        end
    elseif event == "CURRENCY_DISPLAY_UPDATE" then
        local currencyId, _, quantity = ...
        if currencyId and quantity and quantity > 0 then
            if ItemUpgradeTip.currencyIndexes[currencyId] then
                -- Refresh the entire currency info in case there's info other than quantity that also updated
                ItemUpgradeTip.currencyInfo[currencyId] = C_CurrencyInfo.GetCurrencyInfo(currencyId)
            end
        end
    end
end
ItemUpgradeTip.OnEvent = OnEvent

-- Tooltip integration
TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, ItemUpgradeTip.HandleTooltipSetItem)

-- Event helper
local loadHelper = CreateFrame("Frame");
loadHelper:SetScript("OnEvent", ItemUpgradeTip.OnEvent);
loadHelper:RegisterEvent("PLAYER_LOGIN");
loadHelper:RegisterEvent("CURRENCY_DISPLAY_UPDATE");

--[[
local honorItemIds = {
    201764,
    201770,
    201771,
    201774
}

for v in pairs(honorItemIds) do
    local equipLoc, _, _, classID, subclassID = select(9, GetItemInfo(honorItemIds[v]))
    local upgradeIndex = equipLoc;

    if equipLoc == "INVTYPE_WEAPONOFFHAND" then
        upgradeIndex = 6
    elseif equipLoc == "INVTYPE_TRINKET" or equipLoc == "INVTYPE_WRIST" or equipLoc == "INVTYPE_CLOAK" or equipLoc == "INVTYPE_FINGER" or equipLoc == "INVTYPE_NECK" then
        upgradeIndex = 7
    elseif equipLoc == "INVTYPE_FEET" or equipLoc == "INVTYPE_HAND" or equipLoc == "INVTYPE_SHOULDER" or equipLoc == "INVTYPE_WAIST" then
        upgradeIndex = 8
    elseif equipLoc == "INVTYPE_HEAD" or equipLoc == "INVTYPE_LEGS" or equipLoc == "INVTYPE_CHEST" or equipLoc == "INVTYPE_ROBE" then
        upgradeIndex = 9
    elseif equipLoc == "INVTYPE_2HWEAPON" then
        upgradeIndex = 11
    end

    print("["..honorItemIds[v].."] = "..(upgradeIndex or equipLoc)..",")
end
]]