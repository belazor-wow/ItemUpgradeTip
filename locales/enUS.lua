-- ----------------------------------------------------------------------------
-- AddOn Namespace
-- ----------------------------------------------------------------------------
local AddOnFolderName = ... ---@type string
local private = select(2, ...) ---@class PrivateNamespace

---@type Localizations
local L = LibStub("AceLocale-3.0"):NewLocale(AddOnFolderName, "enUS", true, true)

if not L then
    return
end

L["(Weekly cap reached)"] = true
L["M+ runs left: %s"] = true
L["Rare callings left: %s"] = true
L["Epic callings left: %s"] = true
L["Heirloom Upgrades"] = true
L["%s Upgrades"] = true
L["Item upgraded to max level!"] = true
L["Item can be upgraded to max level!"] = true
L["Upgrade level: %d / %d"] = true
L["Cost for next level:"] = true
L["Cost to upgrade to max level:"] = true
L["Currency remaining after upgrading:"] = true
L["Currency needed for max level:"] = true
L["Flightstone / Crest Upgrades"] = true
L["Whelpling's Crests"] = true
L["Drake's Crests"] = true
L["Wyrm's Crests"] = true
L["Aspect's Crests"] = true
L["Whelpling's Crest Fragments"] = true
L["Drake's Crest Fragments"] = true
L["Wyrm's Crest Fragments"] = true
L["Aspect's Crest Fragments"] = true
L["Flightstones"] = true
L["General"] = true
L["Honor Upgrades"] = true
L["Conquest Upgrades"] = true
L["Disabled Integrations"] = true
L["If you wish to disable certain tooltip integrations, you can do so via the options below."] = true
