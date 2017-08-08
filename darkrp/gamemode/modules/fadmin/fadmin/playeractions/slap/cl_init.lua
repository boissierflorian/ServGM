local Damages = {0, 1, 10, 50, 100, 500, 9999999--[[for the 12-year-olds]]}
local Repetitions = {[1] = "une fois", [5] = "5 fois", [10] = "10 fois", [50] = "50 fois", [100] = "100 fois"}

FAdmin.StartHooks["Slap"] = function()
    FAdmin.Messages.RegisterNotification{
        name = "slap",
        hasTarget = true,
        message = {"instigator", " a slap ", "targets"},
    }

    FAdmin.Access.AddPrivilege("Slap", 2)
    FAdmin.Commands.AddCommand("Slap", nil, "<Player>", "[Amount]", "[Repetitions]")

    -- Right click option
    FAdmin.ScoreBoard.Main.AddPlayerRightClick("Slap", function(ply)
        RunConsoleCommand("_FAdmin", "Slap", ply:UserID())
    end)

    -- Slap option in player menu
    FAdmin.ScoreBoard.Player:AddActionButton("Slap", "fadmin/icons/slap", Color(255, 130, 0, 255), function(ply) return FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), "Slap", ply) end, function(ply)
        local menu = DermaMenu()

        local Padding = vgui.Create("DPanel")
        Padding:SetPaintBackgroundEnabled(false)
        Padding:SetSize(1,5)
        menu:AddPanel(Padding)

        local Title = vgui.Create("DLabel")
        Title:SetText("  Dégâts:\n")
        Title:SetFont("UiBold")
        Title:SizeToContents()
        Title:SetTextColor(color_black)
        menu:AddPanel(Title)

        for k,v in ipairs(Damages) do
            local SubMenu = menu:AddSubMenu(v, function() RunConsoleCommand("_FAdmin", "slap", ply:UserID(), v) end)

            local SubMenuTitle = vgui.Create("DLabel")
            SubMenuTitle:SetText("  " .. v .. " dégâts\n")
            SubMenuTitle:SetFont("UiBold")
            SubMenuTitle:SizeToContents()
            SubMenuTitle:SetTextColor(color_black)

            SubMenu:AddPanel(SubMenuTitle)

            for reps, Name in SortedPairs(Repetitions) do
                local uid = ply:UserID()
                SubMenu:AddOption(Name, function() RunConsoleCommand("_FAdmin", "slap", uid, v, reps) end)
            end
        end
        menu:Open()
    end)
end
