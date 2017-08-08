local logging
FAdmin.StartHooks["Logging"] = function()
    FAdmin.Access.AddPrivilege("Logging", 3)
    FAdmin.Commands.AddCommand("Logging", function(ply, cmd, args)
        if not FAdmin.Access.PlayerHasPrivilege(ply, "Logging") then FAdmin.Messages.SendMessage(ply, 5, "Privilèges insuffisants!") return false end
        if not tonumber(args[1]) then return end

        local OnOff = (tobool(tonumber(args[1])) and "on") or "off"
		if OnOff == "on" then
			FAdmin.Messages.ActionMessage(ply, player.GetAll(), ply:Nick() .. " a activé les logs ", "Les logs ont été activés ", "Activation des logs ")
		else
			FAdmin.Messages.ActionMessage(ply, player.GetAll(), ply:Nick() .. " a desactivé les logs ", "Les logs ont été desactivés ", "Désactivation des logs ")
		end

        RunConsoleCommand("FAdmin_logging", args[1])

        FAdmin.SaveSetting("FAdmin_logging", args[1])

        return true, OnOff
    end)
    logging = GetConVar("FAdmin_logging")
end

function FAdmin.Log(text)
    if not text or text == "" then return end
    if not logging or not logging:GetBool() then return end

    ServerLog("[FAdmin] " .. text .. "\n")
end

hook.Add("PlayerGiveSWEP", "FAdmin_Log", function(ply, class)
    if not IsValid(ply) or not ply:IsPlayer() then return end
    FAdmin.Log(ply:Nick() .. " (" .. ply:SteamID() .. ") s'est donné un/un(e) " .. (class or "Unknown"))
end)

hook.Add("PlayerSpawnedSENT", "FAdmin_Log", function(ply, ent)
    if not IsValid(ply) or not ply:IsPlayer() or not IsValid(ent) then return end
    FAdmin.Log(ply:Nick() .. " (" .. ply:SteamID() .. ") a fait spawn " .. (ent:GetClass() or "Unknown"))
end)

hook.Add("PlayerSpawnSWEP", "FAdmin_Log", function(ply, class)
    if not IsValid(ply) or not ply:IsPlayer() then return end
    FAdmin.Log(ply:Nick() .. " (" .. ply:SteamID() .. ") a fait spawn " .. (class or "Unknown"))
end)

hook.Add("PlayerSpawnedProp", "FAdmin_Log", function(ply, model, ent)
    if not IsValid(ply) or not ply:IsPlayer() or not IsValid(ent) then return end

    for k, v in pairs(player.GetAll()) do
        if v:IsAdmin() then
            v:PrintMessage(HUD_PRINTCONSOLE, ply:Nick() .. " (" .. ply:SteamID() .. ") a fait spawn " .. (model or "Unknown"))
        end
    end

    FAdmin.Log(ply:Nick() .. " (" .. ply:SteamID() .. ") a fait spawn " .. (model or "Unknown"))
end)

hook.Add("PlayerSpawnedNPC", "FAdmin_Log", function(ply, ent)
    if not IsValid(ply) or not ply:IsPlayer() or not IsValid(ent) then return end
    FAdmin.Log(ply:Nick() .. " (" .. ply:SteamID() .. ") a fait spawn " .. (ent:GetClass() or "Unknown"))
end)

hook.Add("PlayerSpawnedVehicle", "FAdmin_Log", function(ply, ent)
    if not IsValid(ply) or not ply:IsPlayer() or not IsValid(ent) then return end
    FAdmin.Log(ply:Nick() .. " (" .. ply:SteamID() .. ") a fait spawn " .. (ent:GetClass() or "Unknown"))
end)

hook.Add("PlayerSpawnedEffect", "FAdmin_Log", function(ply, model, ent)
    if not IsValid(ply) or not ply:IsPlayer() or not model then return end
    FAdmin.Log(ply:Nick() .. " (" .. ply:SteamID() .. ") a fait spawn " .. (model or "Unknown"))
end)

hook.Add("PlayerSpawnedRagdoll", "FAdmin_Log", function(ply, model, ent)
    if not IsValid(ply) or not ply:IsPlayer() or not IsValid(ent) then return end
    FAdmin.Log(ply:Nick() .. " (" .. ply:SteamID() .. ") a fait spawn " .. (model or "Unknown"))
end)

hook.Add("CanTool", "FAdmin_Log", function(ply, tr, toolclass)
    if not IsValid(ply) or not ply:IsPlayer() then return end
    FAdmin.Log(ply:Nick() .. " (" .. ply:SteamID() .. ") a utiliser l'outil: " .. (toolclass or "Unknown"))
end)

hook.Add("PlayerLeaveVehicle", "FAdmin_Log", function(ply, vehicle)
    if not IsValid(ply) or not ply:IsPlayer() then return end
    FAdmin.Log(ply:Nick() .. " (" .. ply:SteamID() .. ") est sorti de " .. (IsValid(vehicle) and vehicle:GetClass() or "Unknown"))
end)

hook.Add("OnNPCKilled", "FAdmin_Log", function(NPC, Killer, Weapon)
    if not IsValid(NPC) then return end
    FAdmin.Log(NPC:GetClass() .. " a été tué par " .. (IsValid(Killer) and (Killer:IsPlayer() and Killer:Nick() or Killer:GetClass()) or "Unknown") .. " avec un/un(e) " .. (IsValid(Weapon) and Weapon:GetClass() or "Unknown"))
end)

hook.Add("OnPlayerChangedTeam", "FAdmin_Log", function(ply, oldteam, newteam)
    if not IsValid(ply) or not ply:IsPlayer() then return end
    FAdmin.Log(ply:Nick() .. " (" .. ply:SteamID() .. ") est passé de " .. team.GetName(oldteam) .. " à " .. team.GetName(newteam))
end)

hook.Add("WeaponEquip", "FAdmin_Log", function(weapon)
    timer.Simple(0, function()
        if not IsValid(weapon) then return end
        local ply = weapon:GetOwner()
        if not IsValid(ply) or not ply:IsPlayer() then return end
        FAdmin.Log(ply:Nick() .. " (" .. ply:SteamID() .. ") est équipé de " .. weapon:GetClass())
    end)
end)

hook.Add("PlayerDeath", "FAdmin_Log", function(ply, inflictor, Killer)
    local Nick = IsValid(ply) and ply:Nick() or "N/A"
    local SteamID = IsValid(ply) and ply:SteamID() or "N/A"
    local KillerName = IsValid(Killer) and (Killer:IsPlayer() and Killer:Nick() or Killer:GetClass()) or "N/A"
    local InflictorName =  IsValid(inflictor) and inflictor:GetClass() or "N/A"

    FAdmin.Log(Nick .. " (" .. SteamID .. ") s'est fait tué par " .. KillerName .. " avec un(e) " .. InflictorName)
end)

hook.Add("PlayerSilentDeath", "FAdmin_Log", function(ply)
    if not IsValid(ply) or not ply:IsPlayer() then return end
    FAdmin.Log(ply:Nick() .. " (" .. ply:SteamID() .. ") s'est fait tué silencieusement")
end)

hook.Add("PlayerDisconnected", "FAdmin_Log", function(ply)
    if not IsValid(ply) or not ply:IsPlayer() then return end
    FAdmin.Log(ply:Nick() .. " (" .. ply:SteamID() .. ") s'est déconnecté")
end)

hook.Add("PlayerInitialSpawn", "FAdmin_Log", function(ply)
    if not IsValid(ply) or not ply:IsPlayer() then return end
    FAdmin.Log(ply:Nick() .. " (" .. ply:SteamID() .. ") a pré-spawn")
end)

hook.Add("PlayerSpawn", "FAdmin_Log", function(ply)
    if not IsValid(ply) or not ply:IsPlayer() then return end
    FAdmin.Log(ply:Nick() .. " (" .. ply:SteamID() .. ") a spawn")
end)

hook.Add("PlayerSpray", "FAdmin_Log", function(ply)
    if not IsValid(ply) or not ply:IsPlayer() then return end
    FAdmin.Log(ply:Nick() .. " (" .. ply:SteamID() .. ") a pulvérisé un tag")
end)

hook.Add("PlayerEnteredVehicle", "FAdmin_Log", function(ply, vehicle)
    if not IsValid(ply) or not ply:IsPlayer() then return end
    FAdmin.Log(ply:Nick() .. " (" .. ply:SteamID() .. ") est entré dans " .. (IsValid(vehicle) and vehicle:GetClass() or "Unknown"))
end)

hook.Add("EntityRemoved", "FAdmin_Log", function(ent)
    if IsValid(ent) and ent:GetClass() == "prop_physics" then
        FAdmin.Log(ent:GetClass() .. "(" .. (ent:GetModel() or "<no model>") .. ") a été supprimé")
    end
end)

hook.Add("PlayerAuthed", "FAdmin_Log", function(ply, SteamID, _)
    if not IsValid(ply) then return end
    FAdmin.Log(ply:Nick() .. " (" .. (SteamID or "Unknown Steam ID") .. ") est authentifié")
end)

hook.Add("PlayerNoClip", "FAdmin_Log", function(ply)
    if not IsValid(ply) or not ply:IsPlayer() then return end
    FAdmin.Log(ply:Nick() .. " (" .. ply:SteamID() .. ") a essayé de prendre le noclip")
end)

hook.Add("ShutDown", "FAdmin_Log", function()
    FAdmin.shuttingDown = true
    FAdmin.Log("Le serveur s'est arrêté avec succès.")
end)
