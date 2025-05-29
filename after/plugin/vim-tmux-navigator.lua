local n = require("keymap").nnoremap

n("<C-h>", "<cmd>TmuxNavigateLeft<cr>")
n("<C-j>", "<cmd>TmuxNavigateDown<cr>")
n("<C-k>", "<cmd>TmuxNavigateUp<cr>")
n("<C-l>", "<cmd>TmuxNavigateRight<cr>")
