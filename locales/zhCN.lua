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
L["Rare callings left: %s"] = "英雄次数还需: %s"
L["Epic callings left: %s"] = "史诗次数还需: %s"
L["Heirloom Upgrades"] = "传家宝升级"
L["%s Upgrades"] = "%s 升级"
L["Item upgraded to max level!"] = "物品已升到最大等级物品！"
L["Item can be upgraded to max level!"] = "物品可以升级到满等级！"
L["Upgrade level: %d / %d"] = "提升等级: %d / %d"
L["Cost for next level:"] = "下一个等级:"
L["Cost to upgrade to max level:"] = "升到满等级:"
L["Currency needed for max level:"] = "到满等级所需货币:"
L["Currency remaining after upgrading:"] = "升级后剩余货币:"
L["Flightstone / Crest Upgrades"] = "飞珑石/ 纹章升级"
L["Whelpling's Crests"] = "雏龙的暗影烈焰纹章"
L["Drake's Crests"] = "幼龙的暗影烈焰纹章"
L["Wyrm's Crests"] = "魔龙的暗影烈焰纹章"
L["Aspect's Crests"] = "守护巨龙的暗影烈焰纹章"
L["Flightstones"] = "飞珑石"
L["General"] = "选项"
L["Anima Upgrades"] = "心能"
L["Honor Upgrades"] = "荣誉点数"
L["Conquest Upgrades"] = "征服点数"
L["Disabled Integrations"] = "选择需要禁用功能"
L["If you wish to disable certain tooltip integrations, you can do so via the options below."] = "如果您希望禁用某些功能提示，可以通过选择以下选项来关闭提示。"
L["Compact tooltips"] = "简约显示"
L["If enabled, compatible tooltip integrations will use a more compact format rather than showing the full upgrade info."] = "如果启用，兼容的鼠标提示将使用更简约的格式，而不是显示完整的信息。"
L["Next Upgrade (%d):"] = "下个等级 (%d):"
L["Max Upgrade (%d):"] = "满等级 (%d):"
