local tsUtils = require("nvim-treesitter.ts_utils")
local Remap = require("keymap")

local i = Remap.inoremap

local function contextAwareCtrlJ()
	local node = tsUtils.get_node_at_cursor()
	if node == nil then
		return
	end

	local parent = node:parent()
	while parent ~= nil and parent:type() ~= "list" do
		node = parent
		parent = node:parent()
	end

	if parent == nil then
		return
	end

	local has_todo = false

	for child in node:iter_children() do
		if child:type() == "task_list_marker_unchecked" then
			has_todo = true
		end
	end

	local cmd = 'execute(" norm o- '
	if has_todo then
		cmd = cmd .. "[ ]  "
	else
		cmd = cmd .. " "
	end
	cmd = cmd .. '")'

	vim.cmd(cmd)
end

i("<C-j>", contextAwareCtrlJ)
