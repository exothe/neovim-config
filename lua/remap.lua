local Remap = require("keymap")
local n = Remap.nnoremap
local v = Remap.vnoremap


n("<leader>pv", ":Ex<CR>")
n("<C-b>", "<Esc>:Lex<CR>:vertical resize 30<CR>")
n("<C-j>", "<C-W>j")
n("<C-k>", "<C-W>k")
n("<C-h>", "<C-W>h")
n("<C-l>", "<C-W>l")

v("<", "<gv")
v(">", ">gv")
