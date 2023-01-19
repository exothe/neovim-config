vim.g.tokyonight_style = "night"

function SetScheme(scheme)
	vim.cmd("colorscheme " .. scheme)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
end

SetScheme("tokyonight")
