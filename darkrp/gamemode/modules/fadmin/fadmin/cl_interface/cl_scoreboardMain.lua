local Sorted, SortDown = CreateClientConVar("FAdmin_SortPlayerList", "Team", true), CreateClientConVar("FAdmin_SortPlayerListDown", 1, true)
local allowedSorts = {
    ["Name"] = false,
    ["Team"] = false,
    ["Frags"] = false,
    ["Deaths"] = false,
    ["Ping"] = false
}

function FAdmin.ScoreBoard.Main.Show()
    local Sort = {}
    local ScreenWidth, ScreenHeight = ScrW(), ScrH()

    FAdmin.ScoreBoard.X = ScreenWidth * 0.05
    FAdmin.ScoreBoard.Y = ScreenHeight * 0.025
    FAdmin.ScoreBoard.Width = ScreenWidth * 0.9
    FAdmin.ScoreBoard.Height = ScreenHeight * 0.95

    FAdmin.ScoreBoard.ChangeView("Main")

    FAdmin.ScoreBoard.Main.Controls.FAdminPanelList = FAdmin.ScoreBoard.Main.Controls.FAdminPanelList or vgui.Create("DPanelList")
    FAdmin.ScoreBoard.Main.Controls.FAdminPanelList:SetVisible(true)
    FAdmin.ScoreBoard.Main.Controls.FAdminPanelList:Clear(true)
    FAdmin.ScoreBoard.Main.Controls.FAdminPanelList.Padding = 3
    FAdmin.ScoreBoard.Main.Controls.FAdminPanelList:EnableVerticalScrollbar(true)


    FAdmin.ScoreBoard.Main.Controls.FAdminPanelList:Clear(true)

    FAdmin.ScoreBoard.Main.Controls.FAdminPanelList:SetPos(FAdmin.ScoreBoard.X + 20, FAdmin.ScoreBoard.Y + 90 + 30 + 20)
    FAdmin.ScoreBoard.Main.Controls.FAdminPanelList:SetSize(FAdmin.ScoreBoard.Width - 40, FAdmin.ScoreBoard.Height - 90 - 30 - 20 - 20)

    Sort.Frags = Sort.Frags or vgui.Create("DLabel")
    Sort.Frags:SetText("Meurtres")
    Sort.Frags:SetPos(FAdmin.ScoreBoard.X + FAdmin.ScoreBoard.Main.Controls.FAdminPanelList:GetWide() - 185,  FAdmin.ScoreBoard.Y + 90 + 30)
    Sort.Frags.Type = "Frags"
    Sort.Frags:SetVisible(true)

    Sort.Deaths = Sort.Deaths or vgui.Create("DLabel")
    Sort.Deaths:SetText("Morts")
    Sort.Deaths:SetPos(FAdmin.ScoreBoard.X + FAdmin.ScoreBoard.Main.Controls.FAdminPanelList:GetWide() - 100, FAdmin.ScoreBoard.Y + 90 + 30)
    Sort.Deaths.Type = "Deaths"
    Sort.Deaths:SetVisible(true)

    Sort.Ping = Sort.Ping or vgui.Create("DLabel")
    Sort.Ping:SetText("Ping")
    Sort.Ping:SetPos(FAdmin.ScoreBoard.X + FAdmin.ScoreBoard.Main.Controls.FAdminPanelList:GetWide() - 25, FAdmin.ScoreBoard.Y + 90 + 30)
    Sort.Ping.Type = "Ping"
    Sort.Ping:SetVisible(true)

    local sortBy = Sorted:GetString()
    sortBy = allowedSorts[sortBy] and sortBy or "Team"

	FAdmin.ScoreBoard.Main.PlayerListView("Team", true)
	
    for k,v in pairs(Sort) do
        v:SetFont("Trebuchet20")
        v:SizeToContents()
		
		table.insert(FAdmin.ScoreBoard.Main.Controls, v)
    end
end

function FAdmin.ScoreBoard.Main.AddPlayerRightClick(Name, func)
    FAdmin.PlayerIcon.RightClickOptions[Name] = func
end

FAdmin.StartHooks["CopySteamID"] = function()
    FAdmin.ScoreBoard.Main.AddPlayerRightClick("Copy SteamID", function(ply) SetClipboardText(ply:SteamID()) end)
end
