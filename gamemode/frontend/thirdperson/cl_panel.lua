--------------------------------------------------------------------------------------------------------
local PANEL = {}

--------------------------------------------------------------------------------------------------------
function PANEL:Init()
    self:SetTitle(L("thirdpersonConfig"))
    self:SetSize(300, 140)
    self:Center()
    self:MakePopup()
    self.list = self:Add("DPanel")
    self.list:Dock(FILL)
    self.list:DockMargin(0, 0, 0, 0)
    local cfg = self.list:Add("DNumSlider")
    cfg:Dock(TOP)
    cfg:SetText("Height")
    cfg:SetMin(0)
    cfg:SetMax(30)
    cfg:SetDecimals(0)
    cfg:SetConVar("lia_tp_vertical")
    cfg:DockMargin(10, 0, 0, 5)
    local cfg = self.list:Add("DNumSlider")
    cfg:Dock(TOP)
    cfg:SetText("Horizontal")
    cfg:SetMin(-30)
    cfg:SetMax(30)
    cfg:SetDecimals(0)
    cfg:SetConVar("lia_tp_horizontal")
    cfg:DockMargin(10, 0, 0, 5)
    local cfg = self.list:Add("DNumSlider")
    cfg:Dock(TOP)
    cfg:SetText("Distance")
    cfg:SetMin(0)
    cfg:SetMax(100)
    cfg:SetDecimals(0)
    cfg:SetConVar("lia_tp_distance")
    cfg:DockMargin(10, 0, 0, 5)
end

--------------------------------------------------------------------------------------------------------
vgui.Register("liaTPConfig", PANEL, "DFrame")
--------------------------------------------------------------------------------------------------------