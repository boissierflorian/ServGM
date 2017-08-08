--> Colors
local black      = Color( 0, 0, 0 )
local lightBlue  = Color( 58, 184, 255 )
local frameColor = Color( 31, 36, 44 )
local titleColor = Color( 255, 255, 255 )

local PANEL = {}

--> Accessors
AccessorFunc( PANEL, "title", "Title" )
AccessorFunc( PANEL, "textBG", "TextBG" )
AccessorFunc( PANEL, "titleLabel", "TitleLabel" )

--> Constants
local defaultWidth = 400
local defaultHeight = 300

function PANEL:Init()
    self.lblTitle:Remove()
    self.lblTitle = nil
    self:SetTitle( "" ) 
    self:SetSize( defaultWidth, defaultHeight )
    self:SetDraggable( false )
    self:ShowCloseButton( false )
    self:MakePopup()

    self:SetTextBG( lightBlue )

    self.closeButton = vgui.Create( "OptiRP_Close_Button", self )
    self.closeButton:SetPos( self:GetWide() - 32, 2 )
end

function PANEL:Paint( width, height )
    --> Main frame
    draw.RoundedBox( 0, 0, 0, width, height, black )
    draw.RoundedBox( 0, 2, 2, width - 4, height - 4, frameColor )

    --> Title BG
    local titleRatio = self:GetTall() * 0.1
    draw.RoundedBox( 0, 2, 2, width - 4, 24, self:GetTextBG() )

    --> Title
    surface.SetFont( "Trebuchet24" )
    surface.SetTextColor( titleColor )
    surface.SetTextPos( 8, 2 )
    surface.DrawText( self:GetTitle() )
end

function PANEL:PerformLayout( width, height )
    self:SizeToContents()
    self:SetPos( ScrW() / 2 - self:GetWide() / 2, ScrH() / 2 - self:GetTall() / 2 )
    self.closeButton:SetPos( self:GetWide() - 32, 2 )
end

vgui.Register( "OptiRP_Basic_Frame", PANEL, "DFrame" )