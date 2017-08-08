--[[---------------------------------------------------------------------------
	Le porte-feuille
--]]---------------------------------------------------------------------------

--[[---------------------------------------------------------------------------
	Couleurs
--]]---------------------------------------------------------------------------
local textColor    = Color(255, 255, 255)
local buttonColor  = Color(58, 184, 255)

--[[---------------------------------------------------------------------------
	Dimensions
--]]---------------------------------------------------------------------------
local frameWidth, frameHeight   = 500, 150

net.Receive("PorteFeuille_Frame", function(len)	
	--> Frame
	local frame = vgui.Create("OptiRP_Basic_Frame")
	frame:SetSize(frameWidth, frameHeight)
    frame:SetTitle( "Porte-feuille" )	
			
	--> Montant
	local montant = vgui.Create("DLabel", frame)
	montant:SetPos(90, 60)
	montant:SetSize(90, 24)
	montant:SetFont("Trebuchet24")
	montant:SetText("Montant : ")
	montant:SetTextColor(textColor)
	
	--> Text Entry
	local entry = vgui.Create("DTextEntry", frame)
	entry:SetPos(180, 58)
	entry:SetSize(200, 30)
	entry:SetNumeric(true)
	entry:SetDrawLanguageID(false)
	
	--> Check button
	local check = vgui.Create("OptiRP_Basic_Button", frame)
	check:SetText("Chèque")
	check:SetSize(100, 30)
	check:SetPos(90, frameHeight - 40)
	check:SetFont("Trebuchet24")	
	check.DoClick = function()
		local amount = tonumber(entry:GetValue())
		
		if not amount or amount <= 0 or not LocalPlayer():canAfford(amount) then
			surface.PlaySound("common/warning.wav")
			return
		end
		
		local trace = LocalPlayer():GetEyeTrace()
		
		if not IsValid(trace.Entity) or not trace.Entity:IsPlayer() or 
			trace.Entity:GetPos():DistToSqr(LocalPlayer():GetPos()) >= 22500 then
			surface.PlaySound("common/warning.wav")
			return ""
		end
		
		RunConsoleCommand("say", "/cheque " .. trace.Entity:SteamID() .. " " .. amount)
		surface.PlaySound("UI/buttonclick.wav")
		frame:Remove()
	end
	
	--> Donate button
	local donate = vgui.Create("OptiRP_Basic_Button", frame)
	donate:SetText("Donner")
	donate:SetSize(100, 30)
	donate:SetPos(200, frameHeight - 40)
	donate:SetFont("Trebuchet24")	
	donate.DoClick = function()
		local amount = tonumber(entry:GetValue())
		
		if not amount or amount <= 0 or not LocalPlayer():canAfford(amount) then
			surface.PlaySound("common/warning.wav")
			return
		end
		
		RunConsoleCommand("say", "/give " .. amount)
		surface.PlaySound("UI/buttonclick.wav")
		frame:Remove()
	end
	
	--> Drop button
	local drop = vgui.Create("OptiRP_Basic_Button", frame)
	drop:SetText("Jeter")
	drop:SetSize(100, 30)
	drop:SetPos(310, frameHeight - 40)
	drop:SetFont("Trebuchet24")
	
	drop.DoClick = function()
		local amount = tonumber(entry:GetValue())
		
		if not amount or amount <= 0 or not LocalPlayer():canAfford(amount) then
			surface.PlaySound("common/warning.wav")
			return
		end
		
		RunConsoleCommand("say", "/moneydrop " .. amount)
		surface.PlaySound("UI/buttonclick.wav")
		frame:Remove()
	end
end)