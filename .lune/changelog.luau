local filename = process.args[1]

local changelog = fs.readFile(filename)
local index = string.find(changelog, "\n## ")
local latest = string.sub(changelog, 1, index)

stdio.write(latest)
