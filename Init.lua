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

---@class Preferences
---@field OptionsFrame Frame
local Preferences = {
    DisabledIntegrations = {},
    DefaultValues = {
        profile = {
            CompactTooltips = false,
            ModifierKey = "NONE",

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
                        name = L["GENERAL"],
                        args = {
                            CompactTooltips = {
                                order = increment(),
                                type = "toggle",
                                name = L["COMPACT_TOOLTIPS"],
                                desc = L["COMPACT_TOOLTIPS_DESC"],
                                width = "double",
                                get = function()
                                    return DB.CompactTooltips
                                end,
                                set = function(info, value)
                                    DB.CompactTooltips = value
                                end
                            },

                            ModifierKey = {
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
                                set = function(info, value)
                                    DB.ModifierKey = value
                                end,
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
                            }
                        }
                    }
                },
            }

            for upgradeHandler, optionTable in pairs(private.Preferences.DisabledIntegrations) do
                optionTable.get = function(info)
                    return DB.DisabledIntegrations[info[#info]]
                end

                optionTable.set = function(info, value)
                    DB.DisabledIntegrations[info[#info]] = value;
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
        local options = self.GetOptions();
        local category, layout = Settings.RegisterVerticalLayoutCategory(AddOnFolderName)

        local tempOrders = {}
        local tempNames = {}

        local function compareOptions(a,b)
            if not a then
                return true
            end
            if not b then
                return false
            end
            local OrderA, OrderB = tempOrders[a] or 100, tempOrders[b] or 100
            if OrderA == OrderB then
                local NameA = (type(tempNames[a]) == "string") and tempNames[a] or ""
                local NameB = (type(tempNames[b]) == "string") and tempNames[b] or ""
                return NameA:upper() < NameB:upper()
            end
            if OrderA < 0 then
                if OrderB >= 0 then
                    return false
                end
            else
                if OrderB < 0 then
                    return true
                end
            end
            return OrderA < OrderB
        end

        local function BuildSortedOptionsTable(group, keySort, opts, options, path, appName)
            for k, v in pairs(group.args) do
                if not opts[k] then
                    tinsert(keySort, k)
                    opts[k] = v
        
                    path[#path+1] = k
                    tempOrders[k] = GetOptionsMemberValue("order", v, options, path, appName)
                    tempNames[k] = GetOptionsMemberValue("name", v, options, path, appName)
                    path[#path] = nil
                end
            end
        
            table.sort(keySort, compareOptions)
        end

        for key, value in pairs(options.args) do
            layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(value.name));

            for key2, value2 in pairs(value.args) do
                local defaultValue = self.DefaultValues.profile[key2]

                if value2.type == "toggle" then
                    local setting = Settings.RegisterAddOnSetting(category, value2.name, key2, type(defaultValue), defaultValue)
                    Settings.CreateCheckBox(category, setting, value2.desc)
                    Settings.SetOnValueChangedCallback(key2, value2.set)
                    setting:SetValue(value2.get())
                elseif value2.type == "select" then
                    local function GetOptions()
                        local container = Settings.CreateControlTextContainer()
                        for optionsKey, optionsValue in pairs(value2.values) do
                            container:Add(optionsKey, optionsValue)
                        end
                        return container:GetData()
                    end

                    local setting = Settings.RegisterAddOnSetting(category, value2.name, key2, type(defaultValue), defaultValue)
                    Settings.CreateDropDown(category, setting, GetOptions, value2.desc)
                    Settings.SetOnValueChangedCallback(key2, value2.set)
                    setting:SetValue(value2.get())
                end
            end
        end

        Settings.RegisterAddOnCategory(category)

        return category;

        --LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable(AddOnFolderName, self.GetOptions)
        --self.OptionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions(AddOnFolderName)
    end,
}

private.Preferences = Preferences
