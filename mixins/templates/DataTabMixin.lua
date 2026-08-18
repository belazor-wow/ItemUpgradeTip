---@class ItemUpgradeTipDataTabDisplayMixin: Frame
---@field OnLoad fun()
---@field displayMode string
---@field ResultsListing ItemUpgradeTipResultsListingMixin
---@field ResultsListingInset InsetFrameTemplate
---@field DataProvider ItemUpgradeTipDisplayDataProviderMixin
ItemUpgradeTipDataTabDisplayMixin = {}

function ItemUpgradeTipDataTabDisplayMixin:OnLoad()
    self.ResultsListing:Init(self.DataProvider)

    ItemUpgradeTip:AddSkinnableFrame("InsetFrame", self.ResultsListingInset)
end
