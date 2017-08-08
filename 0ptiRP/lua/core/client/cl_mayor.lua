--[[---------------------------------------------------------------------------
	Panel du maire créé par 0binar
	
	Eh petit con ! Arrêtes de fouiner !
--]]---------------------------------------------------------------------------

--[[---------------------------------------------------------------------------
    Colors
--]]---------------------------------------------------------------------------
local black      = Color( 0, 0, 0 )
local frameColor = Color( 50, 50, 50 )
local closeColor = Color( 255, 0, 0 )
local closeHover = Color( 255, 50, 50 )
local textColor  = Color( 255, 255, 255 )

--[[---------------------------------------------------------------------------
    Dimensions
--]]---------------------------------------------------------------------------
local frameWidth, frameHeight = 500, 350
local categoryHeight = 100

net.Receive( "MayorMenu_Frame", function(len)
    --> Main frame
    local frame = vgui.Create( "OptiRP_Basic_Frame" )
    frame:SetTitle( "Gestion de la ville" )
    frame:SetTextBG( Color( 255, 0, 0 ) )

    --> Lottery button
    local lottery = vgui.Create("DButton", frame)
    lottery:SetSize( 80, 30 )
    lottery:SetPos( 40, 40 )
    lottery:SetText( "" )

    function lottery:Paint( width, height )
        --> Black Outline
        draw.RoundedBox( 0, 0, 0, width, height, black )

        --> Main outline
        if self.Hovered then
            draw.RoundedBox( 0, 1, 1, width - 2, height - 2, Color( 255, 0, 0 ) )

            --> Shadow
            draw.RoundedBox( 0, 1, height - 3, width - 2, 2, Color( 200, 0, 0 ) )
            draw.RoundedBox( 0, width - 3, 1, 2, height - 2, Color( 200, 0, 0 ) )

        else
            draw.RoundedBox( 0, 1, 1, width - 2, height - 2, Color( 200, 0, 0 ) )

            --> Shadow
            draw.RoundedBox( 0, 1, height - 3, width - 2, 2, Color( 150, 0, 0 ) )
            draw.RoundedBox( 0, width - 3, 1, 2, height - 2, Color( 150, 0, 0 ) )
        end

        --> Text
        surface.SetFont( "Trebuchet24" )
        surface.SetTextColor( textColor )
        surface.SetTextPos( 8, 2 )
        surface.DrawText( "Loterie" )
    end

    --> Curfew button
    local curfew = vgui.Create("DButton", frame)
    curfew:SetSize( 110, 30 )
    curfew:SetPos( 140, 40 )
    curfew:SetText( "" )

    function curfew:Paint( width, height )
        --> Black Outline
        draw.RoundedBox( 0, 0, 0, width, height, black )

        --> Main outline
        if self.Hovered then
            draw.RoundedBox( 0, 1, 1, width - 2, height - 2, Color( 255, 0, 0 ) )

            --> Shadow
            draw.RoundedBox( 0, 1, height - 3, width - 2, 2, Color( 200, 0, 0 ) )
            draw.RoundedBox( 0, width - 3, 1, 2, height - 2, Color( 200, 0, 0 ) )

        else
            draw.RoundedBox( 0, 1, 1, width - 2, height - 2, Color( 200, 0, 0 ) )

            --> Shadow
            draw.RoundedBox( 0, 1, height - 3, width - 2, 2, Color( 150, 0, 0 ) )
            draw.RoundedBox( 0, width - 3, 1, 2, height - 2, Color( 150, 0, 0 ) )
        end

        --> Text
        surface.SetFont( "Trebuchet24" )
        surface.SetTextColor( textColor )
        surface.SetTextPos( 8, 2 )
        surface.DrawText( "Couvre-feu" )
    end

    --> Laws button
    local laws = vgui.Create("DButton", frame)
    laws:SetSize( 60, 30 )
    laws:SetPos( 260, 40 )
    laws:SetText( "" )

    function laws:Paint( width, height )
        --> Black Outline
        draw.RoundedBox( 0, 0, 0, width, height, black )

        --> Main outline
        if self.Hovered then
            draw.RoundedBox( 0, 1, 1, width - 2, height - 2, Color( 255, 0, 0 ) )

            --> Shadow
            draw.RoundedBox( 0, 1, height - 3, width - 2, 2, Color( 200, 0, 0 ) )
            draw.RoundedBox( 0, width - 3, 1, 2, height - 2, Color( 200, 0, 0 ) )

        else
            draw.RoundedBox( 0, 1, 1, width - 2, height - 2, Color( 200, 0, 0 ) )

            --> Shadow
            draw.RoundedBox( 0, 1, height - 3, width - 2, 2, Color( 150, 0, 0 ) )
            draw.RoundedBox( 0, width - 3, 1, 2, height - 2, Color( 150, 0, 0 ) )
        end

        --> Text
        surface.SetFont( "Trebuchet24" )
        surface.SetTextColor( textColor )
        surface.SetTextPos( 8, 2 )
        surface.DrawText( "Lois" )
    end
end)