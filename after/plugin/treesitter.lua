require("nvim-treesitter.configs").setup({

	ensure_installed = { "typescript", "python", "lua", "java" },
	auto_install = true,

	highlight = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
})
