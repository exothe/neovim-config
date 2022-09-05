require("bufferline").setup({
	options = {
		offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
		close_command = "Bdelete! %d",
	},
	highlights = {
		buffer_selected = {
			ctermfg = 51,
		},
	},
})
