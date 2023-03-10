--!nocheck
return function()
	local produce = require(script.Parent.produce)

	it("should not mutate the original table", function()
		local original = { number = 2 }

		local new = produce(original, function(draft)
			draft.foo = true
			draft.number += 2
		end)

		expect(new.foo).to.equal(true)
		expect(new.number).to.equal(4)
		expect(original.foo).to.equal(nil)
		expect(original.number).to.equal(2)
		expect(original).to.never.equal(new)
	end)

	it("should not mutate nested tables", function()
		local original = {
			modified = nil,
			nested = {
				modified = nil,
				nestedDeep = { modified = nil },
			},
		}

		local new = produce(original, function(draft)
			draft.nested.modified = true
			draft.nested.nestedDeep.modified = true
		end)

		expect(new.nested.modified).to.be.ok()
		expect(new.nested.nestedDeep.modified).to.be.ok()
		expect(original.nested.modified).to.never.be.ok()
		expect(original.nested.nestedDeep.modified).to.never.be.ok()
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
