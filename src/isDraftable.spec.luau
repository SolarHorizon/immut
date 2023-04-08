return function()
	local isDraftable = require(script.Parent.isDraftable)

	it("should return false when given a value that is not a table", function()
		expect(isDraftable(1)).to.equal(false)
		expect(isDraftable(true)).to.equal(false)
		expect(isDraftable("string")).to.equal(false)
		expect(isDraftable(nil)).to.equal(false)
	end)

	it("should return false when given a table that has a metatable", function()
		expect(isDraftable(setmetatable({}, {}))).to.equal(false)
	end)

	it("should return true when given a table with no metatable", function()
		expect(isDraftable({})).to.equal(true)
	end)
end
