OptiRP = {}
OptiRP.MajorVersion = 1
OptiRP.MinorVersion = 0
OptiRP.Revision = 0

OptiRP.Version = ("%u.%u.%u"):format( OptiRP.MajorVersion, OptiRP.MinorVersion, OptiRP.Revision )

function OptiRP.SharedInclude( luaFile )
    if SERVER then
        AddCSLuaFile( luaFile )
    end

    include( luaFile )
end

function OptiRP.ClientInclude( luaFile )
    if SERVER then
        AddCSLuaFile( luaFile )
    else
        include( luaFile )
    end
end

function OptiRP.ServerInclude( luaFile )
    if SERVER then
        include( luaFile )
    end
end