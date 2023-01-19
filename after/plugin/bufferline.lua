vim.opt.termguicolors = true

require("bufferline").setup({
	options = {
		offsets = { { filetype = "NvimTree", text = "File tree", text_align = "center", padding = 1 } },
		close_command = "Bdelete %d",
		diagnostics = "nvim_lsp",

		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
	},
})
