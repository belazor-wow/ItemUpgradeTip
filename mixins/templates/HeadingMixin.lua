---@class ItemUpgradeTipHeadingMixin: Frame
---@field OnLoad fun()
---@field HeadingText FontString
---@field headingTextKeyValue string?
ItemUpgradeTipHeadingMixin = {}

function ItemUpgradeTipHeadingMixin:OnLoad()
    if self.headingTextKeyValue ~= nil then
        self.HeadingText:SetText(self.headingTextKeyValue)
    end
end
