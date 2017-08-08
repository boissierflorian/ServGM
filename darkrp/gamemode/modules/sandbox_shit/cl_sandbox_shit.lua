-- 0binar: Ajouter plus d'objets
local old_func = spawnmenu.AddToolMenuOption

local allowedOption = {
    ["precision"] = true,
    ["textscreen"] = true,
    ["button"] = true,
    ["remover"] = true,
    ["material"] = true,
    ["trails"] = true,
}

local categories = {
    ["Constraints"] = true,
    ["Construction"] = true,
    ["Poser"] = true,
    ["Render"] = true
}

function spawnmenu.AddToolMenuOption( tab, category, class, name, ... )
    if categories[category] and not allowedOption[ class ] then
        return
    end

    old_func( tab , category, class, name, ... )
end

--> Creations TABS
local tabs = spawnmenu.GetCreationTabs()

tabs["#spawnmenu.category.saves"] = nil
hook.Remove( "PostGameSaved", "OnCreationsSaved" )

tabs["#spawnmenu.category.dupes"] = nil
hook.Remove( "DupeSaveAvailable", "UpdateDupeSpawnmenuAvailable" )
hook.Remove( "DupeSaveUnavailable", "UpdateDupeSpawnmenuUnavailable" )
hook.Remove( "DupeSaved", "DuplicationSavedSpawnMenu" )
concommand.Remove( "dupe_show" )

tabs["#spawnmenu.category.postprocess"] = nil
hook.Remove( "PopulatePostProcess", "AddPostProcess" )