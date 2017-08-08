local AdminsCanPickUpPlayers = CreateConVar("AdminsCanPickUpPlayers", 1, {FCVAR_REPLICATED, FCVAR_SERVER_CAN_EXECUTE})
local PlayersCanPickUpPlayers = CreateConVar("PlayersCanPickUpPlayers", 0, {FCVAR_REPLICATED, FCVAR_SERVER_CAN_EXECUTE})

hook.Add("PhysgunPickup", "FAdmin_PickUpPlayers", function(ply, ent)
    if not IsValid(ent) or not ent:IsPlayer() then return end

    if PlayersCanPickUpPlayers:GetBool() or AdminsCanPickUpPlayers:GetBool() and
        FAdmin.Access.PlayerHasPrivilege(ply, "PickUpPlayers", ent) and tobool(ply:GetInfo("cl_pickupplayers")) then
        ent:SetMoveType(MOVETYPE_NONE)
        ent:Freeze(true)
        return true
    end
end)

hook.Add("PhysgunDrop", "FAdmin_PickUpPlayers", function(ply, ent)
    if IsValid(ent) and ent:IsPlayer() then
        ent:SetMoveType(MOVETYPE_WALK)
        ent:Freeze(false)
    end
end)

local function ChangeAdmin(ply, cmd, args)
    if not ply:IsSuperAdmin() then FAdmin.Messages.SendMessage(ply, 5, "Privilèges insuffisants !") return false end
    if not args[1] then return false end

    local Value = tonumber(args[1])
    if Value ~= 1 and Value ~= 0 then return false end
    RunConsoleCommand("AdminsCanPickUpPlayers", Value)

    FAdmin.SaveSetting("AdminsCanPickUpPlayers", Value)

    local OnOff = (tobool(Value) and "on") or "off"
	if OnOff == "on" then
		FAdmin.Messages.ActionMessage(ply, player.GetAll(), ply:Nick() .. " a activé le pick Admin>Joueur", "Le pick Admin>Joueur a été activé", "Le pick Admin>Joueur a été activé ")
	else
		FAdmin.Messages.ActionMessage(ply, player.GetAll(), ply:Nick() .. " a désactivé le pick Admin>Joueur", "Le pick Admin>Joueur a été désactivé", "Le pick Admin>Joueur a été désactivé ")
	end

    return true, OnOff
end

local function ChangeUser(ply, cmd, args)
    if not ply:IsSuperAdmin() then FAdmin.Messages.SendMessage(ply, 5, "Privilèges insuffisants !") return false end
    if not args[1] then return false end

    local Value = tonumber(args[1])
    if Value ~= 1 and Value ~= 0 then return false end
    RunConsoleCommand("PlayersCanPickUpPlayers", Value)

    FAdmin.SaveSetting("PlayersCanPickUpPlayers", Value)

    local OnOff = (tobool(Value) and "on") or "off"
    	if OnOff == "on" then
		FAdmin.Messages.ActionMessage(ply, player.GetAll(), ply:Nick() .. " a activé le pick Joueur>Joueur", "Le pick Joueur>Joueur a été activé", "Le pick Joueur>Joueur a été activé ")
	else
		FAdmin.Messages.ActionMessage(ply, player.GetAll(), ply:Nick() .. " a désactivé le pick Joueur>Joueur", "Le pick Joueur>Joueur a été désactivé", "Le pick Joueur>Joueur a été désactivé ")
	end

    return true, OnOff
end

FAdmin.StartHooks["PickUpPlayers"] = function()
    FAdmin.Access.AddPrivilege("PickUpPlayers", 2)
    FAdmin.Commands.AddCommand("AdminsCanPickUpPlayers", ChangeAdmin)
    FAdmin.Commands.AddCommand("PlayersCanPickUpPlayers", ChangeUser)
end
