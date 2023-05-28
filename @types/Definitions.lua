---@meta

-- ----------------------------------------------------------------------------
-- Types
-- ----------------------------------------------------------------------------
---@class Array<T>: { [integer]: T }
---@class Dictionary<T>: { [string]: T }
---@class Localizations: Dictionary<string>


-- ----------------------------------------------------------------------------
-- Flightstone Upgrade Data
-- ----------------------------------------------------------------------------
---@class flightstoneUpgradeData
---@field id string
---@field name string
---@field color ColorMixin
---@field icon fileID|integer
---@field itemId integer?
---@field fragment flightstoneUpgradeFragmentData?
---@field currencyId number?

---@class flightstoneUpgradeFragmentData
---@field name string
---@field icon fileID|integer
---@field itemId integer

---@class flightstoneUpgradeCostData
---@field whelpCrests number
---@field drakeCrests number
---@field wyrmCrests number
---@field aspectCrests number
---@field flightstones number


-- ----------------------------------------------------------------------------
-- Flightstone Bonus Data
-- ----------------------------------------------------------------------------
---@class flightstoneBonusData
---@field itemLevel number
---@field rank number
---@field upgradeLevel number
---@field maxUpgradeLevel number
---@field whelpCrestCost number
---@field drakeCrestCost number
---@field wyrmCrestCost number
---@field aspectCrestCost number
---@field flightstoneCosts table { [number] : number }


-- ----------------------------------------------------------------------------
-- Bonus Data
-- ----------------------------------------------------------------------------
---@class bonusData
---@field currencyId number
---@field amount number
---@field toMax number