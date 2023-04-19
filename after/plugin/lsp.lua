local servers = {
	{ name = "tsserver", formatting = false },
	{ name = "pyright", formatting = false },
	{ name = "lua_ls", formatting = false },
	{ name = "jdtls", formatting = true },
	{ name = "rust_analyzer", formatting = true },
	{ name = "cssls", formatting = false },
	{ name = "svelte", formatting = true },
	{ name = "gopls", formatting = true },
	{ name = "clangd", formatting = true },
	-- when using cmake: use flag -DCMAKE_EXPORT_COMPILE_COMMANDS=1 when
	-- running cmake to generate the compile_commands.json which the lsp needs
	{ name = "cmake", formatting = true },
	{ name = "texlab", formatting = true },
	{ name = "kotlin_language_server", formatting = true },
}

local nvim_lsp = require("lspconfig")

local on_attach = function(formatting_enabled)
	return function(client, bufnr)
		-- This disables the formatting functionality for every lsp
		-- I want to do formatting via other formatters which are configured
		-- with null-ls
		client.server_capabilities.document_formatting = formatting_enabled

		-- Enable completion triggered by <c-x><c-o>
		vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

		-- Mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local bufopts = { noremap = true, silent = true, buffer = bufnr }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
		vim.keymap.set("n", "gK", vim.diagnostic.open_float, bufopts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
		vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, bufopts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, bufopts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
		vim.keymap.set("n", "<space>f", vim.lsp.buf.format, bufopts)
	end
end

local lsp_flags = {
	debounce_text_changes = 150,
}

-- to have a border around the boxes opended by the lsp
vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]])
vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])

local border = {
	{ "┌", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "┐", "FloatBorder" },
	{ "│", "FloatBorder" },
	{ "┘", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "└", "FloatBorder" },
	{ "│", "FloatBorder" },
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or border
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

for _, lsp in ipairs(servers) do
	if lsp.name == "sumneko_lua" then
		nvim_lsp[lsp.name].setup({
			flags = lsp_flags,
			on_attach = on_attach(lsp.formatting),
			settings = {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
				},
			},
		})
	else
		nvim_lsp[lsp.name].setup({
			flags = lsp_flags,
			on_attach = on_attach(lsp.formatting),
		})
	end
end
