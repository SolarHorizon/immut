return function()
	local CLONE = require(script.Parent.constants).CLONE

	local Draft = require(script.Parent.Draft)
	local getClone = require(script.Parent.getClone)

	it("should return a draft's cloned table if it exists", function()
		local draft = Draft.new({})
		draft.foo = true

		expect(rawget(draft, CLONE)).to.be.ok()

		local clone = getClone(draft)

		expect(rawget(draft, CLONE)).to.equal(clone)
	end)

	it("should create a clone if a draft does not have one", function()
		local draft = Draft.new({})

		expect(rawget(draft, CLONE)).to.never.be.ok()

		local clone = getClone(draft)

		expect(rawget(draft, CLONE)).to.be.ok()
		expect(rawget(draft, CLONE)).to.equal(clone)
	end)
end
