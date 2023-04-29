return function()
	local Draft = require(script.Parent.Draft)
	local makeDraftSafe = require(script.Parent.makeDraftSafe)

	it("should return a draft-safe version of the given function", function()
		local function unsafe(t, k, v)
			rawset(t, k, v)
		end

		local draft = Draft.new({})

		local safe = makeDraftSafe(unsafe)
		safe(draft, "foo", "bar")

		expect(rawget(draft, "foo")).to.never.be.ok()
		expect(draft.foo).to.equal("bar")
	end)
end
