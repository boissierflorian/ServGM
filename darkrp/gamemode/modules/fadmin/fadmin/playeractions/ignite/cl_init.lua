FAdmin.StartHooks["Ignite"] = function()
    FAdmin.Messages.RegisterNotification{
        name = "ignite",
        hasTarget = true,
        message = {"instigator", " a enflammé ", "targets", " ", "extraInfo.1"},
        readExtraInfo = function()
            local time = net.ReadUInt(16)
            return {time == 0 and FAdmin.PlayerActions.commonTimes[time] or string.format("pour %s", FAdmin.PlayerActions.commonTimes[time] or (time .. " secondes"))}
        end
    }

    FAdmin.Messages.RegisterNotification{
        name = "unignite",
        hasTarget = true,
        message = {"instigator", " a lénifié ", "targets"},
    }

    FAdmin.Access.AddPrivilege("Ignite", 2)
    FAdmin.Commands.AddCommand("Ignite", nil, "<Player>", "[time]")
    FAdmin.Commands.AddCommand("unignite", nil, "<Player>")

    FAdmin.ScoreBoard.Player:AddActionButton(function(ply) return (ply:FAdmin_GetGlobal("FAdmin_ignited") and "Éteindre") or "Enflammer" end,
    function(ply) local disabled = (ply:FAdmin_GetGlobal("FAdmin_ignited") and "fadmin/icons/disable") or nil return "fadmin/icons/ignite", disabled end,
    Color(255, 130, 0, 255),
    function(ply) return FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), "Ignite", ply) end,
    function(ply, button)
        if not ply:FAdmin_GetGlobal("FAdmin_ignited") then
            RunConsoleCommand("_FAdmin", "ignite", ply:UserID())
            button:SetImage2("fadmin/icons/disable")
            button:SetText("Extinguish")
            button:GetParent():InvalidateLayout()
        else
            RunConsoleCommand("_FAdmin", "unignite", ply:UserID())
            button:SetImage2("null")
            button:SetText("Ignite")
            button:GetParent():InvalidateLayout()
        end
    end)
end
