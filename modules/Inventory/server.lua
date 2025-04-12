--- @class NT.Inventory
NT.Inventory = {}

NT.Inventory.HasItem = function(source, item)
    return exports.ox_inventory:Search(source, 'count', item)
end

NT.Inventory.AddItem = function(source, item, count)
    return exports.ox_inventory:AddItem(source, item, count)
end

NT.Inventory.RemoveItem = function(source, item, count)
    return exports.ox_inventory:RemoveItem(source, item, count)
end

NT.Inventory.GetItem = function(source, item)
    return exports.ox_inventory:GetItem(source, item)
end

NT.Inventory.CanCarry = function(source, item)
    return exports.ox_inventory:CanCarryItem(source, item)
end

return NT.Inventory