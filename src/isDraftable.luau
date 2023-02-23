local function isDraftable(value: any): boolean
	if typeof(value) == "table" and getmetatable(value) == nil then
		return true
	end

	return false
end

return isDraftable
