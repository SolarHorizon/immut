local isDraft = require(script.Parent.isDraft)
local constants = require(script.Parent.constants)

local BASE = constants.BASE
local CLONE = constants.CLONE

local function finishDraft<T>(draft: T)
	assert(isDraft(draft), "Immut.finishDraft should only be called on drafts")

	local final = rawget(draft :: any, CLONE)

	if final == nil then
		return rawget(draft :: any, BASE)
	end

	for key, value in final do
		if isDraft(value) then
			final[key] = finishDraft(value)
		end
	end

	return final :: T
end

return finishDraft
