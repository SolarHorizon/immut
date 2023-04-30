local isDraft = require(script.Parent.isDraft)
local constants = require(script.Parent.constants)

local BASE = constants.BASE
local CLONE = constants.CLONE

--[=[
	@within Immut
	@function current
	@param draft Draft
	@return table

	Returns a snapshot of the current state of a draft. This can be expensive,
	so use it sparingly.
]=]

--[=[
	@within Immut
	@param draft T
	@return T?

	:::tip
	It's unlikely you'll need to use this unless you have a very specific use
	case. Try using `produce` instead!
	:::

	Finalize a draft. When given [`None`](/api/Immut#None), returns `nil`. When
	given a non-draft value, returns that value.
]=]
local function finishDraft<T>(draft: T): T
	if typeof(draft) ~= "table" then
		return draft
	end

	local final = draft

	if isDraft(draft) then
		final = rawget(draft, CLONE)

		if final == nil then
			return rawget(draft, BASE)
		end
	end

	for key, value in final do
		final[key] = finishDraft(value)
	end

	return final
end

return finishDraft
