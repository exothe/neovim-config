vim.g.tokyonight_style = "night"

function SetScheme(scheme)
	vim.cmd("colorscheme " .. scheme)
end

SetScheme("tokyonight")
