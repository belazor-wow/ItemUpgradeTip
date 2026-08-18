---@class ItemUpgradeTipResultsRowTemplateMixin: Frame
---@field SelectedHighlight Texture
---@field HighlightTexture Texture
---@field NormalTexture Texture
---@field rowData table
---@field dataIndex number
ItemUpgradeTipResultsRowTemplateMixin = {}

function ItemUpgradeTipResultsRowTemplateMixin:OnClick(...)
end

function ItemUpgradeTipResultsRowTemplateMixin:OnEnter(...)
    self.HighlightTexture:Show()
end

function ItemUpgradeTipResultsRowTemplateMixin:OnLeave(...)
    self.HighlightTexture:Hide()
end

---@param rowData table
---@param dataIndex number
function ItemUpgradeTipResultsRowTemplateMixin:Populate(rowData, dataIndex)
    self.rowData = rowData
    self.dataIndex = dataIndex
end
