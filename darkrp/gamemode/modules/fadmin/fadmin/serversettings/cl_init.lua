local function SetLimits()
    local frame = vgui.Create("DFrame")
    frame:SetTitle("Limites du serveur")
    frame:SetSize(300, 460)
    frame:Center()
    frame:SetVisible(true)
    frame:MakePopup()

    local PanelList = vgui.Create("DPanelList", frame)
    PanelList:StretchToParent(5, 25, 5, 5)
    PanelList:EnableVerticalScrollbar(true)

    local Form = vgui.Create("DForm", PanelList)
    Form:SetName("Limites du serveur")

    local Settings = util.KeyValuesToTable(file.Read("gamemodes/sandbox/sandbox.txt", "GAME")) -- All SBox limits are in here :D
    for k, v in SortedPairs(Settings.settings or {}) do
        if v.type == "Numeric" then
            local left, _ = Form:NumberWang(v.text, nil, v.low or 0, v.high or 1000, v.decimals or 0)
            left:SetFloatValue(GetConVar(v.name):GetFloat())
            left:SetValue(GetConVar(v.name):GetFloat())

            function left:OnValueChanged(val)
                if val == GetConVar(v.name):GetFloat() then
                    return
                end
                RunConsoleCommand("_FAdmin", "ServerSetting", v.name, val)
            end
        end
    end
    PanelList:AddItem(Form)
end

FAdmin.StartHooks["ServerSettings"] = function()
    FAdmin.Access.AddPrivilege("ServerSetting", 2)

    local sbox_godmode = GetConVar("sbox_godmode")
    FAdmin.ScoreBoard.Server:AddServerSetting(function() return (sbox_godmode:GetBool() and "Désactiver" or "Activer") .. " le god mode général" end,
    function() return "fadmin/icons/god", sbox_godmode:GetBool() and "fadmin/icons/disable" end,
    Color(0, 0, 155, 255), function(ply) return FAdmin.Access.PlayerHasPrivilege(ply, "ServerSetting") end, function(button)
        local val = sbox_godmode:GetBool()

        button:SetImage2((not val and "fadmin/icons/disable") or "null")
        button:SetText((not val and "Désactiver" or "Activer") .. " le god mode général")
        button:GetParent():InvalidateLayout()

        RunConsoleCommand("_FAdmin", "ServerSetting", "sbox_godmode", val and 0 or 1)
    end)

    local sbox_playershurtplayers = GetConVar("sbox_playershurtplayers")
    FAdmin.ScoreBoard.Server:AddServerSetting(function() return (sbox_playershurtplayers:GetBool() and "Désactiver" or "Activer") .. " le PVP" end,
    function() return "fadmin/icons/weapon", sbox_playershurtplayers:GetBool() and "fadmin/icons/disable" end,
    Color(0, 0, 155, 255), function(ply) return FAdmin.Access.PlayerHasPrivilege(ply, "ServerSetting") end, function(button)
        local val = sbox_playershurtplayers:GetBool()

        button:SetImage2(not val and "fadmin/icons/disable" or "null")
        button:SetText((not val and "Désactiver" or "Activer") .. " le PVP")
        button:GetParent():InvalidateLayout()

        RunConsoleCommand("_FAdmin", "ServerSetting", "sbox_playershurtplayers", val and 0 or 1)
    end)

    local sbox_noclip = GetConVar("sbox_noclip")
    FAdmin.ScoreBoard.Server:AddServerSetting(function() return (sbox_noclip:GetBool() and "Désactiver" or "Activer") .. " le noclip général" end,
    function() return "fadmin/icons/noclip", sbox_noclip:GetBool() and "fadmin/icons/disable" end,
    Color(0, 0, 155, 255), function(ply) return FAdmin.Access.PlayerHasPrivilege(ply, "ServerSetting") end, function(button)
        local val = sbox_noclip:GetBool()

        button:SetImage2(not val and "fadmin/icons/disable" or "null")
        button:SetText((not val and "Désactiver" or "Activer") .. " le noclip général")
        button:GetParent():InvalidateLayout()

        RunConsoleCommand("_FAdmin", "ServerSetting", "sbox_noclip", val and 0 or 1)
    end)


    FAdmin.ScoreBoard.Server:AddServerSetting("Limites du serveur", "fadmin/icons/serversetting", Color(0, 0, 155, 255), true, SetLimits)
end
