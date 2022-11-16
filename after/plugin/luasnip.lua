local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

ls.config.set_config {
	history = true,
}
ls.add_snippets("typescript", {
	s("log", { t"console.log(", i(1), t");" })
})


ls.filetype_set("typescriptreact", {"typescript"})
