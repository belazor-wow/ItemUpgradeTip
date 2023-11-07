-- ----------------------------------------------------------------------------
-- AddOn Namespace
-- ----------------------------------------------------------------------------
local AddOnFolderName = ... ---@type string
local private = select(2, ...) ---@class PrivateNamespace

---@type Localizations
local L = LibStub("AceLocale-3.0"):NewLocale(AddOnFolderName, "zhTW", false)

if not L then
    return
end

L["(Weekly cap reached)"] = "(已達到每週上限)"
L["M+ runs left: %s"] = "傳奇+次數還需: %s"
L["Rare callings left: %s"] = "稀有的召喚還需: %s"
L["Epic callings left: %s"] = "史詩的召喚還需: %s"
L["Heirloom Upgrades"] = "傳家寶升級"
L["%s Upgrades"] = "%s 升級"
L["Item upgraded to max level!"] = "物品已升到最大等級！"
L["Item can be upgraded to max level!"] = "物品可以升級到滿等！"
L["Upgrade level: %d / %d"] = "提升等級: %d / %d"
L["Cost for next level:"] = "下個等級花費:"
L["Cost to upgrade to max level:"] = "升到滿等花費:"
L["Currency needed for max level:"] = "到滿等所需通貨:"
L["Currency remaining after upgrading:"] = "升級後剩餘通貨:"
L["Flightstone / Crest Upgrades"] = "龍石 / 紋章升級"
L["Whelpling's Crests"] = "幼龍紋章"
L["Drake's Crests"] = "飛龍紋章"
L["Wyrm's Crests"] = "巨龍紋章"
L["Aspect's Crests"] = "守護巨龍紋章"
L["Flightstones"] = "龍石"
