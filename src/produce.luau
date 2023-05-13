--!strict
local Draft = require(script.Parent.Draft)
local None = require(script.Parent.None)
local finishDraft = require(script.Parent.finishDraft)
local isDraftable = require(script.Parent.isDraftable)

-- i've tried two type definitions for recipes, neither of which are that great.

-- when using this type, autocompletion for `draft` stops working
-- type Recipe<T> = ((draft: T) -> ()) | ((draft: T) -> T) | ((draft: T) -> nil)

-- when using this type, recipes will always need to explicitly return something.
-- `draft` autocompletion works though, so i think this is better, but not ideal.
type Recipe<T> = (draft: T) -> (T? | typeof(None))

--[=[
	@within Immut
	@param base any -- any value is acceptable, so long as it isn't a table with a metatable
	@param recipe (draft: Draft) -> any?

	The primary way to use Immut. Takes a value and a recipe function which is
	passed a draft that can be mutated, producing a new table with those changes
	made to it.

	### Examples

	```lua
	local state = {
		pets = {
			mittens = {
				type = "cat",
				mood = "lonely",
			},
		}
	}

	-- mittens is lonely. let's get her a friend
	local newState = produce(state, function(draft)
		draft.pets.spot = {
			type = "dog",
			mood = "curious",
		}

		draft.pets.mittens.mood = "happy"
	end)
	```

	Recipe functions do not need to return anything. When they do, the returned
	value will be used instead of the draft.

	:::tip
	When in strict typechecking mode, recipes do need an explicit return. You 
	can simply return the draft or nil to avoid type errors.
	:::

	```lua
	local newState = produce(state, function(draft)
		return {} -- newState becomes an empty table
	end)
	```
]=]
local function produce<T>(base: T, recipe: Recipe<T>): T?
	local proxy = isDraftable(base) and Draft.new(base) or base

	local nextValue = recipe(proxy :: T) or proxy

	if nextValue == None then
		return nil
	end

	return finishDraft(nextValue)
end

return produce
