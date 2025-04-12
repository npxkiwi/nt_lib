--- @class NT.Debug
NT.Debug = {}

local printType = {
	["debug"] = "^5[DEBUG]: ^7",
	["warn"] = "^3[WARN]: ^7",
	["success"] = "^2[SUCCESS]: ^7",
	["error"] = "^1[ERROR]: ^7",
}

NT.Debug = function(dbgtype,message)
    if printType[dbgtype] then
		if type(message) == "string" then
			print(printType[dbgtype]..message)
		else
			print(printType["error"].."No string found")
		end
	else
		print(printType["error"].."You need to specify the print type. Debug, Warn, Success & Error.")
	end
end

return NT.Debug