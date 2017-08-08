FAdmin.PlayerActions.SlayTypes = {}
FAdmin.PlayerActions.SlayTypes[1] = "Normale"
FAdmin.PlayerActions.SlayTypes[2] = "Silencieuse"
FAdmin.PlayerActions.SlayTypes[3] = "Explosion"
FAdmin.PlayerActions.SlayTypes[4] = "Roquette"

FAdmin.StartHooks["Slaying"] = function()
    FAdmin.Messages.RegisterNotification{
        name = "slay",
        hasTarget = true,
        message = {"instigator", " a tué ", "targets"},
        receivers = "involved+admins",
    }
end
