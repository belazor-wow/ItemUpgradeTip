---@class ItemUpgradeTipStringCellTemplateMixin: ItemUpgradeTipCellMixin & TableBuilderCellMixin
---@field OnLineEnter fun()
---@field OnLineLeave fun()
---@field UpdateTooltip fun()?
---@field continuableContainer ContinuableContainer?
---@field columnName string
---@field text FontString
ItemUpgradeTipStringCellTemplateMixin = CreateFromMixins(ItemUpgradeTipCellMixin, TableBuilderCellMixin)

---@param columnName string
function ItemUpgradeTipStringCellTemplateMixin:Init(columnName)
    self.columnName = columnName

    self.text:SetJustifyH("LEFT")
end

---@param rowData table
---@param index number
function ItemUpgradeTipStringCellTemplateMixin:Populate(rowData, index)
    ItemUpgradeTipCellMixin.Populate(self, rowData, index)

    self.text:SetText(rowData[self.columnName])
end

function ItemUpgradeTipStringCellTemplateMixin:ShowTooltip()
    if not self.rowData[self.columnName .. "ItemLink"] and not self.rowData[self.columnName .. "CurrencyId"] and not self.rowData[self.columnName .. "ItemId"] then
        return
    end

    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    self.UpdateTooltip = self.OnEnter

    if self.rowData[self.columnName .. "ItemLink"] then
        GameTooltip:SetHyperlink(self.rowData[self.columnName .. "ItemLink"])
    elseif self.rowData[self.columnName .. "CurrencyId"] then
        GameTooltip:SetCurrencyByID(self.rowData[self.columnName .. "CurrencyId"])
    elseif self.rowData[self.columnName .. "ItemId"] then
        GameTooltip:SetItemByID(self.rowData[self.columnName .. "ItemId"])
    end

    GameTooltip:Show()
end

-- Used to prevent tooltip triggering too late and interfering with another
-- tooltip
function ItemUpgradeTipStringCellTemplateMixin:CancelContinuable()
    if self.continuableContainer ~= nil then
        self.continuableContainer:Cancel()
        self.continuableContainer = nil
    end
end

function ItemUpgradeTipStringCellTemplateMixin:OnHide()
    self.text:Hide()
    self:CancelContinuable()
end

function ItemUpgradeTipStringCellTemplateMixin:OnShow()
    self.text:Show()
end

function ItemUpgradeTipStringCellTemplateMixin:OnEnter()
    if ItemUpgradeTipCellMixin.OnEnter ~= nil then
        ItemUpgradeTipCellMixin.OnEnter()
    end

    self:CancelContinuable()

    self:ShowTooltip()
end

function ItemUpgradeTipStringCellTemplateMixin:OnLeave()
    if ItemUpgradeTipCellMixin.OnLeave ~= nil then
        ItemUpgradeTipCellMixin.OnLeave()
    end

    self.UpdateTooltip = nil
    self:CancelContinuable()
    GameTooltip:Hide()
end
