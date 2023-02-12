return function()
	local immut = require(script.Parent)

	it("should load", function()
		expect(immut).to.be.ok()
	end)
end
