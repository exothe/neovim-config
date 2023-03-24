require("nvim-treesitter.configs").setup({
	auto_install = true,
	highlight = {
		enable = true,
		disable = function(lang, bufnr)
			print(lang)
			return lang == "latex"
		end,
	},
	autotag = {
		enable = true,
	},
})
