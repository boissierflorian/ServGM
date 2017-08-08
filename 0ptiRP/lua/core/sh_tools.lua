function OptiRP.GetPoliceCount( countHidden )
    local copCount = 0

    if countHidden then
        for k, v in pairs(player.GetAll()) do
            local teamName = team.GetName(v:Team())

            if OptiRP.PoliceJobs[teamName] or OptiRP.HiddenPoliceJobs[teamName]  then
                copCount = copCount + 1
            end
        end
    else
        for k, v in pairs(player.GetAll()) do
            if OptiRP.PoliceJobs[team.GetName(v:Team())] then
                copCount = copCount + 1
            end
        end
    end

    return copCount
end