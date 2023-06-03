-- ----------------------------------------------------------------------------
-- AddOn Namespace
-- ----------------------------------------------------------------------------
local AddOnFolderName = ... ---@type string
local private = select(2, ...) ---@class PrivateNamespace

---@type Localizations
local L = LibStub("AceLocale-3.0"):GetLocale(AddOnFolderName)

-- Add preferences
private.Preferences.DefaultValues.profile.DisabledIntegrations.Heirloom = false;
private.Preferences.DisabledIntegrations.Heirloom = {
    type = "toggle",
    name = L["Heirloom Upgrades"],
    order = 5,
    width = "double",
}

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
    if private.DB.profile.DisabledIntegrations.Heirloom then
        private.Debug("Heirloom integration is disabled");

        return false
    end

    if not C_Heirloom.GetHeirloomInfo(itemId) then
        private.Debug(itemId, "was not an Heirloom item");
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

    private.Debug(itemId, "did not match a Heirloom bonus ID");
    return true
end

table.insert(private.upgradeHandlers, HandleHeirloom)
