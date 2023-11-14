---@meta

-- ----------------------------------------------------------------------------
-- Types
-- ----------------------------------------------------------------------------
---@class Array<T>: { [integer]: T }
---@class Dictionary<T>: { [string]: T }
---@class Localizations: Dictionary<string>


-- ----------------------------------------------------------------------------
-- Keystone Info
-- ----------------------------------------------------------------------------
---@class KeystoneInfo
---@field itemId integer
---@field instanceId integer
---@field keyLevel integer
---@field affix1 integer
---@field affix2 integer
---@field affix3 integer
---@field affix4 integer


-- ----------------------------------------------------------------------------
-- Flightstone Upgrade Data
-- ----------------------------------------------------------------------------
---@class FlightstoneUpgradeData
---@field id string
---@field name string
---@field color ColorMixin
---@field icon fileID|integer
---@field itemId integer?
---@field currencyId integer?

---@class FlightstoneUpgradeCostData
---@field whelpCrests integer
---@field drakeCrests integer
---@field wyrmCrests integer
---@field aspectCrests integer
---@field flightstones integer


-- ----------------------------------------------------------------------------
-- Flightstone Bonus Data
-- ----------------------------------------------------------------------------
---@class FlightstoneBonusData
---@field itemLevel integer
---@field rank integer
---@field upgradeLevel integer
---@field upgradeGroup integer


-- ----------------------------------------------------------------------------
-- Honor Bonus Data
-- ----------------------------------------------------------------------------
---@class HonorBonusData
---@field itemLevel integer
---@field upgradeLevel integer
---@field maxUpgradeLevel integer


-- ----------------------------------------------------------------------------
-- Bonus Data
-- ----------------------------------------------------------------------------
---@class BonusData
---@field currencyId integer
---@field amount integer
---@field toMax integer


-- ----------------------------------------------------------------------------
-- Mythic+ Table Data
-- ----------------------------------------------------------------------------
---@class MythicPlusInfo
---@field keyLevel integer|string
---@field lootDrops integer
---@field vaultReward integer
---@field currencyId integer
---@field color ColorMixin
---@field currencyInfo CurrencyInfo?


-- ----------------------------------------------------------------------------
-- Raid Table Data
-- ----------------------------------------------------------------------------
---@class RaidInfo
---@field boss integer|string
---@field lfr integer
---@field normal integer
---@field heroic integer
---@field mythic integer

---@class RaidCurrencyInfo
---@field lfrCurrencyId integer
---@field lfrColor ColorMixin
---@field lfrCurrencyName string
---@field lfrCurrencyInfo CurrencyInfo?
---@field normalCurrencyId integer
---@field normalColor ColorMixin
---@field normalCurrencyName string
---@field normalCurrencyInfo CurrencyInfo?
---@field heroicCurrencyId integer
---@field heroicColor ColorMixin
---@field heroicCurrencyName string
---@field heroicCurrencyInfo CurrencyInfo?
---@field mythicCurrencyId integer
---@field mythicColor ColorMixin
---@field mythicCurrencyName string
---@field mythicCurrencyInfo CurrencyInfo?


-- ----------------------------------------------------------------------------
-- Upgrade Table Data
-- ----------------------------------------------------------------------------
---@class UpgradeTrackInfo
---@field itemLevel integer
---@field upgrade1 UpgradeTrackUpgrade
---@field upgrade2 UpgradeTrackUpgrade?
---@field currencyId integer
---@field currencyName string
---@field color ColorMixin
---@field currencyInfo CurrencyInfo?

---@class UpgradeTrackUpgrade
---@field rank integer
---@field upgradeLevel integer
---@field maxUpgradeLevel integer


-- ----------------------------------------------------------------------------
-- Crafting Data
-- ----------------------------------------------------------------------------
---@class CraftingInfo
---@field itemLevel integer
---@field itemId integer
---@field rank integer
---@field itemInfo table?
