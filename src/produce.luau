--!strict
local Draft = require(script.Parent.Draft)
local finishDraft = require(script.Parent.finishDraft)
local isDraft = require(script.Parent.isDraft)

-- i've tried two type definitions for recipes, neither of which are that great.

-- when using this type, autocompletion for `draft` stops working
-- type Recipe<T> = ((draft: T) -> ()) | ((draft: T) -> T) | ((draft: T) -> nil)

-- when using this type, recipes will always need to explicitly return something.
-- `draft` autocompletion works though, so i think this is better, but not ideal.
type Recipe<T> = (draft: T) -> T?

--[=[
	@within Immut
	@param base table -- any table, so long as it doesn't have a metatable
	@param recipe (draft: Draft) -> table

	The primary way to use Immut. Takes a table and a recipe function which is
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
]=]
local function produce<T>(base: T, recipe: Recipe<T>): T
	local proxy = Draft.new(base) :: T

	-- https://discord.com/channels/385151591524597761/402843211707449354/997898224075550760
	local nextValue = ((recipe :: any)(proxy) or proxy) :: T

	if isDraft(nextValue) then
		nextValue = finishDraft(nextValue)
	end

	return nextValue
end

return produce
