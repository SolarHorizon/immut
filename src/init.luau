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
local tableLib = require(script.table)

return {
	createDraft = Draft.new,
	current = finishDraft,
	finishDraft = finishDraft,
	isDraft = isDraft,
	isDraftable = isDraftable,
	original = original,
	produce = produce,
	remove = tableLib.remove,
	insert = tableLib.insert,
}
