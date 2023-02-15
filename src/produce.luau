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
