--[[---------------------------------------------------------------------------
	Agent publicitaire créé par 0binar
	
	Eh petit con ! Arrêtes de fouiner !
--]]---------------------------------------------------------------------------

ENT.Type                  = "ai"
ENT.Base                  = "base_ai"
ENT.Category              = "OptiRP"
ENT.Author                = "0binar"
ENT.Spawnable             = true
ENT.AutomaticFrameAdvance = true

function ENT:SetAutomaticFrameAdvance(bUsingAnim)
	self.AutomaticFrameAdvance = bUsingAnim
end