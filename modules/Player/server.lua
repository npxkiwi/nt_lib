local GetPlayer = function()
    if Framework == 'esx' then
        return function(source)
            return ESX.GetPlayerFromId(source)
        end
    elseif Framework == 'qb' then
        return function(source)
            return QBCore.Functions.GetPlayer(source)
        end
    else
        return function(source)
            error(string.format("Unsupported framework. Unable to retrieve player object for source: %s", source))
            return nil
        end
    end
end
local GetPlayerFromId = GetPlayer()
NT.Player = function(source)
    return GetPlayerFromId(source)
end

return NT.Player