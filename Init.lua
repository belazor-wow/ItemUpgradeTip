-- ----------------------------------------------------------------------------
-- AddOn Namespace
-- ----------------------------------------------------------------------------
local AddOnFolderName = ... ---@type string
local private = select(2, ...) ---@class PrivateNamespace

---@type Array<CurrencyInfo>
private.currencyInfo = {}

---@type Dictionary<integer>
private.currencyIds = {}

---@type Array<boolean>
private.currencyIndexes = {}

---@type { [number]: fun(tooltip: GameTooltip, itemId: number, itemLink: string, currentUpgrade: number, maxUpgrade: number, bonusIds: table<number, number>): boolean }
private.upgradeHandlers = {}

---@type Array<MythicPlusInfo>
private.mythicPlusInfo = {}

---@type Localizations
local L = LibStub("AceLocale-3.0"):GetLocale(AddOnFolderName)

-- Export constants into the global scope (for XML frames to use)
for key, value in pairs(L) do
    _G["ITEMUPGRADETIP_L_" .. key] = value
end

-- ----------------------------------------------------------------------------
-- Preferences
-- ----------------------------------------------------------------------------
local metaVersion = C_AddOns.GetAddOnMetadata(AddOnFolderName, "Version")
local isDevelopmentVersion = metaVersion == "@project-version@"

local buildVersion = isDevelopmentVersion and "Development Version" or metaVersion

---@type table
local Options

---@type table
local defaultValues = {
    CompactTooltips = false,
    ModifierKey = "NONE",

    DisabledIntegrations = {},

    -- TestSubToggle = false,
    -- TestSubRange = 5,
}

---@class Preferences
---@field OptionsFrame Frame
---@field SettingsPanel Frame
local Preferences = {
    DisabledIntegrations = {},
    DefaultValues = {
        profile = defaultValues,
    },
    GetOptions = function()
        if not Options then
            local DB = private.DB.profile

            local count = 1
            local function increment() count = count + 1; return count end;

            Options = {
                type = "group",
                name = ("%s - %s"):format(AddOnFolderName, buildVersion),
                childGroups = "tab",
                args = {
                    general = {
                        order = increment(),
                        type = "group",
                        name = L["GENERAL"],
                        args = {
                            compactTooltips = {
                                order = increment(),
                                type = "toggle",
                                name = L["COMPACT_TOOLTIPS"],
                                desc = L["COMPACT_TOOLTIPS_DESC"],
                                width = "double",
                                get = function()
                                    return DB.CompactTooltips
                                end,
                                set = function(arg1, value)
                                    DB.CompactTooltips = value
                                end,
                                defaultValue = function()
                                    return defaultValues.CompactTooltips
                                end
                            },

                            modifierKey = {
                                order = increment(),
                                type = "select",
                                name = L["MODIFIER_KEY"],
                                desc = L["MODIFIER_KEY_DESC"],
                                values = {
                                    NONE = NONE_KEY,
                                    ALT = ALT_KEY,
                                    CTRL = CTRL_KEY,
                                    SHIFT = SHIFT_KEY
                                },
                                width = "double",
                                get = function()
                                    return DB.ModifierKey
                                end,
                                set = function(_, value)
                                    DB.ModifierKey = value
                                end,
                                defaultValue = function()
                                    return defaultValues.ModifierKey
                                end
                            },

                            separatorIntegrations = {
                                order = increment(),
                                type = "header",
                                name = L["DISABLED_INTEGRATIONS"],
                            },

                            disabledIntegrationsHelp = {
                                order = increment(),
                                type = "description",
                                name = L["DISABLED_INTEGRATIONS_DESC"],
                            },

                            -- testSubCategory = {
                            --     order = increment(),
                            --     type = "group",
                            --     name = "Test Sub Category",

                            --     args = {
                            --         testSubHeader = {
                            --             order = increment(),
                            --             type = "header",
                            --             name = "Test Sub Header",
                            --         },

                            --         testSubExecute = {
                            --             order = increment(),
                            --             type = "execute",
                            --             name = "Test Sub Execute",
                            --             func = function()
                            --                 DevTools_Dump("ere")
                            --             end
                            --         },

                            --         testSubToggle = {
                            --             order = increment(),
                            --             type = "toggle",
                            --             name = "Test Sub Toggle",
                            --             desc = "This is just a test",
                            --             width = "double",
                            --             get = function()
                            --                 return DB.TestSubToggle
                            --             end,
                            --             set = function(_, value)
                            --                 DB.TestSubToggle = value
                            --             end,
                            --             defaultValue = defaultValues.TestSubToggle
                            --         },

                            --         testSubKeybind = {
                            --             type = "keybinding",
                            --             action = "ASSISTTARGET",
                            --             order = increment(),
                            --         },

                            --         testSubRange = {
                            --             type = "range",
                            --             name = "Test Sub Range",
                            --             desc = "This is just a test",
                            --             min = 1,
                            --             max = 20,
                            --             step = 1,
                            --             set = function(_, value) DB.TestSubRange = value end,
                            --             get = function() return DB.TestSubRange end,
                            --             order = increment(),
                            --             width = "double",
                            --             defaultValue = defaultValues.TestSubRange
                            --         },
                            --     }
                            -- }
                        }
                    }
                },
            }

            for upgradeHandler, optionTable in pairs(private.Preferences.DisabledIntegrations) do
                optionTable.get = function()
                    return DB.DisabledIntegrations[upgradeHandler]
                end

                optionTable.set = function(_, value)
                    DB.DisabledIntegrations[upgradeHandler] = value
                end

                optionTable.defaultValue = function()
                    return defaultValues.DisabledIntegrations[upgradeHandler]
                end

                Options.args.general.args["disabledIntegrations_" .. upgradeHandler] = optionTable
            end

            -- Get the option table for profiles
	        --Options.args.profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(private.DB)
        end

        return Options
    end,
    ---@param self Preferences
    InitializeDatabase = function(self)
        return LibStub("AceDB-3.0"):New(AddOnFolderName .. "DB", self.DefaultValues, true)
    end,
    ---@param self Preferences
    SetupOptions = function(self)
        LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable(AddOnFolderName, self.GetOptions, true)
        --self.OptionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions(AddOnFolderName)
        self.OptionsFrame = LibStub("BlizzConfigDialog-1.0"):AddToBlizOptions(AddOnFolderName)
    end,
}

private.Preferences = Preferences
