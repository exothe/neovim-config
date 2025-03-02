local Remap = require("keymap")

local n = Remap.nnoremap

n("<leader>tn", ":TestNearest<CR>")
n("<leader>tf", ":TestFile<CR>")
n("<leader>ts", ":TestSuite<CR>")
n("<leader>tl", ":TestLast<CR>")
n("<leader>tv", ":TestVisit<CR>")

vim.cmd([[let test#java#gradletest#options = '-i']])
vim.cmd([[let test#strategy = "neovim"]])

-- use vitests for all javascript and typescript tests
vim.cmd([[let g:test#javascript#runner = 'vitest']])
