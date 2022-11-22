local addonName, ItemUpgradeTip = ...

--Constants
local gameLocale = GetLocale()

-- Init Libs
do
    ItemUpgradeTip.Libs = {}
    local function AddLib(name, libname, silent)
        if not name then return end
        ItemUpgradeTip.Libs[name] = _G.LibStub(libname, silent)
    end

    AddLib("AceLocale", "AceLocale-3.0", true)
end

-- Locale doesn't exist yet, make it exist
ItemUpgradeTip.L = ItemUpgradeTip.Libs.AceLocale:GetLocale("ItemUpgradeTip")