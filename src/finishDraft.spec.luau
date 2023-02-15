return function()
	local Draft = require(script.Parent.Draft)
	local finishDraft = require(script.Parent.finishDraft)

	it("should never accept a value that is not a draft", function()
		expect(function()
			finishDraft({})
		end).to.throw()

		expect(function()
			finishDraft(1)
		end).to.throw()

		expect(function()
			finishDraft("foo")
		end).to.throw()

		expect(function()
			finishDraft(false)
		end).to.throw()

		expect(function()
			finishDraft(Draft.new({}))
		end).to.be.ok()
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
end
