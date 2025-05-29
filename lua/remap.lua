local Remap = require("keymap")
local n = Remap.nnoremap
local v = Remap.vnoremap
local i = Remap.inoremap
local c = Remap.cnoremap
local t = Remap.tnoremap

n("<leader>s", ":set spell!<CR>")
n("<leader>ws", ":w<CR>:so<CR>")
n("<C-n>", ":bnext<CR>")
n("<C-p>", ":bprevious<CR>")
n("<C-q>", ":Bd<CR>")
n("<C-d>", "<C-d>zz")
n("<C-u>", "<C-u>zz")
n("Y", "yg$")
n("<leader>of", "<cmd>ObsidianQuickSwitch<CR>")
n("<leader>on", "<cmd>ObsidianNew<CR>")
n("gf", function()
	if require("obsidian").util.cursor_on_markdown_link() then
		return ":ObsidianFollowLink<CR>"
	else
		return "gf"
	end
end)
n("<leader>mf", 'i<C-r>=expand("%:t:r")<CR><Esc>')
n("<M-j>", ":cnext<CR>")
n("<M-k>", ":cprevious<CR>")
n("<M-q>", ":cclose<CR>")

v("<", "<gv")
v(">", ">gv")
v("J", ":m '>+1<CR>gv=gv")
v("K", ":m '<-2<CR>gv=gv")
v("$", "g_")
v("g_", "$")

v("*", "y/\\V<C-R>=escape(@\",'/\\')<CR><CR>")

i("<C-L>", "<Del>")
i("<C-c>", "<Esc>")
i("<C-b>", "<C-r>+")
i("<C-g><C-h>", "<left>")
i("<C-g><C-l>", "<right>")

c("<A-h>", "<left>")
c("<A-l>", "<right>")
c("<A-k>", "<up>")
c("<A-j>", "<down>")

t("<C-o>", "<C-\\><C-n>")

vim.cmd([[ imap <silent><expr> <Tab> luasnip#expandable() ? '<Plug>luasnip-expand-snippet' : '<Tab>' ]])
