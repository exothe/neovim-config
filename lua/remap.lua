local Remap = require("keymap")
local n = Remap.nnoremap
local v = Remap.vnoremap
local i = Remap.inoremap

n("<leader>pv", ":Ex<CR>")
n("<leader>s", ":set spell!<CR>")
n("<leader>ws", ":w<CR>:so<CR>")
n("<C-j>", "<C-W>j")
n("<C-k>", "<C-W>k")
n("<C-h>", "<C-W>h")
n("<C-l>", "<C-W>l")
n("<C-n>", ":bnext<CR>")
n("<C-p>", ":bprevious<CR>")
n("<C-q>", ":Bd<CR>")
n("<C-d>", "<C-d>zz")
n("<C-u>", "<C-u>zz")
n("Y", "yg$")

v("<", "<gv")
v(">", ">gv")

v("*", "y/\\V<C-R>=escape(@\",'/\\')<CR><CR>")

i("<C-L>", "<Del>")
i("<C-c>", "<Esc>")
