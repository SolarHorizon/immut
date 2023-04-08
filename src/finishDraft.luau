local isDraft = require(script.Parent.isDraft)
local constants = require(script.Parent.constants)

local BASE = constants.BASE
local CLONE = constants.CLONE

--[=[
	@within Immut
	@param draft Draft
	@return table

	:::tip
	It's unlikely you'll need to use this unless you have a very specific use
	case. Try using `produce` instead!
	:::

	Finalize a draft.
]=]
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
