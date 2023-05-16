return function()
	local Draft = require(script.Parent.Draft)
	local finishDraft = require(script.Parent.finishDraft)

	it("should return the given value when it is not a draft", function()
		local base = {}
		expect(finishDraft(base)).to.equal(base)
		expect(finishDraft(1)).to.equal(1)
		expect(finishDraft("foo")).to.equal("foo")
		expect(finishDraft(false)).to.equal(false)
		expect(finishDraft(nil)).to.equal(nil)
	end)

	it("should return the original table when the given draft was not modified", function()
		local original = { foo = true }

		local draft = Draft.new(original)

		local finished = finishDraft(draft)

		expect(finished).to.equal(original)
	end)

	it("should return a new table when the given draft was modified", function()
		local original = { foo = true }

		local draft = Draft.new(original)
		draft.bar = true

		local finished = finishDraft(draft)
		expect(finished).to.never.equal(original)
		expect(finished.foo).to.equal(true)
		expect(finished.bar).to.equal(true)
	end)

	it("should not mutate non-draft tables", function()
		local original = table.freeze({ foo = true })

		expect(function()
			finishDraft(original)
		end).to.never.throw()
	end)
end
