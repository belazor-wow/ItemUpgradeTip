-- ----------------------------------------------------------------------------
-- AddOn Namespace
-- ----------------------------------------------------------------------------
local private = select(2, ...) ---@class PrivateNamespace
local L = private.L

--- Updates the tooltip when a Heirloom is the item in question
---@diagnostic disable: unused-local
---@param tooltip GameTooltip
---@param itemId number
---@param itemLink string
---@param currentUpgrade number
---@param maxUpgrade number
---@param bonusIds table<number, number>
---@return boolean
local function HandleHeirloom(tooltip, itemId, itemLink, currentUpgrade, maxUpgrade, bonusIds)
    if not C_Heirloom.GetHeirloomInfo(itemId) then
        return false
    end

    tooltip:AddLine("\n")

    tooltip:AddLine("|cffa335ee" .. L["Heirloom Upgrades"] .. "|r")
    tooltip:AddTexture("Interface/Icons/inv_staff_13")

    local upgradesRemaining = maxUpgrade - currentUpgrade
    if upgradesRemaining == 0 then
        tooltip:AddLine("|cffffffee" .. L["Item upgraded to max level!"] .. "|r")
    else
        tooltip:AddLine("|cffffffee" .. L["Upgrade level: %d / %d"]:format(currentUpgrade, maxUpgrade) .. "|r")
    end

    return true
end

table.insert(private.upgradeHandlers, HandleHeirloom)
