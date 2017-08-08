hook.Add("PlayerBindPress", "FAdmin_voicemuted", function(ply, bind, pressed)
    if ply:FAdmin_GetGlobal("FAdmin_voicemuted") and string.find(string.lower(bind), "voicerecord") then return true end
    -- The voice muting is not done clientside, this is just so people know they can't talk
end)

FAdmin.StartHooks["VoiceMute"] = function()
    FAdmin.Messages.RegisterNotification{
        name = "voicemute",
        hasTarget = true,
        message = {"instigator", " a muté la voix de ", "targets", " ", "extraInfo.1"},
        readExtraInfo = function()
            local time = net.ReadUInt(16)
            return {time == 0 and FAdmin.PlayerActions.commonTimes[time] or string.format("pour %s", FAdmin.PlayerActions.commonTimes[time] or (time .. " secondes"))}
        end
    }

    FAdmin.Messages.RegisterNotification{
        name = "voiceunmute",
        hasTarget = true,
        message = {"instigator", " a rétabli la voix de ", "targets"}
    }

    FAdmin.Access.AddPrivilege("Voicemute", 2)
    FAdmin.Commands.AddCommand("Voicemute", nil, "<Player>")
    FAdmin.Commands.AddCommand("UnVoicemute", nil, "<Player>")

    FAdmin.ScoreBoard.Player:AddActionButton(function(ply)
            if ply:FAdmin_GetGlobal("FAdmin_voicemuted") then return "Rétablir la voix (générale)" end
            return "Muter la voix (générale)"
        end,

    function(ply)
        if ply:FAdmin_GetGlobal("FAdmin_voicemuted") then return "fadmin/icons/voicemute" end
        return "fadmin/icons/voicemute", "fadmin/icons/disable"
    end,
    Color(255, 130, 0, 255),

    function(ply) return FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), "Voicemute", ply) end,
    function(ply, button)
        if not ply:FAdmin_GetGlobal("FAdmin_voicemuted") then
            FAdmin.PlayerActions.addTimeMenu(function(secs)
                RunConsoleCommand("_FAdmin", "Voicemute", ply:UserID(), secs)
                button:SetImage2("null")
                button:SetText("Rétablir la voix (générale)")
                button:GetParent():InvalidateLayout()
            end)
        else
            RunConsoleCommand("_FAdmin", "UnVoicemute", ply:UserID())
        end

        button:SetImage2("fadmin/icons/disable")
        button:SetText("Muter la voix (générale)")
        button:GetParent():InvalidateLayout()
    end)

    FAdmin.ScoreBoard.Player:AddActionButton(function(ply)
        return ply.FAdminMuted and "Unmute voice" or "Mute voice"
    end,
    function(ply)
        if ply.FAdminMuted then return "fadmin/icons/voicemute" end
        return "fadmin/icons/voicemute", "fadmin/icons/disable"
    end,
    Color(255, 130, 0, 255),

    true,

    function(ply, button)
        ply:SetMuted(not ply.FAdminMuted)
        ply.FAdminMuted = not ply.FAdminMuted

        if ply.FAdminMuted then button:SetImage2("null") button:SetText("Rétablir la voix") button:GetParent():InvalidateLayout() return end

        button:SetImage2("fadmin/icons/disable")
        button:SetText("Muter la voix")
        button:GetParent():InvalidateLayout()
    end)

    FAdmin.ScoreBoard.Main.AddPlayerRightClick("Mute/Unmute", function(ply, Panel)
        ply:SetMuted(not ply.FAdminMuted)
        ply.FAdminMuted = not ply.FAdminMuted
    end)
end
