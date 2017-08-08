FAdmin.StartHooks["00RCon"] = function()
    FAdmin.Access.AddPrivilege("RCon", 3)
    FAdmin.Commands.AddCommand("RCon", "<command>", "<args>")

    FAdmin.ScoreBoard.Server:AddServerAction("RCon", "fadmin/icons/rcon", Color(155, 0, 0, 255), function() return FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), "RCon") end,
    function(ply, button)
        Derma_StringRequest("Commande RCon", "Entrez une commande Rcon. Note: certaines commandes ont été supprimées pour des raisons de sécurité !", "",
            function(text) RunConsoleCommand("_FAdmin", "RCon", unpack(string.Explode(" ", text))) end, nil, "OK", "Annuler")
    end)
end
