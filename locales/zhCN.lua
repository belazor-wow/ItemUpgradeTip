-- ----------------------------------------------------------------------------
-- AddOn Namespace
-- ----------------------------------------------------------------------------
local AddOnFolderName = ... ---@type string
local private = select(2, ...) ---@class PrivateNamespace

---@type Localizations
local L = LibStub("AceLocale-3.0"):NewLocale(AddOnFolderName, "zhCN", false)

if not L then
    return
end

L["(Weekly cap reached)"] = "(已达到每周上限)"
L["M+ runs left: %s"] = "史诗+次数还需: %s"
L["Rare callings left: %s"] = "英雄副本还需: %s"
L["Epic callings left: %s"] = "史诗副本还需: %s"
L["Heirloom Upgrades"] = "传家宝升级"
L["%s Upgrades"] = "%s 升级"
L["Item upgraded to max level!"] = "物品已升到最大等级物品！"
L["Item can be upgraded to max level!"] = "物品可以升级到满等级！"
L["Upgrade level: %d / %d"] = "提升等级: %d / %d"
L["Cost for next level:"] = "下一个等级需要:"
L["Cost to upgrade to max level:"] = "升级到满等级花费:"
L["Currency needed for max level:"] = "到满等级所需货币:"
L["Currency remaining after upgrading:"] = "升级后剩余货币:"
L["Flightstone / Crest Upgrades"] = "飞珑石/ 纹章升级"
L["Whelpling's Crests"] = "雏龙的暗影烈焰纹章"
L["Drake's Crests"] = "幼龙的暗影烈焰纹章"
L["Wyrm's Crests"] = "魔龙的暗影烈焰纹章"
L["Aspect's Crests"] = "守护巨龙的暗影烈焰纹章"
L["Whelpling's Crest Fragments"] = "雏龙的暗影烈焰纹章碎片"
L["Drake's Crest Fragments"] = "幼龙的暗影烈焰纹章碎片"
L["Wyrm's Crest Fragments"] = "魔龙的暗影烈焰纹章"
L["Aspect's Crest Fragments"] = "守护巨龙的暗影烈焰纹章碎片"
L["Flightstones"] = "飞珑石"
