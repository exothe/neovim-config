local Remap = require("keymap")
local n = Remap.nnoremap

local function switchRunnerType()
	if vim.g.VimuxRunnerType == "pane" then
		vim.g.VimuxRunnerType = "window"
		vim.print("VimuxRunnerType set to " .. "window")
	else
		vim.g.VimuxRunnerType = "pane"
		vim.print("VimuxRunnerType set to " .. "pane")
	end
end

n("<leader>vo", ":VimuxOpenRunner<CR>")
n("<leader>vp", ":VimuxPromptCommand<CR>")
n("<leader>vl", ":VimuxRunLastCommand<CR>")
n("<leader>vx", ":VimuxCloseRunner<CR>")

n("<leader>vt", switchRunnerType)
