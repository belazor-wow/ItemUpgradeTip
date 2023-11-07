-- ----------------------------------------------------------------------------
-- AddOn Namespace
-- ----------------------------------------------------------------------------
local AddOnFolderName = ... ---@type string
local private = select(2, ...) ---@class PrivateNamespace

---@type Localizations
local L = LibStub("AceLocale-3.0"):NewLocale(AddOnFolderName, "deDE", false)

if not L then
    return
end

L["%s Upgrades"] = "%s Aufwertungen"
L["(Weekly cap reached)"] = "(Wöchentliches Limit erreicht)"
L["Anima Upgrades"] = "Anima Aufwertungen"
L["Aspect's Crests"] = "Wappen des Aspekts"
L["Compact tooltips"] = "Kompakte Tooltips"
L["Conquest Upgrades"] = "Eroberungs Aufwertungen"
L["Cost for next level:"] = "Kosten für die nächste Stufe:"
L["Cost to upgrade to max level:"] = "Kosten um auf die maximal Stufe aufzuwerten:"
L["Currency needed for max level:"] = "Für die maximal Stufe benötigte Währung:"
L["Currency remaining after upgrading:"] = "Verbleibende Währung nach dem Aufwerten:"
L["Disabled Integrations"] = "Integration deaktivieren"
L["Drake's Crests"] = "Wappen des Drachen"
L["Epic callings left: %s"] = "Epische Berufungen übrig: %s"
L["Flightstone / Crest Upgrades"] = "Flugstein / Wappen Aufwertung"
L["Flightstones"] = "Flugsteine"
L["General"] = "Allgemein"
L["Heirloom Upgrades"] = "Erbstückaufwertungen"
L["Honor Upgrades"] = "Ehren Aufwertungen"
L["If enabled, compatible tooltip integrations will use a more compact format rather than showing the full upgrade info."] = "Wenn diese Option aktiviert ist, verwenden kompatible Tooltip-Integrationen ein kompakteres Format, anstatt die vollständigen Upgrade-Informationen anzuzeigen."
L["If you wish to disable certain tooltip integrations, you can do so via the options below."] = "Wenn bestimmte Tooltip-Integrationen deaktiviert werden sollen, kann dies über die folgenden Optionen gemacht werden."
L["Item can be upgraded to max level!"] = "Gegenstand kann auf die maximal Stufe aufgewertet werden!"
L["Item upgraded to max level!"] = "Gegenstand auf maximal Stufe aufgewertet!"
L["M+ runs left: %s"] = "Noch benötigte M+ Läufe: %s"
L["Max Upgrade (%d):"] = "Max. Aufwertung (%d):"
L["Next Upgrade (%d):"] = "Nächste Aufwertung (%d):"
L["Rare callings left: %s"] = "Seltene Berufungen übrig: %s"
L["Upgrade level: %d / %d"] = "Aufwertungsstufe: %d / %d"
L["Whelpling's Crests"] = "Wappen des Welplings"
L["Wyrm's Crests"] = "Wappen des Wyrms"
