--> Colors
local black = Color( 0, 0, 0 )
local textColor = Color( 255, 255, 255 )
local buttonColor = Color( 58, 184, 255 )

local PANEL = {}

AccessorFunc( PANEL, "clickEvent", "ClickEvent" )

function PANEL:Init()
    self:SetContentAlignment( 5 )
    self:SetText( "" )
    self:SetTextColor( textColor )
    self:SetBGColor( buttonColor )
end

function PANEL:Paint( width, height )
    draw.RoundedBox( 0, 0, 0, width, height, black )

    if self.Hovered then
        draw.RoundedBox( 0, 2, 2, width - 4, height - 4, self.hoverColor )
    else
        draw.RoundedBox( 0, 2, 2, width - 4, height - 4, self.bgColor )
    end
end

function PANEL:DoClick()
    if self.clickEvent then
        surface.PlaySound( "UI/buttonclick.wav" )
        self.clickEvent()
    end
end

function PANEL:SetBGColor( color )
    self.bgColor = color
    self.hoverColor = Color( color.r, color.g, color.b, 200 )
end

function PANEL:GetBGColor()
    return self.bgColor
end

vgui.Register( "OptiRP_Basic_Button", PANEL, "DButton" )