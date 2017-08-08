local ContinueNewGroup
local EditGroups

local function RetrievePRIVS(len)
    FAdmin.Access.Groups = net.ReadTable()

    for k,v in pairs(FAdmin.Access.Groups) do
        if CAMI.GetUsergroup(k) then continue end

        CAMI.RegisterUsergroup({
            Name = k,
            Inherits = FAdmin.Access.ADMIN[v.ADMIN]
        }, "FAdmin")
    end

    -- Remove any groups that are removed from FAdmin from CAMI.
    for k,v in pairs(CAMI.GetUsergroups()) do
        if FAdmin.Access.Groups[k] then continue end

        CAMI.UnregisterUsergroup(k, "FAdmin")
    end
end
net.Receive("FADMIN_SendGroups", RetrievePRIVS)

local function addPriv(um)
    local group = um:ReadString()
    FAdmin.Access.Groups[group] = FAdmin.Access.Groups[group] or {}
    FAdmin.Access.Groups[group].PRIVS[um:ReadString()] = true
end
usermessage.Hook("FAdmin_AddPriv", addPriv)

local function removePriv(um)
    FAdmin.Access.Groups[um:ReadString()].PRIVS[um:ReadString()] = nil
end
usermessage.Hook("FAdmin_RemovePriv", removePriv)

local function addGroupUI(ply, func)
    Derma_StringRequest("Définir le nom du groupe",
    "Quel sera le nom du nouveau groupe ?",
    "",
    function(text)
        if text == "" then return end
        Derma_Query("Sur quels privilèges sera basé ce nouveau groupe ? (Ce groupe héritera de tous les privilèges du groupe parent)", "Privilèges",
            "user", function() ContinueNewGroup(ply, text, 0, func) end,
            "admin", function() ContinueNewGroup(ply, text, 1, func) end,
            "superadmin", function() ContinueNewGroup(ply, text, 2, func) end)
    end)
end

FAdmin.StartHooks["1SetAccess"] = function() -- 1 in hook name so it will be executed first.
    FAdmin.Commands.AddCommand("setaccess", nil, "<Player>", "<Group name>", "[new group based on (number)]", "[new group privileges]")

    FAdmin.ScoreBoard.Player:AddActionButton("Privilèges", "fadmin/icons/access", Color(155, 0, 0, 255),
    function(ply) return FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), "SetAccess") or LocalPlayer():IsSuperAdmin() end, function(ply)
        local menu = DermaMenu()

        local Padding = vgui.Create("DPanel")
        Padding:SetPaintBackgroundEnabled(false)
        Padding:SetSize(1,5)
        menu:AddPanel(Padding)

        local Title = vgui.Create("DLabel")
        Title:SetText("  Privilèges:\n")
        Title:SetFont("UiBold")
        Title:SizeToContents()
        Title:SetTextColor(color_black)

        menu:AddPanel(Title)
	
        for k,v in SortedPairsByMemberValue(FAdmin.Access.Groups, "ADMIN", true) do
            menu:AddOption(k, function()
                if not IsValid(ply) then return end
                RunConsoleCommand("_FAdmin", "setaccess", ply:UserID(), k)
            end)
        end

        menu:AddOption("Nouveau...", function() addGroupUI(ply) end)
        menu:Open()
    end)

    FAdmin.ScoreBoard.Server:AddPlayerAction("Gestion des groupes", "fadmin/icons/access", Color(0, 155, 0, 255), function() return FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), "ManageGroups") or FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), "ManagePrivileges") end, EditGroups)

    -- Admin immunity
    FAdmin.ScoreBoard.Server:AddServerSetting(function()
            return (FAdmin.GlobalSetting.Immunity and "Désactiver" or "Activer") .. " l'immunité administrateur"
        end,
        function()
            return "fadmin/icons/access", FAdmin.GlobalSetting.Immunity and "fadmin/icons/disable"
        end, Color(0, 0, 155, 255), function(ply) return FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), "ManageGroups") end, function(button)
            button:SetImage2((not FAdmin.GlobalSetting.Immunity and "fadmin/icons/disable") or "null")
            button:SetText((not FAdmin.GlobalSetting.Immunity and "Désactiver" or "Activer") .. " l'immunité administrateur")
            button:GetParent():InvalidateLayout()

            RunConsoleCommand("_Fadmin", "immunity", (FAdmin.GlobalSetting.Immunity and 0) or 1)
        end
    )
end

ContinueNewGroup = function(ply, name, admin_access, func)
    if IsValid(ply) then
        RunConsoleCommand("_FAdmin", "setaccess", ply:UserID(), name, admin_access)
    else
        RunConsoleCommand("_FAdmin", "AddGroup", name, admin_access)
    end

    if func then
        func(name, admin_access)
    end
end

EditGroups = function()
    local frame, SelectedGroup, AddGroup, RemGroup, Privileges, SelectedPrivs, AddPriv, RemPriv, lblImmunity, nmbrImmunity

    frame = vgui.Create("DFrame")
    frame:SetTitle("Gestion des groupes")
    frame:MakePopup()
    frame:SetVisible(true)
    frame:SetSize(680, 480) -- 640, 480
    frame:Center()

    SelectedGroup = vgui.Create("DComboBox", frame)
    SelectedGroup:SetPos(5, 30)
    SelectedGroup:SetWidth(145)

    for k,v in pairs(FAdmin.Access.Groups) do
        v.immunity = v.immunity or 0
    end
    for k,v in SortedPairsByMemberValue(FAdmin.Access.Groups, "immunity", true) do
        SelectedGroup:AddChoice(k)
    end

    AddGroup = vgui.Create("DButton", frame)
    AddGroup:SetPos(155, 30)
    AddGroup:SetSize(90, 22)
    AddGroup:SetText("Ajouter un groupe")
    AddGroup.DoClick = function()
        addGroupUI(nil, function(name, admin, privs)
            SelectedGroup:AddChoice(name)
            SelectedGroup:SetValue(name)
            RemGroup:SetDisabled(false)

            Privileges:Clear()
            SelectedPrivs:Clear()
            nmbrImmunity:SetText(FAdmin.Access.Groups[FAdmin.Access.ADMIN[admin + 1]].immunity)
            nmbrImmunity:SetDisabled(false)
            nmbrImmunity:SetEditable(true)

            for priv, am in SortedPairs(FAdmin.Access.Privileges) do
                if am <= admin + 1 then
                    SelectedPrivs:AddLine(priv)
                else
                    Privileges:AddLine(priv)
                end
            end
        end)
    end

    RemGroup = vgui.Create("DButton", frame)
    RemGroup:SetPos(250, 30)
    RemGroup:SetSize(102, 22)
    RemGroup:SetText("Supprimer le groupe")
    RemGroup.DoClick = function()
        RunConsoleCommand("_FAdmin", "RemoveGroup", SelectedGroup:GetValue())

        for k,v in pairs(SelectedGroup.Choices) do
            if v ~= SelectedGroup:GetValue() then continue end

            SelectedGroup.Choices[k] = nil
            break
        end
        table.ClearKeys(SelectedGroup.Choices)

        SelectedGroup:SetValue("user")
        SelectedGroup:OnSelect(1, "user")
    end

    Privileges = vgui.Create("DListView", frame)
    Privileges:SetPos(5, 55)
    Privileges:SetSize(320, 420)
    Privileges:AddColumn("Privilèges disponibles")

    SelectedPrivs = vgui.Create("DListView", frame)
    SelectedPrivs:SetPos(360, 55)
    SelectedPrivs:SetSize(295, 420)
    SelectedPrivs:AddColumn("Privilèges actuels")

    function SelectedGroup:OnSelect(index, value, data)
        if not FAdmin.Access.Groups[value] then return end

        RemGroup:SetDisabled(false)
        if table.HasValue(FAdmin.Access.ADMIN, value) then
            RemGroup:SetDisabled(true)
        end

        Privileges:Clear()
        SelectedPrivs:Clear()

        for priv, _ in SortedPairs(FAdmin.Access.Privileges) do
            if FAdmin.Access.Groups[value].PRIVS[priv] then
                SelectedPrivs:AddLine(priv)
            else
                Privileges:AddLine(priv)
            end
        end

        if nmbrImmunity then
            nmbrImmunity:SetText(FAdmin.Access.Groups[value].immunity or "")
            if table.HasValue({"superadmin", "admin", "user", "noaccess"}, string.lower(value)) then
                nmbrImmunity:SetDisabled(true)
                nmbrImmunity:SetEditable(false)
            else
                nmbrImmunity:SetDisabled(false)
                nmbrImmunity:SetEditable(true)
            end
        end
    end
    SelectedGroup:SetValue("user")
    SelectedGroup:OnSelect(1, "user")

    AddPriv = vgui.Create("DButton", frame)
    AddPriv:SetPos(330, 55)
    AddPriv:SetSize(25, 25)
    AddPriv:SetText(">")
    AddPriv.DoClick = function()
        for k,v in pairs(Privileges:GetSelected()) do
            local priv = v.Columns[1]:GetValue()
            RunConsoleCommand("FAdmin", "AddPrivilege", SelectedGroup:GetValue(), priv)
            SelectedPrivs:AddLine(priv)
            Privileges:RemoveLine(v.m_iID)
        end
    end

    RemPriv = vgui.Create("DButton", frame)
    RemPriv:SetPos(330, 85)
    RemPriv:SetSize(25, 25)
    RemPriv:SetText("<")
    RemPriv.DoClick = function()
        for k,v in pairs(SelectedPrivs:GetSelected()) do
            local priv = v.Columns[1]:GetValue()
            if SelectedGroup:GetValue() == LocalPlayer():GetUserGroup() and priv == "ManagePrivileges" then
                return Derma_Message("Vous ne devriez pas supprimer ManagePrivileges. Cela vous bloquerai dans le système", "Coup très intelligent.")
            end
            RunConsoleCommand("FAdmin", "RemovePrivilege", SelectedGroup:GetValue(), priv)
            Privileges:AddLine(priv)
            SelectedPrivs:RemoveLine(v.m_iID)
        end
    end

    lblImmunity = vgui.Create("DLabel", frame)
    lblImmunity:SetPos(360, 30)
    lblImmunity:SetText("Points d'immunité")
    lblImmunity:SizeToContents()

    nmbrImmunity = vgui.Create("DTextEntry", frame)
    nmbrImmunity:SetPos(565, 28)
    nmbrImmunity:SetWide(90)
    nmbrImmunity:SetNumeric(true)
    nmbrImmunity:SetText(FAdmin.Access.Groups.user.immunity)
    nmbrImmunity:SetDisabled(true)
    nmbrImmunity:SetEditable(false)
    nmbrImmunity.OnEnter = function(self) RunConsoleCommand("FAdmin", "SetImmunity", SelectedGroup:GetValue(), self:GetValue()) end
end
