---@class ItemUpgradeTipInfoDisplayMixin: Frame
---@field Inset InsetFrameTemplate
---@field AuthorHeading ItemUpgradeTipHeadingMixin
---@field Author ItemUpgradeTipSubHeadingMixin
---@field VersionHeading ItemUpgradeTipHeadingMixin
---@field Version ItemUpgradeTipSubHeadingMixin
---@field EngageHeading ItemUpgradeTipHeadingMixin
---@field BugReportLink ItemUpgradeTipCopyAndPasteMixin
ItemUpgradeTipInfoDisplayMixin = {}

function ItemUpgradeTipInfoDisplayMixin:OnLoad()
    ItemUpgradeTip:AddSkinnableFrame("InsetFrame", self.Inset)
end

function ItemUpgradeTipInfoDisplayMixin:OnShow()
end

function ItemUpgradeTipInfoDisplayMixin:OnHide()
end
