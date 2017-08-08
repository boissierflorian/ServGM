--[[---------------------------------------------------------------------------
DarkRP custom jobs
---------------------------------------------------------------------------
This file contains your custom jobs.
This file should also contain jobs from DarkRP that you edited.

Note: If you want to edit a default DarkRP job, first disable it in darkrp_config/disabled_defaults.lua
      Once you've done that, copy and paste the job to this file and edit it.

The default jobs can be found here:
https://github.com/FPtje/DarkRP/blob/master/gamemode/config/jobrelated.lua

For examples and explanation please visit this wiki page:
http://wiki.darkrp.com/index.php/DarkRP:CustomJobFields

Add your custom jobs under the following line:
---------------------------------------------------------------------------]]

--[[---------------------------------------------------------------------------
Defines who can access VIP Jobs
---------------------------------------------------------------------------]]
local function canAccessVIPJobs(ply)
	return true
end

local function canAccessWL(ply)
	return true
end

local VIPFail = "Ce métier est reservé aux VIP"
local WLFail  = "Ce métier est White Listé"

--[[---------------------------------------------------------------------------
Administratif
---------------------------------------------------------------------------]]
TEAM_STAFF = DarkRP.createJob("Staff", {
	color = Color(20, 150, 20, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl"
		},
	description = [[Le staff]],
	weapons = {},
	command = "staff",
	max = 0,
	salary = 0,
	admin = 1,
	vote = false,
	hasLicense = false,
	customCheck = function(ply)
		return ADT.IsStaff(ply)
	end
})

--[[---------------------------------------------------------------------------
Civils
---------------------------------------------------------------------------]]
TEAM_CHOMEUR = DarkRP.createJob("Chômeur", {
	color = Color(20, 150, 20, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl"
		},
	description = [[Le métier de base. Les actions illégales sont interdites !
Les printers sont autorisés.
Les printers sont autorisés.
Les printers sont autorisés.
Les printers sont autorisés.]],
	weapons = {},
	command = "chomeur",
	category = "Légal",
	max = 0,
	salary = 0,
	admin = 0,
	vote = false,
	hasLicense = false,
})

TEAM_AFK = DarkRP.createJob("AFK", {
	color = Color(255, 255, 0, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl"
		},
	description = [[This text will serve as the description of
		this team.]],
	weapons = {},
	command = "afk",
	category = "Légal",
	max = 0,
	salary = 0,
	admin = 0,
	vote = true,
	hasLicense = false,
})

TEAM_SDF = DarkRP.createJob("SDF", {
	color = Color(20, 150, 20, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl"
		},
	description = [[This text will serve as the description of
		this team.]],
	weapons = {},
	command = "sdf",
	category = "Légal",
	max = 0,
	salary = 0,
	admin = 0,
	vote = false,
	hasLicense = false,
	hobo = true,
})

TEAM_TAXI = DarkRP.createJob("Chauffeur de taxi", {
	color = Color(20, 150, 20, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl"
		},
	description = [[This text will serve as the description of
		this team.]],
	weapons = {},
	command = "taxi",
	category = "Légal",
	max = 2,
	salary = 25,
	admin = 0,
	vote = false,
	hasLicense = false,
})

TEAM_INFIRMIER = DarkRP.createJob("Infirmier", {
	color = Color(138, 43, 226, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl"
		},
	description = [[This text will serve as the description of
		this team.]],
	weapons = {},
	command = "infirmier",
	category = "Légal",
	max = 2,
	salary = 25,
	admin = 0,
	vote = false,
	hasLicense = false,
	medic = true,
})

TEAM_AVOCAT = DarkRP.createJob("Avocat", {
	color = Color(20, 150, 20, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl"
		},
	description = [[This text will serve as the description of
		this team.]],
	weapons = {},
	command = "avocat",
	category = "Légal",
	max = 2,
	salary = 25,
	admin = 0,
	vote = false,
	hasLicense = false,
})

TEAM_FERMIER = DarkRP.createJob("Fermier", {
	color = Color(20, 150, 20, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl"
		},
	description = [[This text will serve as the description of
		this team.]],
	weapons = {},
	command = "fermier",
	category = "Légal",
	max = 2,
	salary = 25,
	admin = 0,
	vote = false,
	hasLicense = false,
})

TEAM_REPORTER = DarkRP.createJob("Reporter", {
	color = Color(20, 150, 20, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl"
		},
	description = [[This text will serve as the description of
		this team.]],
	weapons = {},
	command = "reporter",
	category = "Légal",
	max = 2,
	salary = 25,
	admin = 0,
	vote = false,
	hasLicense = false,
})

TEAM_LIVREUR = DarkRP.createJob("Livreur", {
	color = Color(20, 150, 20, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl"
		},
	description = [[This text will serve as the description of
		this team.]],
	weapons = {},
	command = "livreur",
	category = "Légal",
	max = 1,
	salary = 25,
	admin = 0,
	vote = false,
	hasLicense = false,
})

TEAM_BANQUIER = DarkRP.createJob("Banquier", {
	color = Color(20, 150, 20, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl"
		},
	description = [[This text will serve as the description of
		this team.]],
	weapons = {},
	command = "banquier",
	category = "Légal",
	max = 2,
	salary = 25,
	admin = 0,
	vote = false,
	hasLicense = false,
})


--[[---------------------------------------------------------------------------
Commerçants
---------------------------------------------------------------------------]]
TEAM_RESTAURATEUR = DarkRP.createJob("Restaurateur", {
	color = Color(216, 191, 216, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl"
		},
	description = [[This text will serve as the description of
		this team.]],
	weapons = {},
	command = "restaurateur",
	category = "Légal",
	max = 2,
	salary = 25,
	admin = 0,
	vote = false,
	hasLicense = false,
})

TEAM_QUINCAILLIER = DarkRP.createJob("Quincaillier", {
	color = Color(20, 150, 20, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl"
		},
	description = [[This text will serve as the description of
		this team.]],
	weapons = {},
	command = "quincaillier",
	category = "Légal",
	max = 2,
	salary = 25,
	admin = 0,
	vote = false,
	hasLicense = false,
})

TEAM_VENDEUR_ARMES = DarkRP.createJob("Vendeur d'armes", {
	color = Color(20, 150, 20, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl"
		},
	description = [[This text will serve as the description of
		this team.]],
	weapons = {},
	command = "vendeurarmes",
	category = "Illégal",
	max = 2,
	salary = 25,
	admin = 0,
	vote = false,
	hasLicense = false,
})


--[[---------------------------------------------------------------------------
Protection Civile
---------------------------------------------------------------------------]]
TEAM_RECRUE_DE_LA_POLICE = DarkRP.createJob("[WL] - Recrue de la police", {
	color = Color(0, 0, 255, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl"
		},
	description = [[This text will serve as the description of
		this team.]],
	weapons = {},
	command = "recruepolice",
	category = "Gouvernement",
	max = 0,
	salary = 25,
	admin = 0,
	vote = false,
	hasLicense = true,
	customCheck = canAccessWL,
	CustomCheckFailMsg = WLFail
})

TEAM_BRIGADIER = DarkRP.createJob("[WL] - Brigadier", {
	color = Color(65, 105, 225, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl"
		},
	description = [[This text will serve as the description of
		this team.]],
	weapons = {},
	command = "brigadier",
	category = "Gouvernement",
	max = 0,
	salary = 25,
	admin = 0,
	vote = false,
	hasLicense = true,
	customCheck = canAccessWL,
	CustomCheckFailMsg = WLFail
})


TEAM_LIEUTENANT = DarkRP.createJob("[WL] - Lieutenant", {
	color = Color(30, 144, 255, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl"
		},
	description = [[This text will serve as the description of
		this team.]],
	weapons = {},
	command = "lieutenant",
	category = "Gouvernement",
	max = 0,
	salary = 25,
	admin = 0,
	vote = false,
	hasLicense = true,
	customCheck = canAccessWL,
	CustomCheckFailMsg = WLFail
})

TEAM_COMMISSAIRE = DarkRP.createJob("[WL] - Commissaire", {
	color = Color(0, 191, 255, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl"
		},
	description = [[This text will serve as the description of
		this team.]],
	weapons = {},
	command = "commissaire",
	category = "Gouvernement",
	max = 1,
	salary = 25,
	admin = 0,
	vote = false,
	hasLicense = true,
	customCheck = canAccessWL,
	CustomCheckFailMsg = WLFail
})

TEAM_DOUANIER = DarkRP.createJob("[WL] - Douanier", {
	color = Color(0, 0, 255, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl"
		},
	description = [[This text will serve as the description of
		this team.]],
	weapons = {},
	command = "douanier",
	category = "Gouvernement",
	max = 0,
	salary = 25,
	admin = 0,
	vote = false,
	hasLicense = true,
	customCheck = canAccessWL,
	CustomCheckFailMsg = WLFail
})

TEAM_GIGN = DarkRP.createJob("[WL] - GIGN", {
	color = Color(0, 0, 255, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl"
		},
	description = [[This text will serve as the description of
		this team.]],
	weapons = {},
	command = "gign",
	category = "Gouvernement",
	max = 4,
	salary = 25,
	admin = 0,
	vote = false,
	hasLicense = true,
	customCheck = canAccessWL,
	CustomCheckFailMsg = WLFail
})

TEAM_BAC = DarkRP.createJob("[WL] - BAC", {
	color = Color(20, 150, 20, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl"
		},
	description = [[This text will serve as the description of
		this team.]],
	weapons = {},
	command = "bac",
	category = "Gouvernement",
	max = 2,
	salary = 25,
	admin = 0,
	vote = false,
	hasLicense = false,
	customCheck = canAccessWL,
	CustomCheckFailMsg = WLFail
})

TEAM_AGENT_DE_SECURITE = DarkRP.createJob("Agent de sécurité", {
	color = Color(20, 150, 20, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl"
		},
	description = [[This text will serve as the description of
		this team.]],
	weapons = {},
	command = "agentdesecurite",
	category = "Légal",
	max = 3,
	salary = 25,
	admin = 0,
	vote = false,
	hasLicense = true,
	customCheck = canAccessWL,
	CustomCheckFailMsg = WLFail
})


--[[---------------------------------------------------------------------------
Gouvernement
---------------------------------------------------------------------------]]
TEAM_MAIRE = DarkRP.createJob("Maire", {
	color = Color(255, 0, 0, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl"
		},
	description = [[This text will serve as the description of
		this team.]],
	weapons = {},
	command = "maire",
	max = 1,
	salary = 25,
	admin = 0,
	vote = false,
	hasLicense = true,
	mayor = true,
})

TEAM_GARDE_DU_MAIRE = DarkRP.createJob("Garde du maire", {
	color = Color(20, 150, 20, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl"
		},
	description = [[This text will serve as the description of
		this team.]],
	weapons = {},
	command = "gardedumaire",
	category = "Légal",
	max = 3,
	salary = 25,
	admin = 0,
	vote = false,
	hasLicense = true
})


--[[---------------------------------------------------------------------------
Illégal
---------------------------------------------------------------------------]]
TEAM_CAMBRIOLEUR = DarkRP.createJob("Cambrioleur", {
	color = Color(20, 150, 20, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl"
		},
	description = [[This text will serve as the description of
		this team.]],
	weapons = {},
	command = "cambrioleur",
	category = "Illégal",
	max = 2,
	salary = 25,
	admin = 0,
	vote = false,
	hasLicense = false
})

TEAM_PSYCOPATHE = DarkRP.createJob("[VIP] - Psycopathe", {
	color = Color(20, 150, 20, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl"
		},
	description = [[This text will serve as the description of
		this team.]],
	weapons = {},
	command = "psycopathe",
	category = "Illégal",
	max = 2,
	salary = 25,
	admin = 0,
	vote = false,
	hasLicense = false
})

TEAM_HACKEUR_ATM = DarkRP.createJob("Hackeur d'ATM", {
	color = Color(20, 150, 20, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl"
		},
	description = [[This text will serve as the description of
		this team.]],
	weapons = {},
	command = "hackeuratm",
	category = "Illégal",
	max = 2,
	salary = 25,
	admin = 0,
	vote = false,
	hasLicense = false
})

TEAM_FABRICANT_DE_COKE = DarkRP.createJob("Fabricant de coke", {
	color = Color(20, 150, 20, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl"
		},
	description = [[This text will serve as the description of
		this team.]],
	weapons = {},
	command = "fabricantdecoke",
	category = "Illégal",
	max = 2,
	salary = 25,
	admin = 0,
	vote = false,
	hasLicense = false
})

TEAM_FABRICANT_DE_WEED = DarkRP.createJob("Fabricant de weed", {
	color = Color(20, 150, 20, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl"
		},
	description = [[This text will serve as the description of
		this team.]],
	weapons = {},
	command = "fabricantdeweed",
	category = "Illégal",
	max = 2,
	salary = 25,
	admin = 0,
	vote = false,
	hasLicense = false
})

--[[---------------------------------------------------------------------------
Gangs
---------------------------------------------------------------------------]]
TEAM_MAFIEUX = DarkRP.createJob("Mafieux", {
	color = Color(20, 150, 20, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl"
		},
	description = [[This text will serve as the description of
		this team.]],
	weapons = {},
	command = "mafieux",
	category = "Illégal",
	max = 4,
	salary = 25,
	admin = 0,
	vote = false,
	hasLicense = false
})

TEAM_PARRAIN = DarkRP.createJob("[VIP] - Parrain", {
	color = Color(20, 150, 20, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl"
		},
	description = [[This text will serve as the description of
		this team.]],
	weapons = {},
	command = "parrain",
	category = "Illégal",
	max = 1,
	salary = 25,
	admin = 0,
	vote = false,
	hasLicense = false,
	customCheck = canAccessVIPJobs,
	CustomCheckFailMsg = WLFail
})

TEAM_YAKUZA = DarkRP.createJob("Yakuza", {
	color = Color(20, 150, 20, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl"
		},
	description = [[This text will serve as the description of
		this team.]],
	weapons = {},
	command = "yakuza",
	category = "Illégal",
	max = 4,
	salary = 25,
	admin = 0,
	vote = false,
	hasLicense = false
})

TEAM_CHEF_YAKUZA = DarkRP.createJob("[VIP] - Chef Yakuza", {
	color = Color(20, 150, 20, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl"
		},
	description = [[This text will serve as the description of
		this team.]],
	weapons = {},
	command = "chefyakuza",
	category = "Illégal",
	max = 1,
	salary = 25,
	admin = 0,
	vote = false,
	hasLicense = false,
	customCheck = canAccessVIPJobs,
	CustomCheckFailMsg = WLFail
})

TEAM_GANGSTER = DarkRP.createJob("Gangster", {
	color = Color(20, 150, 20, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl"
		},
	description = [[This text will serve as the description of
		this team.]],
	weapons = {},
	command = "gangster",
	category = "Illégal",
	max = 4,
	salary = 25,
	admin = 0,
	vote = false,
	hasLicense = false
})

TEAM_CHEF_GANGSTER = DarkRP.createJob("[VIP] - Chef Gangster", {
	color = Color(20, 150, 20, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl"
		},
	description = [[This text will serve as the description of
		this team.]],
	weapons = {},
	command = "chefgangster",
	category = "Illégal",
	max = 1,
	salary = 25,
	admin = 0,
	vote = false,
	hasLicense = false,
	customCheck = canAccessVIPJobs,
	CustomCheckFailMsg = WLFail
})

TEAM_CARTEL = DarkRP.createJob("[VIP] - Membre du cartel", {
	color = Color(20, 150, 20, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl"
		},
	description = [[This text will serve as the description of
		this team.]],
	weapons = {},
	command = "cartel",
	category = "Illégal",
	max = 4,
	salary = 25,
	admin = 0,
	vote = false,
	hasLicense = false,
	customCheck = canAccessVIPJobs,
	CustomCheckFailMsg = WLFail
})

TEAM_CHEF_CARTEL = DarkRP.createJob("[VIP] - Chef du cartel", {
	color = Color(20, 150, 20, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl"
		},
	description = [[This text will serve as the description of
		this team.]],
	weapons = {},
	command = "chefcartel",
	category = "Illégal",
	max = 1,
	salary = 25,
	admin = 0,
	vote = false,
	hasLicense = false,
	customCheck = canAccessVIPJobs,
	CustomCheckFailMsg = WLFail
})

--[[---------------------------------------------------------------------------
Define which team joining players spawn into and what team you change to if demoted
---------------------------------------------------------------------------]]
GAMEMODE.DefaultTeam = TEAM_CHOMEUR
--[[---------------------------------------------------------------------------
Define which teams belong to civil protection
Civil protection can set warrants, make people wanted and do some other police related things
---------------------------------------------------------------------------]]
GAMEMODE.CivilProtection = {
    [TEAM_RECRUE_DE_LA_POLICE] = true,
    [TEAM_BRIGADIER] = true,
	[TEAM_LIEUTENANT] = true,
	[TEAM_COMMISSAIRE] = true,
	[TEAM_DOUANIER] = true,
	[TEAM_GIGN] = true,
	[TEAM_BAC] = true,
    [TEAM_MAIRE] = true,
}