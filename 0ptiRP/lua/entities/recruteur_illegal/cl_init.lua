--[[---------------------------------------------------------------------------
	Recruteur légal créé par 0binar
	
	Eh petit con ! Arrêtes de fouiner !
--]]---------------------------------------------------------------------------

include("shared.lua")

--[[---------------------------------------------------------------------------
	Couleurs
--]]---------------------------------------------------------------------------
local textColor               = Color(255, 255, 255)
local boxColor                = Color(0, 255, 255)
local wordBoxColor            = Color(50, 50, 50)
local scrollBarColor          = Color(0, 0, 0, 50)
local gripColor               = Color(220, 220, 220)
local jobBGColor              = Color( 30, 30, 30 )
local jobBGHoverColor         = Color( 30, 30, 30 )
local black                   = Color( 0, 0, 0 )


--[[---------------------------------------------------------------------------
	Variables
--]]---------------------------------------------------------------------------
local txt = "Recruteur (Illégal)"

--[[---------------------------------------------------------------------------
	Désactive les dégats sur l'entité
--]]---------------------------------------------------------------------------
function ENT:OnTakeDamage()
	return false
end

--[[---------------------------------------------------------------------------
	Affichage
--]]---------------------------------------------------------------------------
function ENT:Draw()
	self:DrawModel()
	
	local pos = self:GetPos()
	
	if LocalPlayer():GetPos():Distance(pos) < 500 then
		pos.z = pos.z + 15
		local ang = self:GetAngles()
		
		surface.SetFont("Trebuchet24")
		local textSize = surface.GetTextSize(txt)
		
		ang:RotateAroundAxis(ang:Forward(), 90)
		
		local textAng = ang
		textAng:RotateAroundAxis(textAng:Right(), CurTime() * -90)
	
		cam.Start3D2D(pos + ang:Right() * -30, textAng, 0.2)
			draw.WordBox(2, -textSize *0.5 + 5, -180, txt, "Trebuchet24", wordBoxColor, textColor)
		cam.End3D2D()
	end
end


--[[---------------------------------------------------------------------------
	Dimensions
--]]---------------------------------------------------------------------------
local frameWidth, frameHeight   = 700, 600
local buttonWidth, buttonHeight = 200, 50

--[[---------------------------------------------------------------------------
	Fenêtre principale
--]]---------------------------------------------------------------------------
net.Receive("Recruteur_Illegal_Frame", function(len)	
	--> Main Frame
	local frame = vgui.Create("OptiRP_Basic_Frame")
	frame:SetSize(frameWidth, frameHeight)
	frame:SetTitle("Métiers Illégaux")
		
	--> Scroll Panel
	local jobsPanel = vgui.Create("DScrollPanel", frame)
	jobsPanel:Dock( FILL )
	jobsPanel:SetSize(frameWidth * 0.8, frameHeight * 0.8)
	
	--> Scroll Panel VBar
	local vbar = jobsPanel:GetVBar()
	function vbar:Paint(w, h)
		draw.RoundedBox(0, 0, 0, w, h, scrollBarColor)
	end
	
	function vbar.btnGrip:Paint(w, h)
		draw.RoundedBox(8, 0, 0, w, h, gripColor)
	end
	
	vbar.btnUp.Paint = nil
	vbar.btnDown.Paint = nil
	
	--> Job Grid
	local grid = vgui.Create("DGrid", jobsPanel)
	grid:SetPos(50, 30)
	grid:SetCols(1)
	grid:SetColWide(frame:GetWide() * 0.8)
	grid:SetRowHeight(130)
	
	--> Job List
	for k, v in pairs(RPExtraTeams) do
		if v.category == "Illégal" then
			--> Job Row
			local ratio  = team.NumPlayers(v.team) 
			local jobRow = vgui.Create("DButton", grid)
			jobRow:SetText("")
			jobRow:SetSize(frame:GetWide(), 115)
			
			function jobRow:Paint(width, height)
				if self.Hovered then
					--> Outline
					draw.RoundedBox( 0, 0, 0, width, height, Color(0, 0, 0, 100) )

					--> Main Color
					draw.RoundedBox( 0, 2, 2, width - 144, height - 4, jobBGHoverColor )

					--> Job Title BG
					draw.RoundedBox(0, 2, 2, width - 144, height - 93, Color(v.color.r, v.color.g, v.color.b, 100) )
				else
					--> Outline
					draw.RoundedBox( 0, 0, 0, width, height, black )

					--> Main Color
					draw.RoundedBox( 0, 2, 2, width - 144, height - 4, jobBGColor )

					--> Job Title BG
					draw.RoundedBox(0, 2, 2, width - 144, height - 93, v.color )
				end
				
				--> Job Name + Players
				draw.SimpleText(v.name .. " (" .. ratio .. "/" .. v.max .. ")", "Trebuchet24", 15, 0)
				
				--> Job Description
				local desc = string.Split(v.description, "\n")
				
				for k, v in pairs(desc) do
					draw.SimpleText(v, "CenterPrintText", 100, 30 + ((k - 1) * 15) )
				end		
			end
			
			--> Job Model
			local jobModel
			if istable(v.model) then
				jobModel = table.GetFirstValue(v.model)
			else
				jobModel = v.model
			end
			
			--> Job Icon
			local jobIcon = vgui.Create("ModelImage", jobRow)
			jobIcon:SetSize(72, 72)
			jobIcon:SetPos(10, 30)
			jobIcon:SetModel(jobModel)
						
			--> Event
			jobRow.DoClick = function()
				surface.PlaySound("UI/buttonclick.wav")
			
				if v.vote then
					if ((v.admin == 0 and LocalPlayer():IsAdmin()) or (v.admin == 1 and LocalPlayer():IsSuperAdmin())) then
							local menu = DermaMenu( CH_OKAY )
							menu:AddOption("Voter", function() RunConsoleCommand("darkrp", "vote", v.command)
								frame:Close()
							end)
							menu:AddOption("Ne pas voter", function() RunConsoleCommand("darkrp", v.command)
								frame:Close()
							end)
							menu:Open()
					else
							RunConsoleCommand("say", "/vote"..v.command)
							frame:Close()
					end
				else
					RunConsoleCommand("darkrp", v.command)
					frame:Close()
				end
			end
			
			grid:AddItem(jobRow)
		end
	end
	
end)