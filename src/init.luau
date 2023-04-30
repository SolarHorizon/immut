--[=[
	@class Immut

	An immutable data library based on Immer.js
]=]

local Draft = require(script.Draft)
local finishDraft = require(script.finishDraft)
local isDraft = require(script.isDraft)
local isDraftable = require(script.isDraftable)
local original = require(script.original)
local produce = require(script.produce)
local table = require(script.table)
local None = require(script.None)

return {
	createDraft = Draft.new,
	current = finishDraft,
	finishDraft = finishDraft,
	isDraft = isDraft,
	isDraftable = isDraftable,
	original = original,
	produce = produce,
	table = table,
	None = None,
	nothing = None,
}
