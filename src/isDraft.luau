local Draft = require(script.Parent.Draft)

--[=[
	@within Immut

	Checks if the given value is a draft.
]=]
local function isDraft(value: any): boolean
	if typeof(value) ~= "table" then
		return false
	end

	if getmetatable(value) ~= Draft then
		return false
	end

	return true
end

return isDraft
