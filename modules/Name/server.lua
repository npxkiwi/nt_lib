---@class NT.Name
NT.Name = {}
local GetFullName = function()
    if Framework == 'esx' then
        return function(player)
            return player.get('firstName') .. ' ' .. player.get('lastName')
        end
    elseif Framework == 'qb' or Framework == 'qbx' then
        return function(player)
            if player.PlayerData and player.PlayerData.charinfo then
                return player.PlayerData.charinfo.firstname .. ' ' .. player.PlayerData.charinfo.lastname
            end
        end
    else
        return function()
            error(string.format("Unsupported framework: %s", Framework))
        end
    end
end
local GetPlayerFullName = GetFullName()
local GetFirstName = function()
    if Framework == 'esx' then
        return function(player)
            return player.get('firstName')
        end
    elseif Framework == 'qb' or Framework == 'qbx' then
        return function(player)
            if player.PlayerData and player.PlayerData.charinfo then
                return player.PlayerData.charinfo.firstname
            end
        end
    else
        return function()
            error(string.format("Unsupported framework: %s", Framework))
        end
    end
end
local GetPlayerFirstName = GetFirstName()
local GetLastName = function()
    if Framework == 'esx' then
        return function(player)
            return player.get('lastName')
        end
    elseif Framework == 'qb' or Framework == 'qbx' then
        return function(player)
            if player.PlayerData and player.PlayerData.charinfo then
                return player.PlayerData.charinfo.lastname
            end
        end
    else
        return function()
            error(string.format("Unsupported framework: %s", Framework))
        end
    end
end
local GetPlayerLastName = GetLastName()
NT.Name.GetFullName = function(source)
    local player = NT.Player(source)
    if not player then error(string.format("Player not found for source: %s", tostring(source))) end
    return GetPlayerFullName(player)
end
NT.Name.GetFirstName = function(source)
    local player = NT.Player(source)
    if not player then error(string.format("Player not found for source: %s", tostring(source))) end
    return GetPlayerFirstName(player)
end
NT.Name.GetLastName = function(source)
    local player = NT.Player(source)
    if not player then error(string.format("Player not found for source: %s", tostring(source))) end
    return GetPlayerLastName(player)
end

return NT.Name