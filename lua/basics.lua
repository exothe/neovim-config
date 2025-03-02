local o = vim.o
local g = vim.g

function Set_tabwidth(tabwidth)
	o.shiftwidth = tabwidth
	o.tabstop = tabwidth
end

o.number = true
o.relativenumber = true
o.splitbelow = true
o.splitright = true
o.clipboard = "unnamedplus"
o.mouse = "a"
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.hlsearch = false
o.ignorecase = true
o.smartcase = true
o.textwidth = 120
o.listchars = "eol:⏎,tab:⇥¬¬,trail:·,nbsp:⎵"

g.mapleader = " "
