local plugins = {
	-- appearance
	"folke/tokyonight.nvim",
	"rmehri01/onenord.nvim",
	"EdenEast/nightfox.nvim",
	"xiyaowong/nvim-transparent",

	"williamboman/mason.nvim",
	"neovim/nvim-lspconfig", -- Configurations for Nvim LSP
	{ "nvimdev/lspsaga.nvim", dependencies = { "nvim-lspconfig" } },
	"ray-x/lsp_signature.nvim",
	"numToStr/Comment.nvim",
	"nvimtools/none-ls.nvim",
	"williamboman/mason-lspconfig.nvim",
	"lervag/vimtex",
	"mfussenegger/nvim-jdtls",
	"vim-test/vim-test",
	"dmmulroy/tsc.nvim",

	-- database tool
	{
		"kndndrj/nvim-dbee",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		build = function()
			-- Install tries to automatically detect the install method.
			-- if it fails, try calling it with one of these parameters:
			--    "curl", "wget", "bitsadmin", "go"
			require("dbee").install()
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{
				"MattiasMTS/cmp-dbee",
				dependencies = {
					{ "kndndrj/nvim-dbee" },
				},
				ft = "sql", -- optional but good to have
				opts = {}, -- needed
			},
		},
		opts = {
			sources = {
				{ "cmp-dbee" },
			},
		},
	},
	-- Autocompletion
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"onsails/lspkind-nvim",

	"nvim-lua/plenary.nvim",
	"nvim-lua/popup.nvim",
	"nvim-telescope/telescope.nvim",

	"nvim-treesitter/nvim-treesitter",
	"nvim-treesitter/playground",

	"windwp/nvim-autopairs",
	"windwp/nvim-ts-autotag",
	"tpope/vim-surround",
	"andymass/vim-matchup",

	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
	},

	"folke/which-key.nvim",

	{ "akinsho/bufferline.nvim", dependencies = "nvim-tree/nvim-web-devicons" },
	"moll/vim-bbye",
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	"breuckelen/vim-resize",
	"tommcdo/vim-exchange",
	"christoomey/vim-tmux-navigator",
	"preservim/vimux",

	-- Git
	"lewis6991/gitsigns.nvim",

	{
		"epwalsh/obsidian.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = plugins,
})
