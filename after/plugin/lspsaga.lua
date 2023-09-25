require("lspsaga").setup({
	symbol_in_winbar = {
		enable = false,
	},
	finder = {
		keys = {
			toggle_or_open = "<CR>",
		},
	},
})

local keymap = vim.keymap.set

keymap("n", "<leader>i", "<cmd>Lspsaga finder<CR>")
keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>")
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
keymap("n", "[E", function()
	require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
keymap("n", "]E", function()
	require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end)
