"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[868],{31703:e=>{e.exports=JSON.parse('{"functions":[{"name":"makeDraftSafe","desc":"A wrapper for functions that bypass metatables (like using rawset) that will\\nmake them draft-safe. `makeDraftSafe` is only necessary if the function will \\nmutate the table. If the unsafe function is only reading from the table\\n(using rawget), consider using [`original`](/api/Immut#original) or \\n[`current`](/api/Immut#current) instead. Otherwise, you can use [`makeDraftSafeReadOnly`](/api/Immut#makeDraftSafeReadonly).\\n\\nThis is used internally to wrap functions within Luau\'s table library, and\\nis exposed for your convenience.\\n\\n```lua\\nlocal remove = makeDraftSafe(table.remove)\\nlocal insert = makeDraftSafe(table.insert)\\n\\nlocal nextState = produce(state, function(draft)\\n\\tlocal value = remove(draft.a, 1)\\n\\tinsert(draft.b, 1, value)\\nend)\\n```","params":[{"name":"fn","desc":"","lua_type":"T"}],"returns":[{"desc":"","lua_type":"T"}],"function_type":"static","source":{"line":33,"path":"src/makeDraftSafe.luau"}},{"name":"isDraftable","desc":"Checks if a value can be wrapped with a draft. Tables without metatables\\nare the only draftable values.","params":[{"name":"value","desc":"","lua_type":"any"}],"returns":[{"desc":"","lua_type":"boolean\\n"}],"function_type":"static","source":{"line":7,"path":"src/isDraftable.luau"}},{"name":"isDraft","desc":"Checks if the given value is a draft.","params":[{"name":"value","desc":"","lua_type":"any"}],"returns":[{"desc":"","lua_type":"boolean\\n"}],"function_type":"static","source":{"line":8,"path":"src/isDraft.luau"}},{"name":"current","desc":"Returns a snapshot of the current state of a draft. This can be expensive,\\nso use it sparingly.","params":[{"name":"draft","desc":"","lua_type":"Draft"}],"returns":[{"desc":"","lua_type":"table"}],"function_type":"static","source":{"line":16,"path":"src/finishDraft.luau"}},{"name":"finishDraft","desc":":::tip\\nIt\'s unlikely you\'ll need to use this unless you have a very specific use\\ncase. Try using `produce` instead!\\n:::\\n\\nFinalize a draft. When given [`None`](/api/Immut#None), returns `nil`. When\\ngiven a non-draft value, returns that value.","params":[{"name":"draft","desc":"","lua_type":"T"}],"returns":[{"desc":"","lua_type":"T?"}],"function_type":"static","source":{"line":30,"path":"src/finishDraft.luau"}},{"name":"produce","desc":"The primary way to use Immut. Takes a value and a recipe function which is\\npassed a draft that can be mutated, producing a new table with those changes\\nmade to it.\\n\\n### Examples\\n\\n```lua\\nlocal state = {\\n\\tpets = {\\n\\t\\tmittens = {\\n\\t\\t\\ttype = \\"cat\\",\\n\\t\\t\\tmood = \\"lonely\\",\\n\\t\\t},\\n\\t}\\n}\\n\\n-- mittens is lonely. let\'s get her a friend\\nlocal newState = produce(state, function(draft)\\n\\tdraft.pets.spot = {\\n\\t\\ttype = \\"dog\\",\\n\\t\\tmood = \\"curious\\",\\n\\t}\\n\\n\\tdraft.pets.mittens.mood = \\"happy\\"\\nend)\\n```\\n\\nRecipe functions do not need to return anything. When they do, the returned\\nvalue will be used instead of the draft.\\n\\n:::tip\\nWhen in strict mode, recipes do need an explicit return. You can simply\\nreturn the draft or nil to avoid type errors.\\n:::\\n\\n```lua\\nlocal newState = produce(state, function(draft)\\n\\treturn {} -- newState becomes an empty table\\nend)\\n```","params":[{"name":"base","desc":"any value is acceptable, so long as it isn\'t a table with a metatable","lua_type":"any"},{"name":"recipe","desc":"","lua_type":"(draft: Draft) -> any?"}],"returns":[{"desc":"","lua_type":"T?\\n"}],"function_type":"static","source":{"line":62,"path":"src/produce.luau"}},{"name":"original","desc":"Returns the original table. You can use this to opt out of Immut for any\\ntable, like in cases where it may be more performant to use another method.","params":[{"name":"draft","desc":"","lua_type":"T"}],"returns":[],"function_type":"static","source":{"line":12,"path":"src/original.luau"}},{"name":"makeDraftSafeReadOnly","desc":"A wrapper for functions that bypass metatables (like using rawget) that will\\nmake them draft-safe. `makeDraftSafeReadonly` should only be used on functions that will \\nnot mutate the table.\\n\\nThis is used internally to wrap functions within Luau\'s table library that only perform read operations, and\\nis exposed for your convenience.\\n\\n```lua\\nlocal find = makeDraftSafeReadOnly(table.find)\\nlocal concat = makeDraftSafeReadOnly(table.concat)\\n\\nlocal nextState = produce(state, function(draft)\\n\\tlocal value = find(draft.a, 1)\\n\\tprint(concat(draft.b, \\",\\")\\nend)\\n```","params":[{"name":"fn","desc":"","lua_type":"T"}],"returns":[{"desc":"","lua_type":"T"}],"function_type":"static","source":{"line":34,"path":"src/makeDraftSafeReadOnly.luau"}},{"name":"createDraft","desc":":::tip\\nIt\'s unlikely you\'ll need to use this unless you have a very specific use\\ncase. Try using `produce` instead!\\n:::\\n\\nCreate a new draft from the given table.","params":[{"name":"base","desc":"","lua_type":"table"}],"returns":[{"desc":"","lua_type":"Draft"}],"function_type":"static","source":{"line":31,"path":"src/Draft.luau"}}],"properties":[{"name":"None","desc":"When returned from a recipe, the next value will be nil.\\n\\n```lua\\nlocal new = produce(state, function(draft)\\n\\treturn None\\nend)\\n\\nprint(new) -- nil\\n```","lua_type":"None","source":{"line":15,"path":"src/None.luau"}},{"name":"nothing","desc":"Alias for [`None`](/api/Immut#None)","lua_type":"None","source":{"line":22,"path":"src/None.luau"}}],"types":[],"name":"Immut","desc":"An immutable data library based on Immer.js","source":{"line":6,"path":"src/init.luau"}}')}}]);