local isDraft = require(script.Parent.isDraft)
local constants = require(script.Parent.constants)

local BASE = constants.BASE

local function original<T>(draft: T)
	assert(isDraft(draft), "Immut.original can only be called on drafts")
	return rawget(draft :: any, BASE) :: T
end

return original
