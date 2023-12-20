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
                                set = function(_, value)
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
                                set = function(_, value)
                                    DB.ModifierKey = value
                                end,
                            },

                            DisabledIntegrations = {
                                type = "group",

                                name = L["DISABLED_INTEGRATIONS"],
                                desc = L["DISABLED_INTEGRATIONS_DESC"],

                                args = {}
                            },

                            --[[
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
                            ]]
                        }
                    }
                },
            }

            for upgradeHandler, optionTable in pairs(private.Preferences.DisabledIntegrations) do
                optionTable.get = function()
                    return DB.DisabledIntegrations[upgradeHandler]
                end

                optionTable.set = function(_, value)
                    DB.DisabledIntegrations[upgradeHandler] = value;
                end
                
                Options.args.general.args.DisabledIntegrations.args[upgradeHandler] = optionTable
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
        --[[
        local options = self.GetOptions();
        local category, layout = Settings.RegisterVerticalLayoutCategory(AddOnFolderName)

        local tempOrders = {}
        local tempNames = {}

        local function strsplit(inputStr, sep)
            if sep == nil then
                    sep = "%s"
            end
            local t={}
            for str in string.gmatch(inputStr, "([^"..sep.."]+)") do
                    table.insert(t, str)
            end
            return t
        end

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

        local function BuildSortedOptionsTable(group, keySort)
            for k, v in pairs(group.args) do
                tinsert(keySort, k)

                tempOrders[k] = v.order
                tempNames[k] = v.name
            end

            table.sort(keySort, compareOptions)
        end

        local keySort = {}

        BuildSortedOptionsTable(options, keySort);
        for i = 1, #keySort do
            local key = keySort[i]
            local value = options.args[key]

            layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(value.name));

            local keySort2 = {}
            BuildSortedOptionsTable(value, keySort2);

            for j = 1, #keySort2 do
                local key2 = keySort2[j]
                local value2 = value.args[key2]

                local defaultValue = self.DefaultValues.profile[key2]

                local function OnSettingChanged(_, setting, val)
                    local variable = setting:GetVariable()
                    private.DB.profile[variable] = val
                end

                if value2.type == "toggle" then
                    local setting = Settings.RegisterAddOnSetting(category, value2.name, key2, type(defaultValue), defaultValue)
                    Settings.CreateCheckBox(category, setting, value2.desc)
                    Settings.SetOnValueChangedCallback(key2, OnSettingChanged)
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
                    Settings.SetOnValueChangedCallback(key2, OnSettingChanged)
                    setting:SetValue(value2.get())
                elseif value2.type == "group" then
                    local subcategory, sublayout = Settings.RegisterVerticalLayoutSubcategory(category, value2.name);

                    sublayout:AddInitializer(CreateSettingsListSectionHeaderInitializer(value2.desc));

                    local keySort3 = {}
                    BuildSortedOptionsTable(value2, keySort3);

                    for j = 1, #keySort3 do
                        local key3 = keySort3[j]
                        local value3 = value2.args[key3]

                        local subDefaultValue = self.DefaultValues.profile[key2][key3]

                        local function OnSubSettingChanged(_, setting, val)
                            local variable = setting:GetVariable()
                            private.DB.profile[key2][variable] = val
                        end

                        if value3.type == "toggle" then
                            local setting = Settings.RegisterAddOnSetting(subcategory, value3.name, key3, type(subDefaultValue), subDefaultValue)
                            Settings.CreateCheckBox(subcategory, setting, value3.desc)
                            Settings.SetOnValueChangedCallback(key3, OnSubSettingChanged)
                            setting:SetValue(value3.get())
                        elseif value3.type == "select" then
                            local function GetOptions()
                                local container = Settings.CreateControlTextContainer()
                                for optionsKey, optionsValue in pairs(value3.values) do
                                    container:Add(optionsKey, optionsValue)
                                end
                                return container:GetData()
                            end

                            local setting = Settings.RegisterAddOnSetting(subcategory, value3.name, key3, type(subDefaultValue), subDefaultValue)
                            Settings.CreateDropDown(subcategory, setting, GetOptions, value3.desc)
                            Settings.SetOnValueChangedCallback(key3, OnSubSettingChanged)
                            setting:SetValue(value3.get())
                        end
                    end

                    Settings.RegisterAddOnCategory(subcategory);
                end
            end
        end

        Settings.RegisterAddOnCategory(category)

        return category;
        ]]

        LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable(AddOnFolderName, self.GetOptions)
        self.OptionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions(AddOnFolderName)
    end,
}

private.Preferences = Preferences
