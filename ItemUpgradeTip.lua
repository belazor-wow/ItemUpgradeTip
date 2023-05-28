-- ----------------------------------------------------------------------------
-- AddOn Namespace
-- ----------------------------------------------------------------------------
local AddOnFolderName = ... ---@type string
local private = select(2, ...) ---@class PrivateNamespace
local L = private.L

local ITEM_UPGRADE_LEVEL = ITEM_UPGRADE_TOOLTIP_FORMAT:gsub("%%d+", "(%%d+)")  -- Upgrade Level: %d/%d
local ITEM_UPGRADE_TRACK = ITEM_UPGRADE_TOOLTIP_FORMAT_STRING:gsub("%%d", "(%%d+)"):gsub("%%s", "(%%a+)") -- "Upgrade Level: %s %d/%d"

---@class private.currencyInfo : { [number]: CurrencyInfo }
private.currencyInfo = {}

---@class private.currencyIds : { [string]: number }
private.currencyIds = {}

---@class private.currencyIndexes : { [number]: boolean }
private.currencyIndexes = {}

---@class private.upgradeHandlers : { [number]: fun(tooltip: GameTooltip, itemId: number, itemLink: string, currentUpgrade: number, maxUpgrade: number, bonusIds: table<number, number>): boolean }
private.upgradeHandlers = {}

--- Generic currency handler based on bonusInfo table
---@param tooltip GameTooltip
---@param currentUpgrade number
---@param maxUpgrade number
---@param bonusInfo bonusData
function private.HandleCurrency(tooltip, currentUpgrade, maxUpgrade, bonusInfo)
    local upgradesRemaining = maxUpgrade - currentUpgrade
    local currencyInfo = private.currencyInfo[bonusInfo.currencyId]
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

--- Handles updating an item tooltip to add additional information about upgrade costs
---@param tooltip GameTooltip
---@param tooltipData TooltipData
function private.HandleTooltipSetItem(tooltip, tooltipData)
    if tooltip ~= _G.GameTooltip then
        return
    end

    ---@type table<number, boolean>
    local processed = {};   --process each line once

    for i = 1, #tooltipData.lines do
        if not processed[i] then
            ---@type TooltipDataLine
            local tooltipLine = tooltipData.lines[i]

            local currentUpgrade, ---@type number?
                maxUpgrade ---@type number?
            = tooltipLine.leftText:match(ITEM_UPGRADE_LEVEL)

            if not currentUpgrade or not maxUpgrade then
                _, currentUpgrade, maxUpgrade = tooltipLine.leftText:match(ITEM_UPGRADE_TRACK)
            end

            if currentUpgrade and maxUpgrade then
                if currentUpgrade == maxUpgrade then
                    return
                end

                local _, itemLink = tooltip:GetItem()
                if not itemLink then
                    return
                end

                ---@type string?
                local itemString = string.match(itemLink, "item:([%-?%d:]+)")
                if not itemString then
                    return
                end

                ---@type table<number, number>
                local bonusIds = {}

                ---@type table<number,any>
                local itemSplit = {}

                for v in string.gmatch(itemString, "(%d*:?)") do
                    if v == ":" then
                        itemSplit[#itemSplit + 1] = 0
                    else
                        itemSplit[#itemSplit + 1] = string.gsub(v, ":", "")
                    end
                end

                ---@type number?
                local itemId = tonumber(itemSplit[1])
                if not itemId then
                    return
                end

                ---@type number?
                local numBonusIds = tonumber(itemSplit[13])
                if not numBonusIds then
                    return
                end

                for index = 1, numBonusIds do
                    bonusIds[#bonusIds + 1] = tonumber(itemSplit[13 + index])
                end

                processed[i] = true;

                for j = 1, #private.upgradeHandlers do
                    local callback = private.upgradeHandlers[j]

                    if type(callback) == "function" and callback(tooltip, itemId, itemLink, currentUpgrade, maxUpgrade, bonusIds) then return end
                end

                return
            end
        end
    end
end

function private.OnEvent(_, event, ...)
    if event == "PLAYER_LOGIN" then
        for currencyId, _ in pairs(private.currencyIndexes) do
            private.currencyInfo[currencyId] = C_CurrencyInfo.GetCurrencyInfo(currencyId)
        end
    elseif event == "CURRENCY_DISPLAY_UPDATE" then
        ---@type number?
        local currencyId = ...

        ---@type number?
        local quantity = select(3, ...)

        if currencyId and quantity then
            if private.currencyIndexes[currencyId] then
                -- Refresh the entire currency info in case there's info other than quantity that also updated
                private.currencyInfo[currencyId] = C_CurrencyInfo.GetCurrencyInfo(currencyId)
            end
        end
    end
end

-- Tooltip integration
TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, private.HandleTooltipSetItem)

-- Event helper
local loadHelper = CreateFrame("Frame");
loadHelper:SetScript("OnEvent", private.OnEvent);
loadHelper:RegisterEvent("PLAYER_LOGIN");
loadHelper:RegisterEvent("CURRENCY_DISPLAY_UPDATE");
