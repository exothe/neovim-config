local dbee = require("dbee")
dbee.setup()

local Remap = require("keymap")
local n = Remap.nnoremap

n("<leader>md", function()
	dbee.open()
end)
n("<leader>mD", function()
	dbee.close()
end)
