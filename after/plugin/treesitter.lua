require("nvim-treesitter.configs").setup({
	auto_install = true,
	highlight = {
		enable = true,
		disable = function(lang, bufnr)
			return lang == "latex"
		end,
	},
	matchup = {
		enable = true,
	},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.con = {
	install_info = {
		url = "/path/to/repo", -- local path or git repo
		files = { "src/parser.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
		-- optional entries:
		generate_requires_npm = true, -- if stand-alone parser without npm dependencies
		requires_generate_from_grammar = true, -- if folder contains pre-generated src/parser.c
	},
	filetype = "con", -- if filetype does not match the parser name
}
