NT.Log = function (name,title,color,message,webhook)
    local embed = {{["color"] = color,["title"] = "**" .. title .. "**",["description"] = message,}}
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST',json.encode({ username = name, embeds = embed }), { ['Content-Type'] = 'application/json' })
end

return NT.Log