--[[--------------------------------------------------------------------
	Adverts System
--]]--------------------------------------------------------------------

--> Network
util.AddNetworkString("OptiRP_AdvertsMessage")
util.AddNetworkString("OptiRP_MainAdvert")

--> Community Adverts (Forum + TS3)
timer.Create("Adverts_Community", 600, 0, function()
	net.Start("OptiRP_AdvertsMessage")
		net.WriteUInt(0, 3)
	net.Broadcast()
end)
 
--> Donations
timer.Create("Adverts_Donations", 1000, 0, function()
	net.Start("OptiRP_AdvertsMessage")
		net.WriteUInt(1, 3)
	net.Broadcast()
end)

--> Admins stuff
timer.Create("Adverts_Admins", 800, 0, function()
	net.Start("OptiRP_AdvertsMessage")
		net.WriteUInt(2, 3)
	net.Broadcast()
end)

--> Recruitment
timer.Create("Adverts_Recruitment", 500, 0, function()
	net.Start("OptiRP_AdvertsMessage")
		net.WriteUInt(3, 3)
	net.Broadcast()
end)

--> Phones numbers
timer.Create("Adverts_EmergencyNumbers", 300, 0, function()
	net.Start("OptiRP_AdvertsMessage")
		net.WriteUInt(4, 3)
	net.Broadcast()
end)