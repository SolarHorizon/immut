return function()
	local Draft = require(script.Parent.Draft)
	local makeDraftSafeReadOnly = require(script.Parent.makeDraftSafeReadOnly)
	local constants = require(script.Parent.constants)

	it("should return a draft-safe version of the given function", function()
		local function unsafe(t, k)
			return rawget(t, k)
		end

		local safe = makeDraftSafeReadOnly(unsafe)

		local draft = Draft.new({})
		local foo = {}
		draft.foo = foo -- new index that the unsafe fn, unsafe(draft, "foo"), would not find

		expect(safe(draft, "foo")).to.equal(foo)
	end)

	it("should return a function that does not create a clone of the draft", function()
		-- so that finishDraft returns the original table if the draft was not modified

		local function unsafe(t, k)
			return rawget(t, k)
		end

		local safe = makeDraftSafeReadOnly(unsafe)

		local original = { foo = "bar" }
		local draft = Draft.new(original)

		safe(draft, "foo")

		expect(rawget(draft, constants.CLONE)).to.never.be.ok()
	end)

	it("should allow non-drafts in the returned draft-safe function", function()
		local nonDraft = { "foo", "bar" }

		local safe = makeDraftSafeReadOnly(table.find)

		expect(function()
			safe(nonDraft, "bar")
		end).to.never.throw()
		
		expect(safe(nonDraft, "bar")).to.equal(2)
	end)
end
