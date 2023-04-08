local constants = require(script.Parent.constants)

local CLONE = constants.CLONE
local BASE = constants.BASE

local function getClone(draft)
	local clone = rawget(draft, CLONE)

	if clone == nil then
		clone = table.clone(rawget(draft, BASE))
		rawset(draft, CLONE, clone)
	end

	return clone
end

return getClone
