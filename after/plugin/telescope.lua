local Remap = require("keymap")

local n = Remap.nnoremap

n("<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
n("<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
n("<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
n("<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>")
n("<leader>fr", "<cmd>lua require('telescope.builtin').resume()<cr>")

require("telescope").setup({
	defaults = {
		file_ignore_patterns = { "node_modules/.*" },
	},
	pickers = {
		find_files = {
			hidden = true,
		},
	},
})
