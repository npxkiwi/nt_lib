---@class NT.Npc
NT.Npc = {}
local activePeds = {}
local CreatePed = function(modelHash, coords, freeze, scenario, targetOptions, interactionType)
    local ped = CreatePed(0, modelHash, coords.x, coords.y, coords.z, coords.w, false, false)
    if freeze then FreezeEntityPosition(ped, true) end
    if scenario then TaskStartScenarioInPlace(ped, scenario, 0, true) end
    SetEntityVisible(ped, true)
    SetEntityInvincible(ped, true)
    PlaceObjectOnGroundProperly(ped)
    SetBlockingOfNonTemporaryEvents(ped, true)
    
    -- Add target interaction
    if targetOptions then
        NT.Interaction.AddTargetEntity(interactionType, ped, targetOptions)
    end

    -- Clean up the ped on resource stop
    AddEventHandler("onResourceStop", function(resource)
        if resource == GetCurrentResourceName() then
            if DoesEntityExist(ped) then
                DeleteEntity(ped)
            end
        end
    end)

    return ped
end
NT.Ped.CreatePed = function(data)
    local pedModel = type(data.model) == "string" and GetHashKey(data.model) or data.model
    NT.LoadModel(pedModel)
    local ped = CreatePed(pedModel, NT.Vector.ToVector(data.coords), data.freeze or false, data.scenario, data.targetOptions, data.interactionType)
    local id = #activePeds + 1
    activePeds[id] = ped
    return id
end
NT.Ped.RemovePed = function(pedId)
    local ped = activePeds[pedId]
    if DoesEntityExist(ped) then
        DeleteEntity(ped)
    end
    activePeds[pedId] = nil
end
NT.Ped.CreatePedAtPoint = function(data)
    local pointCoords = NT.Vector.ToVector3(data.coords)
    local point = NT.Points.New({
        coords = pointCoords,
        distance = data.distance,
        onEnter = function()
            if not data.pedId or not DoesEntityExist(activePeds[data.pedId]) then
                data.pedId = NT.Ped.CreatePed(data)
            end
        end,
        onExit = function()
            NT.Ped.RemovePed(data.pedId)
        end,
        debug = false, 
    })
    return point
end

return NT.Ped