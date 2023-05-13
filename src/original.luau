local isDraft = require(script.Parent.isDraft)
local constants = require(script.Parent.constants)

local BASE = constants.BASE

--[=[
	@within Immut

	Returns the original table. You can use this to opt out of Immut for any
	table, like in cases where it may be more performant to use another method,
	or when you want to do comparisons.

	## Example

	```lua
	local newState = produce(state, function(draft)
		local oldState = original(draft) -- returns the old state. don't mutate this!

		if oldState == someOtherValue then
			draft.isOtherValue = true
		end
	end)
]=]
local function original<T>(draft: T)
	assert(isDraft(draft), "Immut.original can only be called on drafts")
	return rawget(draft :: any, BASE) :: T
end

return original
