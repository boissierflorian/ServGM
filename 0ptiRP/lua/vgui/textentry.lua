local PANEL = {}

function PANEL:Init()
    self:SetMultiline(true)
    self:SetDrawLanguageID(false)
end

vgui.Register( "OptiRP_TextEntry", PANEL, "DTextEntry")