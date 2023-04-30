--!nocheck
return function()
	local None = require(script.Parent.None)
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

	it("should return the return value of the recipe when not nil or None", function()
		local override = { foo = true }

		local new = produce({}, function(_draft)
			return override
		end)

		expect(new.foo).to.equal(true)
		expect(new).to.equal(override)
	end)

	it("should return nil when the return value of the recipe is None", function()
		local new = produce({}, function(_draft)
			return None
		end)

		expect(new).to.equal(nil)
	end)

	it("should accept non-table non-draftable base", function()
		expect(function()
			produce(1, function() end)
		end).to.never.throw()

		expect(function()
			produce(true, function() end)
		end).to.never.throw()

		expect(function()
			produce("string", function() end)
		end).to.never.throw()

		expect(function()
			produce(nil, function() end)
		end).to.never.throw()
	end)

	it("should be able to return non-table non-draftable values", function()
		do
			local new = produce(nil, function() end)
			expect(new).to.equal(nil)
		end

		do
			local new = produce(1, function() end)
			expect(new).to.equal(1)
		end

		do
			local new = produce("string", function() end)
			expect(new).to.equal("string")
		end

		do
			local new = produce(true, function() end)
			expect(new).to.equal(true)
		end
	end)
end
