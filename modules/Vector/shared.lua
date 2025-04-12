---@class NT.Vector
NT.Vector = {}
local function didnotspicy()
	NT.Debug("error", "You need to specify something.")
end
NT.Vector.ToVector = function(t)
	if not t then
		didnotspicy()
	else
		if t.w then
			return vector4(t.x,t.y,t.z,t.w)
		else
			return vector3(t.x,t.y,t.z)
		end
	end
end

NT.Vector.ToVector3 = function(vec)
	if not vec then
		didnotspicy()
	else
		if vec.w then
			return vector3(vec.x,vec.y,vec.z)
		end
		return vec
	end
end

NT.Vector.Add = function(vec1, vec2)
	if not vec1 or vec2 then
		didnotspicy()
	else
		if vec1.w and vec2.w then
			return vector4(vec1.x + vec2.x, vec1.y + vec2.y, vec1.z + vec2.z, vec1.w + vec2.w)
		else
			return vector3(vec1.x + vec2.x, vec1.y + vec2.y, vec1.z + vec2.z)
		end
	end
end

