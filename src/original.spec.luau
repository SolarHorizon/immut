--!nocheck
return function()
	local isDraft = require(script.Parent.isDraft)
	local Draft = require(script.Parent.Draft)

	it("should return false when given a value that isn't a draft", function()
		expect(isDraft(true)).to.equal(false)
		expect(isDraft({})).to.equal(false)
		expect(isDraft(setmetatable({}, {}))).to.equal(false)
	end)

	it("should return true when given a draft", function()
		expect(isDraft(Draft.new({}))).to.equal(true)
	end)
end
