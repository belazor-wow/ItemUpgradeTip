---@class ItemUpgradeTipSubHeadingMixin
---@field OnLoad fun()
---@field HeadingText FontString
---@field subHeadingTextKeyValue string?
ItemUpgradeTipSubHeadingMixin = {}

function ItemUpgradeTipSubHeadingMixin:InitializeSubHeading()
    if self.subHeadingTextKeyValue ~= nil then
        self.HeadingText:SetText(self.subHeadingTextKeyValue)
    end
end

function ItemUpgradeTipSubHeadingMixin:SetText(newHeading)
    self.subHeadingTextKeyValue = newHeading
    self:OnLoad()
end
