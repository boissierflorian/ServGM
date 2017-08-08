--[[---------------------------------------------------------------------------
	Agent publicitaire créé par 0binar
	
	Eh petit con ! Arrêtes de fouiner !
--]]---------------------------------------------------------------------------

include("shared.lua")

--[[---------------------------------------------------------------------------
	Couleurs
--]]---------------------------------------------------------------------------
local frameColor   = Color(31, 36, 44)
local closeColor   = Color(255, 0, 0)
local buttonColor  = Color(58, 184, 255)
local textColor    = Color(255, 255, 255)
local boxColor     = Color(0, 255, 255)
local wordBoxColor = Color(50, 50, 50)

--[[---------------------------------------------------------------------------
	Variables
--]]---------------------------------------------------------------------------
local txt = "Agent Publicitaire"
local pubFrame 
local advFrame
local msgSent = false

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
local frameWidth, frameHeight   = 500, 180
local buttonWidth, buttonHeight = 200, 50
local advertWidth, advertHeight = 500, 250


--[[---------------------------------------------------------------------------
	Affiche la fenêtre pour un advertButton
	
	advertType : 0 = annonce, 1 = message anonyme
--]]---------------------------------------------------------------------------
local function displayAdvertFrame(advertType)
	local screenWidth, screenHeight = ScrW(), ScrH()
	
	--> Frame
	advFrame = advFrame or vgui.Create("OptiRP_Basic_Frame")
	advFrame:SetSize(advertWidth, advertHeight)
	
	--> Frame Title
	if advertType == 0 then
		advFrame:SetTitle("Annonce")
	else
		advFrame:SetTitle("Message Anonyme")
	end
	
	--> TextField
	local textEntry = vgui.Create("OptiRP_TextEntry", advFrame)
	textEntry:SetPos(10, 50)
	textEntry:SetSize(advertWidth - 20, advertHeight - 100)
	textEntry:SetFont("CloseCaption_Bold")
	
	--> Send Button
	local sendButton = vgui.Create("DButton", advFrame)
	sendButton:SetText("Envoyer")
	sendButton:SetSize(80, 24)
	sendButton:SetPos(advertWidth - 90, advertHeight - 35)
	sendButton:SetFont("Trebuchet24")
	sendButton:SetTextColor(textColor)
	sendButton.DoClick = function(self)
		if textEntry:GetValue():len() < 10 then
			surface.PlaySound("common/warning.wav")
			return
		end
		
		surface.PlaySound("UI/buttonclick.wav")
	
		net.Start("AgentPubSend")	
			if advertType == 0 then
				net.WriteBool(false)
			else
				net.WriteBool(true)
			end
			
			net.WriteString(textEntry:GetValue())
		net.SendToServer()
		
		msgSent = true
		advFrame:Remove()
	end
	
	function sendButton:Paint(width, height)
		draw.RoundedBox(5, 0, 0, width, height, buttonColor)
	end

	function advFrame:OnRemove()
		advFrame = nil

		if msgSent then
			frame:Remove()
		end
	end
end

--[[---------------------------------------------------------------------------
	Fenêtre principale
--]]---------------------------------------------------------------------------
net.Receive("AgentPubFrame", function(len)
	msgSent = false
	
	--> Main Frame
	frame = frame or vgui.Create("OptiRP_Basic_Frame")
	frame:SetSize(frameWidth, frameHeight)
	frame:SetTitle("Agent Publicitaire")
	
	--> Advert Button
	local advertButton = vgui.Create( "OptiRP_Basic_Button", frame )
	advertButton:SetSize( buttonWidth, buttonHeight )
	advertButton:SetPos((frameWidth * 0.5) - (buttonWidth * 0.5), 40)
	advertButton:SetText("Annonce")
	advertButton:SetFont("CloseCaption_Bold")
	advertButton.clickEvent = function()
		displayAdvertFrame(0)
	end
	
	--> Anonymous Button
	local anoButton = vgui.Create( "OptiRP_Basic_Button", frame )
	anoButton:SetSize(buttonWidth, buttonHeight)
	anoButton:SetPos((frameWidth * 0.5) - (buttonWidth * 0.5), 40 + buttonHeight + 10)
	anoButton:SetText("Message Anonyme")
	anoButton:SetFont("CloseCaption_Bold")
	anoButton.clickEvent = function()
		displayAdvertFrame(1)
	end

	function frame:OnRemove()
		frame = nil
	end
end)

--[[---------------------------------------------------------------------------
	Réception d'un message
--]]---------------------------------------------------------------------------
net.Receive("AgentPubMessage", function(len)
	local advertType = net.ReadBool()
	local writer = net.ReadEntity()
	local advertMessage = net.ReadString()
	
	if not IsValid(writer) then return end
	
	if not advertType then
		chat.ChatHook(writer, advertMessage, false, writer:Alive(), "(Annonce) " .. writer:Nick(), Color(255, 165, 0), Color(255, 165, 0))
	else
		chat.ChatHook(writer, advertMessage, false, writer:Alive(), "(Ano)", Color(255, 0, 0), Color(255, 255, 0))
	end
end)