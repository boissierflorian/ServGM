--[[---------------------------------------------------------------------------
	Le porte-feuille
--]]---------------------------------------------------------------------------

AddCSLuaFile()

if SERVER then
	util.AddNetworkString("PorteFeuille_Frame")
	AddCSLuaFile("cl_portefeuille.lua")
end

if CLIENT then
	SWEP.PrintName = "Porte-feuille"
    SWEP.Slot = 1
    SWEP.SlotPos = 1
    SWEP.DrawAmmo = false
    --SWEP.DrawCrosshair = false

    include("cl_portefeuille.lua")
end

--> Infos générales
SWEP.Author  = "0binar"
SWEP.Instructions = "Clic droit pour ouvrir son porte-feuille"
SWEP.Contact = "codneutro@gmail.com"
SWEP.Category = "OptiRP"

--> Propriétés des models
SWEP.WorldModel = ""
SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false

SWEP.UseHands = true
SWEP.Spawnable = true
SWEP.AdminSpawnabled = true

--> Propriétés de base
SWEP.HoldType = "normal"

--> Munitions Primaires
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""

--> Munitions Secondaires
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""

function SWEP:PrimaryAttack()
end

function SWEP:SecondaryAttack()
	self:SetNextSecondaryFire(CurTime() + 0.3)
	
	if SERVER then
		net.Start("PorteFeuille_Frame")
		net.Send(self:GetOwner())
	end
end

function SWEP:Reload()
end

function SWEP:Think()
end

function SWEP:Holster()
	return true
end

function SWEP:PreDrawViewModel()
	return true
end

function SWEP:Deploy()
    if CLIENT or not IsValid(self:GetOwner()) then 
		return true 
	end
	
    self:GetOwner():DrawWorldModel(false)
	
    return true
end