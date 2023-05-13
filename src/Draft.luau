--!strict
local constants = require(script.Parent.constants)
local getClone = require(script.Parent.getClone)

local BASE = constants.BASE
local CLONE = constants.CLONE

--[=[
	@within Immut
	@type Draft Draft<T>

	Drafts are the backbone of Immut. They allow you to interact with a table
	in a way which would normally mutate it, but immutably. Internally, a draft
	stores a reference to the original table and then clones that table as soon
	as you modify it in any way.
]=]
local Draft = {}

--[=[
	@within Immut
	@function createDraft
	@param base table
	@return Draft

	:::tip
	It's unlikely you'll need to use this unless you have a very specific use
	case. Try using `produce` instead!
	:::

	Create a new draft from the given table.
]=]
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
	local clone = getClone(self)
	clone[key] = value
end

function Draft:__len()
	return #(rawget(self, CLONE) or rawget(self, BASE))
end

function _next(self, last)
	local target = rawget(self, CLONE) or rawget(self, BASE)

	local key: any? = next(target, last)

	if key == nil then
		return nil
	end

	return key, self[key]
end

function Draft:__iter()
	return _next, self
end

return Draft
