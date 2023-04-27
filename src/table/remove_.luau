--!strict
local isDraft = require(script.Parent.Parent.isDraft)
local getClone = require(script.Parent.Parent.getClone)

--[=[
	@within Immut

	Draft-safe replacement for `table.remove`
]=]
local function remove<V>(draft: { V }, number: number?): V?
	local t = draft
	if isDraft(draft) then
		t = getClone(draft :: any)
	end

	return table.remove(t :: any, number)
end

return remove
