vim.api.nvim_create_autocmd("FileType", {
	pattern = { "tex" },
	callback = function()
		vim.keymap.set("i", "<C-j>", "<Esc>A<CR>\\item ", { noremap = true })
		vim.o.textwidth = 160
		vim.o.cc = "+1"
	end,
})
