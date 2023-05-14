"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[265],{54481:e=>{e.exports=JSON.parse('{"functions":[{"name":"makeDraftSafeReadOnly","desc":"A wrapper for functions that bypass metatables (like using rawget) that will\\nmake them draft-safe. `makeDraftSafeReadonly` should only be used on functions that will \\nnot mutate the table.\\n\\nThis is used internally to wrap functions within Luau\'s table library that only perform read operations, and\\nis exposed for your convenience.\\n\\n```lua\\nlocal find = makeDraftSafeReadOnly(table.find)\\nlocal concat = makeDraftSafeReadOnly(table.concat)\\n\\nlocal nextState = produce(state, function(draft)\\n\\tlocal value = find(draft.a, 1)\\n\\tprint(concat(draft.b, \\",\\")\\nend)\\n```","params":[{"name":"fn","desc":"","lua_type":"T"}],"returns":[{"desc":"","lua_type":"T"}],"function_type":"static","source":{"line":34,"path":"src/makeDraftSafeReadOnly.luau"}},{"name":"insert","desc":"https://create.roblox.com/docs/reference/engine/libraries/table#insert","params":[{"name":"t","desc":"","lua_type":"{ V }"},{"name":"pos","desc":"","lua_type":"number"},{"name":"value","desc":"","lua_type":"V"}],"returns":[],"function_type":"static","source":{"line":19,"path":"src/table.luau"}},{"name":"remove","desc":"https://create.roblox.com/docs/reference/engine/libraries/table#remove","params":[{"name":"t","desc":"","lua_type":"{ V }"},{"name":"pos","desc":"","lua_type":"number?"}],"returns":[{"desc":"","lua_type":"V?"}],"function_type":"static","source":{"line":29,"path":"src/table.luau"}},{"name":"sort","desc":"https://create.roblox.com/docs/reference/engine/libraries/table#sort","params":[{"name":"t","desc":"","lua_type":"{ V }"},{"name":"comp","desc":"","lua_type":"function"}],"returns":[],"function_type":"static","source":{"line":38,"path":"src/table.luau"}},{"name":"clear","desc":"https://create.roblox.com/docs/reference/engine/libraries/table#clear","params":[{"name":"t","desc":"","lua_type":"{ [K]: V }"}],"returns":[],"function_type":"static","source":{"line":46,"path":"src/table.luau"}},{"name":"find","desc":"https://create.roblox.com/docs/reference/engine/libraries/table#find","params":[{"name":"haystack","desc":"","lua_type":"{ V }"},{"name":"needle","desc":"","lua_type":"V"},{"name":"init","desc":"","lua_type":"number?"}],"returns":[{"desc":"","lua_type":"number?"}],"function_type":"static","source":{"line":57,"path":"src/table.luau"}},{"name":"concat","desc":"https://create.roblox.com/docs/reference/engine/libraries/table#concat","params":[{"name":"t","desc":"","lua_type":"{ V }"},{"name":"sep","desc":"","lua_type":"string?"},{"name":"i","desc":"","lua_type":"number?"},{"name":"j","desc":"","lua_type":"number?"}],"returns":[{"desc":"","lua_type":"string"}],"function_type":"static","source":{"line":69,"path":"src/table.luau"}}],"properties":[],"types":[],"name":"table","desc":"Draft-safe table library replacement.","source":{"line":9,"path":"src/table.luau"}}')}}]);