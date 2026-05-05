---@class ItemUpgradeTipCellMixin: Button
---@field rowData table
---@field index number
---@field OnEnter fun()?
---@field OnLeave fun()?
---@field OnClick fun()?
ItemUpgradeTipCellMixin = {}

---@param rowData table
---@param index number
function ItemUpgradeTipCellMixin:Populate(rowData, index)
    self.rowData = rowData
    self.index = index
end

function ItemUpgradeTipCellMixin:OnEnter()
    ---@type ItemUpgradeTipCellMixin | nil
    local parentButton = self:GetParent()

    if parentButton == nil then
        return
    end

    if parentButton.OnEnter ~= nil then
        parentButton:OnEnter()
    end
end

function ItemUpgradeTipCellMixin:OnLeave()
     ---@type ItemUpgradeTipCellMixin | nil
    local parentButton = self:GetParent()

    if parentButton == nil then
        return
    end

    if parentButton.OnLeave ~= nil then
        parentButton:OnLeave()
    end
end

function ItemUpgradeTipCellMixin:OnClick(...)
    ---@type ItemUpgradeTipCellMixin | nil
    local parentButton = self:GetParent()

    if parentButton == nil then
        return
    end

    if parentButton.OnClick ~= nil then
        parentButton:OnClick(...)
    end
end
