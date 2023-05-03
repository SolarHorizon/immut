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

	A wrapper for functions that bypass metatables (like using rawset) that will
	make them draft-safe. `makeDraftSafe` is only necessary if the function will 
	mutate the table. If the unsafe function is only reading from the table
	(using rawget), consider using [`original`](/api/Immut#original) or 
	[`current`](/api/Immut#current) instead. Otherwise, you can use [`makeDraftSafeReadOnly`](/api/Immut#makeDraftSafeReadonly).

	This is used internally to wrap functions within Luau's table library, and
	is exposed for your convenience.

	```lua
	local remove = makeDraftSafe(table.remove)
	local insert = makeDraftSafe(table.insert)

	local nextState = produce(state, function(draft)
		local value = remove(draft.a, 1)
		insert(draft.b, 1, value)
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
