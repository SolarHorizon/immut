--!strict
local CLONE = "_clone"
local BASE = "_base"

local Draft = {}

local function isDraft(value: any): (boolean, string?)
	if typeof(value) ~= "table" then
		return false, `Drafts can only be based off of tables. Got {typeof(value)}`
	end

	if getmetatable(value) ~= Draft then
		return false, "Table is not a draft."
	end

	return true
end

local function createDraft(base: { [any]: any })
	assert(typeof(base) == "table", `Drafts can only be based off of tables. Got {typeof(base)}`)
	assert(getmetatable(base :: any) == nil, "Cannot create a draft from a table with an existing metatable.")
	return setmetatable({ [BASE] = base } :: { [any]: any }, Draft)
end

local function finalizeDraft(draft: typeof(createDraft({} :: any)))
	assert(isDraft(draft))

	local final = rawget(draft :: any, CLONE)

	for key, value in final do
		if isDraft(value) then
			final[key] = finalizeDraft(value)
		end
	end

	return final
end

function Draft:__index(key: any)
	local target = rawget(self, CLONE) or rawget(self, BASE)

	local value = target[key] :: any

	if typeof(value) == "table" and getmetatable(value) ~= Draft then
		local nested = createDraft(value)
		self[key] = nested
		return nested
	end

	return value
end

function Draft:__newindex(key: any, value: any)
	local clone = rawget(self, CLONE)

	if clone == nil then
		clone = table.clone(rawget(self, BASE))
		rawset(self, CLONE, clone)
	end

	clone[key] = value
end

function Draft:__iter()
	return next, rawget(self, CLONE) or rawget(self, BASE)
end

return {
	createDraft = createDraft,
	finalizeDraft = finalizeDraft,
	isDraft = isDraft,
}
