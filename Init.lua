-- ----------------------------------------------------------------------------
-- AddOn Namespace
-- ----------------------------------------------------------------------------
local AddOnFolderName = ... ---@type string
local private = select(2, ...) ---@class PrivateNamespace

---@class private.currencyInfo : { [number]: CurrencyInfo }
private.currencyInfo = {}

---@class private.currencyIds : { [string]: number }
private.currencyIds = {}

---@class private.currencyIndexes : { [number]: boolean }
private.currencyIndexes = {}

---@class private.upgradeHandlers : { [number]: fun(tooltip: GameTooltip, itemId: number, itemLink: string, currentUpgrade: number, maxUpgrade: number, bonusIds: table<number, number>): boolean }
private.upgradeHandlers = {}

---@type Localizations
local L = LibStub("AceLocale-3.0"):GetLocale(AddOnFolderName)

-- ----------------------------------------------------------------------------
-- Preferences
-- ----------------------------------------------------------------------------
local metaVersion = GetAddOnMetadata(AddOnFolderName, "Version")
local isDevelopmentVersion = metaVersion == "@project-version@"

local buildVersion = isDevelopmentVersion and "Development Version" or metaVersion

---@type table
local Options

---@class Preferences
---@field OptionsFrame Frame
local Preferences = {
    DisabledIntegrations = {
        help = {
            type = "description",
            name = L["If you wish to disable certain tooltip integrations, you can do so via the options below."],
            order = 1,
        }
    },
    DefaultValues = {
        profile = {
            CompactTooltips = false,

            DisabledIntegrations = {},
        },
    },
    GetOptions = function()
        if not Options then
            local DB = private.DB.profile

            local count = 1;
            local function increment() count = count + 1; return count end;

            Options = {
                type = "group",
                name = ("%s - %s"):format(AddOnFolderName, buildVersion),
                childGroups = "tab",
                args = {
                    general = {
                        order = increment(),
                        type = "group",
                        name = L["General"],
                        args = {
                            CompactTooltips = {
                                order = increment(),
                                type = "toggle",
                                name = L["Compact tooltips"],
                                desc = L["If enabled, compatible tooltip integrations will use a more compact format rather than showing the full upgrade info."],
                                width = "double",
                                get = function()
                                    return DB.CompactTooltips
                                end,
                                set = function(info, value)
                                    DB.CompactTooltips = value
                                end,
                            },

                            DisabledIntegrations = {
                                order = increment(),
                                type = "group",
                                inline = true,
                                name = L["Disabled Integrations"],
                                get = function(info)
                                    return DB.DisabledIntegrations[info[#info]]
                                end,
                                set = function(info, value)
                                    DB.DisabledIntegrations[info[#info]] = value;
                                end,
                                args = private.Preferences.DisabledIntegrations,
                            },
                        }
                    }
                },
            }

            -- Get the option table for profiles
	        Options.args.profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(private.DB)
        end

        return Options
    end,
    ---@param self Preferences
    InitializeDatabase = function(self)
        return LibStub("AceDB-3.0"):New(AddOnFolderName .. "DB", self.DefaultValues, true)
    end,
    ---@param self Preferences
    SetupOptions = function(self)
        LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable(AddOnFolderName, self.GetOptions)
        self.OptionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions(AddOnFolderName)
    end,
}

private.Preferences = Preferences
