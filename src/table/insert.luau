--!strict
local isDraft = require(script.Parent.Parent.isDraft)
local getClone = require(script.Parent.Parent.getClone)

--[=[
	@within Immut

	Draft-safe replacement for `table.insert`
]=]
local function insert<V>(draft: { V }, pos: number | V, value: V?)
	assert(isDraft(draft), "Immut.insert can only be used on drafts")

	local clone = getClone(draft :: any)

	return table.insert(clone :: any, pos :: any, value)
end

return insert
