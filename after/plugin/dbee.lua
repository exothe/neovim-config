require("dbee").setup()

local Remap = require("keymap")
local n = Remap.nnoremap

n("<leader>md", ":lua require'dbee'.open()<CR>")
