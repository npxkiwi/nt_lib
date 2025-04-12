---@class NT.Info
NT.Info = {}
local GetJob = function()
    if Framework == 'esx' then
        return function(player)
            return player.job.name
        end
    else
        return function()
            error(string.format("Unsupported framework: %s", Framework))
        end
    end
end
local GetPlayerJob = GetJob()
NT.Info.GetJob = function(source)
	local player = NT.Player(source)
    if not player then error(string.format("Player not found for source: %s", tostring(source))) end
	GetPlayerJob(player)
end

return NT.Info