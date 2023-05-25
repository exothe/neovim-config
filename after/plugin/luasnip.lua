local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

-- typescript snippets
ls.config.set_config({
	history = false,
	region_check_events = { "CursorMoved" },
})
ls.add_snippets("typescript", {
	s("log", { t("console.log("), i(1), t(");") }),
})

ls.filetype_set("typescriptreact", { "typescript" })

-- latex snippets
ls.add_snippets("tex", {
	s({ trig = "ize", dscr = "Itemize environment" }, {
		t({
			"\\begin{itemize}",
			"    \\item ",
		}),
		i(1),
		t({
			"",
			"\\end{itemize}",
		}),
	}),
	s({ trig = "enum", dscr = "Enumerate environment" }, {
		t({
			"\\begin{enumerate}",
			"    \\item ",
		}),
		i(1),
		t({
			"",
			"\\end{enumerate}",
		}),
	}),
})
