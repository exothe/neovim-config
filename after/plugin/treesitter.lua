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
