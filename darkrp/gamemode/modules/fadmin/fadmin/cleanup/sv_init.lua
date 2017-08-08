local function ClearDecals(ply, cmd, args)
    if not FAdmin.Access.PlayerHasPrivilege(ply, "CleanUp") then FAdmin.Messages.SendMessage(ply, 5, "Privilèges insuffisants !") return false end

    for k,v in pairs(player.GetAll()) do
        v:ConCommand("r_cleardecals")
    end
    FAdmin.Messages.ActionMessage(ply, player.GetAll(), 
	"Vous avez supprimé toutes les traces.", "Toutes les traces ont été supprimées.", "Les traces ont été supprimées")

    return true
end

local function StopSounds(ply, cmd, args)
    if not FAdmin.Access.PlayerHasPrivilege(ply, "CleanUp") then FAdmin.Messages.SendMessage(ply, 5, "Privilèges insuffisants !") return false end

    umsg.Start("FAdmin_StopSounds")
    umsg.End()

    FAdmin.Messages.ActionMessage(ply, player.GetAll(), "Vous avez stoppé tous les sons", "Tous les sons ont été stoppés", "Le sons ont été stoppés")

    return true
end

local PNJ = {"agent_pub", "recruteur_police", "recruteur_legal", "recruteur_illegal"}
local function CleanUp(ply, cmd, args)
    if not FAdmin.Access.PlayerHasPrivilege(ply, "CleanUp") then FAdmin.Messages.SendMessage(ply, 5, "Privilèges insuffisants !") return false end
	
	-- TODO: Ajout d'un filter pour les PNJs / PermaProps ?
    game.CleanUpMap(false, PNJ)
    FAdmin.Messages.ActionMessage(ply, player.GetAll(), "Vous avez nettoyé la map", "La map a été nettoyée", "La map est nettoyée")

    return true
end

FAdmin.StartHooks["CleanUp"] = function()
    FAdmin.Commands.AddCommand("ClearDecals", ClearDecals)
    FAdmin.Commands.AddCommand("StopSounds", StopSounds)
    FAdmin.Commands.AddCommand("CleanUp", CleanUp)

    local oldCleanup = concommand.GetTable()["gmod_admin_cleanup"]
    concommand.Add("gmod_admin_cleanup", function(ply, cmd, args)
        if args[1] then return oldCleanup(ply, cmd, args) end
        return CleanUp(ply, cmd, args)
    end)

    FAdmin.Access.AddPrivilege("CleanUp", 2)
end
