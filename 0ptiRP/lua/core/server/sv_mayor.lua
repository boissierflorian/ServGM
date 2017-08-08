--[[---------------------------------------------------------------------------
	Menu du maire
--]]---------------------------------------------------------------------------

--[[---------------------------------------------------------------------------
	Network
--]]---------------------------------------------------------------------------
util.AddNetworkString( "MayorMenu_Frame" )

--[[---------------------------------------------------------------------------
	Ajout de la commande
--]]---------------------------------------------------------------------------
FAdmin = FAdmin or {}
FAdmin.StartHooks = FAdmin.StartHooks or {}

FAdmin.StartHooks["Popups"] = function()
   FAdmin.Commands.AddCommand("maire", function(ply, cmd, args)
        if ply:Team() ~= TEAM_MAIRE then
            DarkRP.notify(ply, 1, 4, "Vous n'êtes pas maire !")
            return false, ""
        end

		net.Start("MayorMenu_Frame")
		net.Send(ply)
		return true, " "
   	end)
end