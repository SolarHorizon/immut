--!strict
local isDraft = require(script.Parent.Parent.isDraft)
local getClone = require(script.Parent.Parent.getClone)

--[=[
	@within Immut

	Draft-safe replacement for `table.remove`
]=]
local function remove<V>(draft: { V }, number: number?): V?
	assert(isDraft(draft), "Immut.remove can only be used on drafts")

	local clone = getClone(draft)

	return table.remove(clone :: any, number)
end

return remove
