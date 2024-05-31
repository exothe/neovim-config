require("nvim-treesitter.configs").setup({
	auto_install = true,
	highlight = {
		enable = true,
		disable = function(lang, bufnr)
			return lang == "latex" or
                vim.api.nvim_buf_line_count(bufnr) > 50000
		end,
	},
	matchup = {
		enable = true,
	},
})
