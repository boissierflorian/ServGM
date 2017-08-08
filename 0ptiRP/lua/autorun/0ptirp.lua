if SERVER then
    AddCSLuaFile( "core/sh_core.lua" )
end

include( "core/sh_core.lua" )

OptiRP.SharedInclude( "core/sh_config.lua" )
OptiRP.SharedInclude( "core/sh_tools.lua" )
OptiRP.SharedInclude( "core/sh_misc.lua" )

OptiRP.ServerInclude( "core/server/sv_adverts.lua" )
OptiRP.ServerInclude( "core/server/sv_mayor.lua" )

OptiRP.ClientInclude( "core/client/cl_adverts.lua" )
OptiRP.ClientInclude( "core/client/cl_mayor.lua" )