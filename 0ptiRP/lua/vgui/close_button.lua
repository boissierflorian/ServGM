--> Colors
local bgColor    = Color( 255, 0, 0 )
local hoverColor = Color( 255, 50, 50 )
local textColor  = Color( 255, 255, 255 )

local PANEL = {}

AccessorFunc( PANEL, "bgColor", "BGColor" )
AccessorFunc( PANEL, "hoverColor", "HoverColor" )


function PANEL:Init()
    self:SetSize( 30, 24 )
    self:SetText( "X" )
    self:SetFont( "Trebuchet24" )
    self:SetTextColor( textColor )

    self:SetBGColor( bgColor )
    self:SetHoverColor( hoverColor )
end

function PANEL:Paint( width, height )
    if self.Hovered then
        draw.RoundedBox( 0, 0, 0, width, height, self.hoverColor )
    else
        draw.RoundedBox( 0, 0, 0, width, height, self.bgColor )
    end
end

function PANEL:DoClick()
    if self:GetParent() then
        surface.PlaySound( "UI/buttonclick.wav" )
        self:GetParent():Remove()
    end
end

vgui.Register( "OptiRP_Close_Button", PANEL, "DButton" )