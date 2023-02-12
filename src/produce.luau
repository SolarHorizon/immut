--!strict
local draft = require(script.Parent.draft)

type AnyTable = { [any]: any }
type Draft<T> = typeof(draft.createDraft({} :: T & AnyTable))
type Recipe<T> = (draft: Draft<T>) -> any?

local function produce<T>(base: AnyTable, recipe: Recipe<T>): any
	local proxy = draft.createDraft(base)
	local nextValue = recipe(proxy) or proxy

	if draft.isDraft(nextValue) then
		nextValue = draft.finalizeDraft(nextValue)
	end

	return nextValue
end

return produce
