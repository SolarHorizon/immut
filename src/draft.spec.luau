return function()
	local Draft = require(script.Parent.draft)
	local createDraft = Draft.createDraft
	local isDraft = Draft.isDraft

	local function getClone(t)
		return rawget(t, "_clone")
	end

	describe("isDraft", function()
		it("should return false when given a value that isn't a draft", function()
			expect(isDraft(true)).to.equal(false)
			expect(isDraft({})).to.equal(false)
			expect(isDraft(setmetatable({}, {}))).to.equal(false)
		end)

		it("should return true when given a draft", function()
			expect(isDraft(createDraft({}))).to.equal(true)
		end)
	end)

	describe("createDraft", function()
		it("should not mutate the original table", function()
			local base = { a = "foo" } :: { a: any, b: any }

			local draft = createDraft(base)
			draft.a = "bar"
			draft.b = "baz"

			expect(base.a).to.equal("foo")
			expect(base.b).to.equal(nil)
		end)

		it("should mutate the cloned table", function()
			local base = { a = "foo" }

			local draft = createDraft(base)
			draft.a = "bar"
			draft.b = "baz"

			expect(base.a).to.equal("foo")

			local clone = getClone(draft)

			expect(clone.a).to.equal("bar")
			expect(clone.b).to.equal("baz")
		end)

		it("should clone the table when it has first been modified", function()
			local draft = createDraft({ a = "foo" })
			expect(getClone(draft)).to.equal(nil)

			draft.b = "bar"

			local clone = getClone(draft)

			expect(clone).to.be.ok()
			expect(clone.a).to.equal("foo")
			expect(clone.b).to.equal("bar")
		end)

		it("should return new values from the cloned table", function()
			local draft = createDraft({ a = "foo" })
			draft.a = "bar"
			draft.b = "baz"

			local clone = getClone(draft)

			expect(draft.a).to.equal(clone.a)
			expect(draft.b).to.equal(clone.b)
		end)

		it("should return unmodified values from the original table", function()
			local base = { a = "foo" }

			local draft = createDraft(base)
			draft.b = "baz"

			expect(draft.a).to.equal(base.a)
		end)

		it("should iterate through base table when unmodified and cloned table when modified", function()
			local base = {}

			for i = 1, 10 do
				base[i] = "original"
			end

			local draft = createDraft(base)

			for i, v in draft do
				expect(v).to.equal("original")
				draft[i] = "modified"
			end

			local clone = getClone(draft)

			for i, v in draft do
				expect(v).to.equal("modified")
				expect(clone[i]).to.equal("modified")
				expect(base[i]).to.equal("original")
			end
		end)

		it("should turn nested tables into drafts when indexed", function()
			local draft = createDraft({
				nested = {
					doubleNested = {},
				},
			})

			expect(isDraft(draft)).to.equal(true)
			expect(isDraft(draft.nested)).to.equal(true)
			expect(isDraft(draft.nested.doubleNested)).to.equal(true)
		end)

		it("should return the same nested draft when indexed more than once", function()
			local draft = createDraft({
				nested = {
					doubleNested = {},
				},
			})

			local nested1 = draft.nested
			local nested2 = draft.nested

			expect(nested1).to.equal(nested2)
			expect(nested2).to.equal(nested1)
		end)
	end)

	it("should remove nil values from the cloned table", function()
		local original = { a = true }

		local draft = createDraft(original)
		draft.a = nil

		expect(draft.a).to.never.be.ok()
		expect(original.a).to.be.ok()
	end)
end
