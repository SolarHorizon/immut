local makeDraftSafe = require(script.Parent.makeDraftSafe)

--[=[
	@class table

	Draft-safe table library replacement.
]=]

--[=[
	@within table
	@function insert
	@param t { V }
	@param pos number
	@param value V

	https://create.roblox.com/docs/reference/engine/libraries/table#insert
]=]

--[=[
	@within table
	@function remove
	@param t { V }
	@param pos number?
	@return V?

	https://create.roblox.com/docs/reference/engine/libraries/table#remove
]=]

--[=[
	@within table
	@function sort
	@param t { V }
	@param comp function

	https://create.roblox.com/docs/reference/engine/libraries/table#sort
]=]

--[=[
	@within table
	@function clear
	@param t { [K]: V }

	https://create.roblox.com/docs/reference/engine/libraries/table#clear
]=]

--[=[
	@within table
	@function find
	@param haystack { V }
	@param needle V
	@param init number?
	@return number?

	https://create.roblox.com/docs/reference/engine/libraries/table#find
]=]

--[=[
	@within table
	@function concat
	@param t { V }
	@param sep string?
	@param i number?
	@param j number?
	@return string

	https://create.roblox.com/docs/reference/engine/libraries/table#concat
]=]

--[=[
	@within table
	@function move
	@param src { V }
	@param a number
	@param b number
	@param t number?
	@param dst { V }?
	@return { V }

	https://create.roblox.com/docs/reference/engine/libraries/table#move
]=]

return {
	remove = makeDraftSafe(table.remove),
	sort = makeDraftSafe(table.sort),
	clear = makeDraftSafe(table.clear),
	find = makeDraftSafe(table.find),
	concat = makeDraftSafe(table.concat),
	move = makeDraftSafe(table.move),

	-- we cannot preserve the type of table.insert when passing it through
	-- makeDraftSafe because it is an overloaded function. this workaround
	-- will fix that (for now)
	insert = (makeDraftSafe(table.insert) :: any) :: typeof(table.insert),

	makeDraftSafe = makeDraftSafe,
}
