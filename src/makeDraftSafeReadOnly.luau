--!strict
local constants = require(script.Parent.constants)
local isDraft = require(script.Parent.isDraft)

local BASE = constants.BASE
local CLONE = constants.CLONE

type Draft<K, V> = { [K]: V }
type Mutator<K, V, Args..., Return...> = (draft: Draft<K, V>, Args...) -> Return...

--[=[
	@within Immut
	@function makeDraftSafeReadOnly
	@param fn T
	@return T

	A wrapper for functions that bypass metatables (like using rawget) that will
	make them draft-safe. `makeDraftSafeReadonly` should only be used on functions that will 
	not mutate the table.

	This is used internally to wrap functions within Luau's table library that only perform read operations, and
	is exposed for your convenience.

	```lua
	local find = makeDraftSafeReadOnly(table.find)
	local concat = makeDraftSafeReadOnly(table.concat)

	local nextState = produce(state, function(draft)
		local value = find(draft.a, 1)
		print(concat(draft.b, ",")
	end)
	```
]=]
local function makeDraftSafeReadOnly<K, V, Args..., Return...>(fn: Mutator<K, V, Args..., Return...>): Mutator<K, V, Args..., Return...>
	return function(draft, ...)
		local t = draft

		if isDraft(t) then
			t = rawget(t, CLONE) or rawget(t, BASE)
		end

		return fn(t, ...)
	end
end

return makeDraftSafeReadOnly
