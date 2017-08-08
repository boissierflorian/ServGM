FAdmin.StartHooks["StripWeapons"] = function()
    FAdmin.Messages.RegisterNotification{
        name = "stripweapons",
        hasTarget = true,
        message = {"instigator", " a confisqué les armes de ", "targets"},
    }

    FAdmin.Access.AddPrivilege("StripWeapons", 2)
    FAdmin.Commands.AddCommand("StripWeapons", nil, "<Player>")
    FAdmin.Commands.AddCommand("Strip", nil, "<Player>")

    FAdmin.ScoreBoard.Player:AddActionButton("Confisquer les armes", {"fadmin/icons/weapon", "fadmin/icons/disable"}, Color(255, 130, 0, 255),
    function(ply) return FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), "StripWeapons", ply) end, function(ply, button)
        RunConsoleCommand("_FAdmin", "StripWeapons", ply:UserID())
    end)
end
