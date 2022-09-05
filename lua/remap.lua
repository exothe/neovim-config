local Remap = require("keymap")
local n = Remap.nnoremap
local v = Remap.vnoremap

n("<leader>pv", ":Ex<CR>")
n("<leader>s", ":set spell!<CR>")
n("<leader>ws", ":w<CR>:so<CR>")
n("<C-j>", "<C-W>j")
n("<C-k>", "<C-W>k")
n("<C-h>", "<C-W>h")
n("<C-l>", "<C-W>l")
n("<C-n>", ":bnext<CR>")
n("<C-p>", ":bprevious<CR>")

v("<", "<gv")
v(">", ">gv")

v("*", "y/\\V<C-R>=escape(@\",'/\\')<CR><CR>")
