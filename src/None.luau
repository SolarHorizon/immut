--[=[
	@within Immut
	@prop None None

	When returned from a recipe, the next value will be nil.

	```lua
	local new = produce(state, function(draft)
		return None
	end)

	print(new) -- nil
	```
]=]
local None = setmetatable({}, {
	__tostring = function()
		return "<Immut.None>"
	end,
})

return None
