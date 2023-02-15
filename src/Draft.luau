--!strict
local constants = require(script.Parent.constants)

local BASE = constants.BASE
local CLONE = constants.CLONE

local Draft = {}

function Draft.new<T>(base: T)
	assert(typeof(base) == "table", `Drafts can only be based off of tables. Got {typeof(base)}`)
	assert(getmetatable(base :: any) == nil, "Cannot create a draft from a table with an existing metatable.")
	return setmetatable({ [BASE] = base }, Draft) :: any
end

function Draft:__index(key: any)
	local target = rawget(self, CLONE) or rawget(self, BASE)

	local value = target[key] :: any

	if typeof(value) == "table" and getmetatable(value) ~= Draft then
		local nested = Draft.new(value)
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

return Draft
