---@class ItemUpgradeTipInfoDisplayMixin : Frame
---@field Inset Frame
---@field AuthorHeading Frame
---@field Author Frame
---@field VersionHeading Frame
---@field Version Frame
---@field EngageHeading Frame
---@field BugReportLink ItemUpgradeTipCopyAndPasteMixin
ItemUpgradeTipInfoDisplayMixin = {}

function ItemUpgradeTipInfoDisplayMixin:OnLoad()
    ItemUpgradeTip:AddSkinnableFrame("InsetFrame", self.Inset)
end

function ItemUpgradeTipInfoDisplayMixin:OnShow()
end

function ItemUpgradeTipInfoDisplayMixin:OnHide()
end
