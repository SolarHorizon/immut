return function()
	local produce = require(script.Parent.produce)

	it("should not mutate the original table", function()
		local original = {}

		local new = produce(original, function(draft)
			draft.foo = true
		end)

		expect(new.foo).to.equal(true)
		expect(original.foo).to.equal(nil)
		expect(original).to.never.equal(new)
	end)

	it("should return the return value of the recipe when not nil", function()
		local override = { foo = true }

		local new = produce({}, function(_draft)
			return override
		end)

		expect(new.foo).to.equal(true)
		expect(new).to.equal(override)
	end)
end
