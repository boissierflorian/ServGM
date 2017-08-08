--[[--------------------------------------------------------------------
	Adverts System créé par 0binar
	
	Eh petit con ! Arrêtes de fouiner !
--]]--------------------------------------------------------------------

--[[--------------------------------------------------------------------
	Colors
--]]--------------------------------------------------------------------
local CommunityColor = Color(255, 200, 0)
local ForumColor     = Color(255, 0, 0)
local TS3Color       = Color(0, 255, 255)
local DonationsColor = Color(200, 0, 0)
local AdminColor     = Color(255, 0, 0)
local EmergencyColor = Color(0, 255, 0)
local PoliceColor    = Color(0, 150, 255)
local SamuColor      = Color(255, 20, 147)

--[[--------------------------------------------------------------------
	Refresh du chat
--]]--------------------------------------------------------------------
net.Receive("OptiRP_AdvertsMessage", function(len)
	local type = net.ReadUInt(3)
	
	--> Community Adverts (Forum + TS3)
	if type == 0 then
		chat.AddText(CommunityColor, "Liens de la communauté :")
		chat.AddText(ForumColor, "Site Officiel : www.optirp.fr")
		chat.AddText(TS3Color, "Teamspeak3 : www.ts3-optirp.fr")
	--> Donations
	elseif type == 1 then
		chat.AddText(DonationsColor, "Pour faire un don ou acheter le VIP -> Menu [F4]")
	--> Admins stuff
	elseif type == 2 then
		chat.AddText(AdminColor, [[Besoin du staff ? /// <Joueur concerné> + <raison>
Tout abus ou ticket inprécis sera sévèrement puni !]])
	--> Recruitment
	elseif type == 3 then
		chat.AddText(AdminColor, "Nous recrutons des modérateurs pour le serveur #1 !")
	--> Emergency Numbers
	elseif type == 4 then
		chat.AddText(EmergencyColor, "Les numéros du service publique:")
		chat.AddText(PoliceColor, "Police - 17")
		chat.AddText(SamuColor, "SAMU - 15")
	end
end)


local advert_queue = {}

--[[--------------------------------------------------------------------
	Main Advert
--]]--------------------------------------------------------------------
net.Receive( "OptiRP_MainAdvert", function(len)
	local advert = net.ReadString()
	local length = #advert_queue

	--> Avoid spam
	if length == 5 then
		return
	end

	advert_queue[length + 1] = advert
end)


local Grey = Color( 225, 225, 225 )
local MainAdvertColor = Color( 150, 150, 150 )
local timer
local rm = table.remove

hook.Add("HUDPaint", "OptiRP_MainAdvertHUD", function()
	if #advert_queue > 0 then
		
		local advertMsg = advert_queue[1]

		if not timer then
			timer = CurTime() + OptiRP.MainAdvertDelay
		else
			if CurTime() >= timer then
				timer = nil
				rm( advert_queue, 1 )
				return
			end
		end

		draw.RoundedBox( 0, 0, 0, ScrW(), ScrH() * 0.1, Grey )
		draw.SimpleText( advertMsg, "DermaLarge", ScrW() * 0.5, ScrH() * 0.05, 
			MainAdvertColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
end)