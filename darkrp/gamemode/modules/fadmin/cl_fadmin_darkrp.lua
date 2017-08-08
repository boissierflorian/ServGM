if not FAdmin or not FAdmin.StartHooks then return end
FAdmin.StartHooks["DarkRP"] = function()
    -- DarkRP information:
    FAdmin.ScoreBoard.Player:AddInformation("Argent", function(ply) if LocalPlayer():IsAdmin() then return DarkRP.formatMoney(ply:getDarkRPVar("money")) end end)
    FAdmin.ScoreBoard.Player:AddInformation("Steam", function(ply) return ply:SteamName() end)
    FAdmin.ScoreBoard.Player:AddInformation("Recherché", function(ply) if ply:getDarkRPVar("wanted") then return tostring(ply:getDarkRPVar("wantedReason") or "N/A") end end)
    FAdmin.ScoreBoard.Player:AddInformation("Lien communauté", function(ply) return FAdmin.SteamToProfile(ply) end)
    FAdmin.ScoreBoard.Player:AddInformation("Rang", function(ply)
        if FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), "SeeAdmins") then
            return ply:GetUserGroup()
        end
    end)
    FAdmin.ScoreBoard.Player:AddInformation("Wanted reason", function(ply)
        if ply:isWanted() and LocalPlayer():isCP() then
            return ply:getWantedReason()
        end
    end)

    -- Warrant
    FAdmin.ScoreBoard.Player:AddActionButton("Warrant", "fadmin/icons/message", Color(0, 0, 200, 255),
        function(ply) return LocalPlayer():isCP() end,
        function(ply, button)
            Derma_StringRequest("Raison du mandat", "Spécifiez la raison du mandat", "", function(Reason)
                RunConsoleCommand("darkrp", "warrant", ply:SteamID(), Reason)
            end)
        end)

    --wanted
    FAdmin.ScoreBoard.Player:AddActionButton(function(ply)
            return ((ply:getDarkRPVar("wanted") and "Unw") or "W") .. "anted"
        end,
        function(ply) return "fadmin/icons/jail", ply:getDarkRPVar("wanted") and "fadmin/icons/disable" end,
        Color(0, 0, 200, 255),
        function(ply) return LocalPlayer():isCP() end,
        function(ply, button)
            if not ply:getDarkRPVar("wanted")  then
                Derma_StringRequest("Avis de recherche", "Spécifiez la raison de l'avis de recherche", "", function(Reason)
                    RunConsoleCommand("darkrp", "wanted", ply:SteamID(), Reason)
                end)
            else
                RunConsoleCommand("darkrp", "unwanted", ply:UserID())
            end
        end)

    --Teamban
    local function teamban(ply, button)
        local menu = DermaMenu()

        local Padding = vgui.Create("DPanel")
        Padding:SetPaintBackgroundEnabled(false)
        Padding:SetSize(1,5)
        menu:AddPanel(Padding)

        local Title = vgui.Create("DLabel")
        Title:SetText("  Jobs:\n")
        Title:SetFont("UiBold")
        Title:SizeToContents()
        Title:SetTextColor(color_black)
        menu:AddPanel(Title)

        local command = "teamban"
        local uid = ply:UserID()
        for k,v in SortedPairsByMemberValue(RPExtraTeams, "name") do
            local submenu = menu:AddSubMenu(v.name)
            submenu:AddOption("2 minutes",     function() RunConsoleCommand("darkrp", command, uid, k, 120)  end)
            submenu:AddOption("30 minutes",  function() RunConsoleCommand("darkrp", command, uid, k, 1800) end)
            submenu:AddOption("1 heures",       function() RunConsoleCommand("darkrp", command, uid, k, 3600) end)
            submenu:AddOption("Jusqu'à un reboot", function() RunConsoleCommand("darkrp", command, uid, k, 0)    end)
        end
        menu:Open()
    end
    FAdmin.ScoreBoard.Player:AddActionButton("Ban from job", "fadmin/icons/changeteam", Color(200, 0, 0, 255),
    function(ply) return FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), "DarkRP_AdminCommands", ply) end, teamban)

    local function teamunban(ply, button)
        local menu = DermaMenu()

        local Padding = vgui.Create("DPanel")
        Padding:SetPaintBackgroundEnabled(false)
        Padding:SetSize(1,5)
        menu:AddPanel(Padding)

        local Title = vgui.Create("DLabel")
        Title:SetText("  Jobs:\n")
        Title:SetFont("UiBold")
        Title:SizeToContents()
        Title:SetTextColor(color_black)
        menu:AddPanel(Title)

        local command = "teamunban"
        local uid = ply:UserID()
        for k,v in SortedPairsByMemberValue(RPExtraTeams, "name") do
            menu:AddOption(v.name, function() RunConsoleCommand("darkrp", command, uid, k) end)
        end
        menu:Open()
    end
    FAdmin.ScoreBoard.Player:AddActionButton("Unban from job", function() return "fadmin/icons/changeteam", "fadmin/icons/disable" end, Color(200, 0, 0, 255),
    function(ply) return FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), "DarkRP_AdminCommands", ply) end, teamunban)
end
