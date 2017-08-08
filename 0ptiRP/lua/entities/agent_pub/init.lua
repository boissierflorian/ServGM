--[[---------------------------------------------------------------------------
	Agent publicitaire créé par 0binar
--]]---------------------------------------------------------------------------

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

--> Network
util.AddNetworkString("AgentPubFrame")
util.AddNetworkString("AgentPubSend")
util.AddNetworkString("AgentPubMessage")

--[[---------------------------------------------------------------------------
	Initialisation de l'entité
--]]---------------------------------------------------------------------------
function ENT:Initialize()
	self:SetModel("models/humans/Group01/male_06.mdl")
	self:SetHullType(HULL_TINY)
	self:SetHullSizeNormal()
	self:SetNPCState(NPC_STATE_SCRIPT)
	self:SetSolid(SOLID_BBOX)
	self:CapabilitiesAdd(CAP_TURN_HEAD)
	self:SetUseType(SIMPLE_USE)
	self:DropToFloor()
	self:SetMaxYawSpeed(90)
end

--[[---------------------------------------------------------------------------
	(E) sur l'entité
--]]---------------------------------------------------------------------------
function ENT:AcceptInput(input, activator, caller)
	if input == "Use" and caller:IsPlayer() then
		if not caller.pubTimer then
			caller.pubTimer = CurTime()
		else
			if not (CurTime() > caller.pubTimer + 10) then
				return
			else
				caller.pubTimer = CurTime()
			end
		end
		
		local rnd = math.random(1, 2)
		
		if rnd == 1 then
			self:EmitSound("vo/npc/male01/gordead_ans01.wav")
		else
			self:EmitSound("vo/npc/male01/finally.wav")
		end
	
		net.Start("AgentPubFrame")
		net.Send(caller)
	end
end

--[[---------------------------------------------------------------------------
	Achat d'une pub
--]]---------------------------------------------------------------------------
net.Receive("AgentPubSend", function(len, ply)
	if not IsValid(ply) then return end
	
	local advertType    = net.ReadBool()
	local advertMessage = net.ReadString()
		
	if not ply:canAfford(100) then
		DarkRP.notify(ply, 1, 4, "Il faut au minimum 100$ pour envoyer une annonce !")
		return
	end
	
	DarkRP.notify(ply, 0, 4, "Vous avez payé 100$ pour diffuser votre annonce !")
	ply:addMoney(-100)
	
	if advertMessage:len() > 200 then
		advertMessage = (advertMessage:sub(1, 200)) .. "..."
	end

	net.Start("AgentPubMessage")
		net.WriteBool(advertType)
		net.WriteEntity(ply)
		net.WriteString(advertMessage)
	net.Broadcast()
end)