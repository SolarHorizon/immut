local finishDraft = require(script.finishDraft)
local isDraft = require(script.isDraft)
local original = require(script.original)
local produce = require(script.produce)
local Draft = require(script.Draft)

return {
	current = finishDraft,
	finishDraft = finishDraft,
	createDraft = Draft.new,
	isDraft = isDraft,
	original = original,
	produce = produce,
}
