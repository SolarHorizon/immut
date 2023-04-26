--!strict
local isDraft = require(script.Parent.Parent.isDraft)
local getClone = require(script.Parent.Parent.getClone)

--[=[
	@within Immut

	Draft-safe replacement for `table.insert`
]=]
local function insert<V>(draft: { V }, pos: number | V, value: V?)
	local t = draft
	if isDraft(draft) then
		t = getClone(draft :: any)
	end

	if value == nil then
		return table.insert(t :: any, pos :: any)
	end

	return table.insert(t :: any, pos :: number, value)
end

return insert
