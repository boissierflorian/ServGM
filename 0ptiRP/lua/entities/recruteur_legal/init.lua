--[[---------------------------------------------------------------------------
	Agent publicitaire créé par 0binar
--]]---------------------------------------------------------------------------

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

--> Network
util.AddNetworkString("Recruteur_Legal_Frame")

--[[---------------------------------------------------------------------------
	Initialisation de l'entité
--]]---------------------------------------------------------------------------
function ENT:Initialize()
	self:SetModel("models/mossman.mdl")
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
		net.Start("Recruteur_Legal_Frame")
		net.Send(caller)
	end
end