--!strict
local isDraft = require(script.Parent.isDraft)
local getClone = require(script.Parent.getClone)

type Draft<K, V> = { [K]: V }
type Mutator<K, V, Args..., Return...> = (draft: Draft<K, V>, Args...) -> Return...

--[=[
	@within Immut
	@function makeDraftSafe
	@param fn T
	@return T

	A wrapper for table library functions that will make them draft-safe.
	`makeDraftSafe` is only necessary if:

	1. The function bypasses metatables (like using rawget/rawset)
	2. The function can mutate the table

	This is used internally to wrap functions within Luau's table library, and
	is exposed for your convenience.

	```lua
	local remove = makeDraftSafe(table.remove)

	local nextState = produce(state, function(draft)
		remove(draft, 1)
	end)
	```
]=]
local function makeDraftSafe<K, V, Args..., Return...>(fn: Mutator<K, V, Args..., Return...>): Mutator<K, V, Args..., Return...>
	return function(draft, ...)
		local t = draft

		if isDraft(t) then
			t = getClone(t :: any) :: any
		end

		return fn(t, ...)
	end
end

return makeDraftSafe
