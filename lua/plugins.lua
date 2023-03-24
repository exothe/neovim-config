-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use({ "williamboman/mason.nvim" })

	-- appearance
	use("folke/tokyonight.nvim")
	use("rmehri01/onenord.nvim")
	use("EdenEast/nightfox.nvim")
	use("xiyaowong/nvim-transparent")

	use("neovim/nvim-lspconfig") -- Configurations for Nvim LSP
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	use("terrortylor/nvim-comment")
	use("jose-elias-alvarez/null-ls.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("lervag/vimtex") -- for latex

	-- Autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("onsails/lspkind-nvim")

	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	use("nvim-telescope/telescope.nvim")

	use("nvim-treesitter/nvim-treesitter")

	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	use("tpope/vim-surround")

	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
		},
	})

	use("folke/which-key.nvim")

	use({ "akinsho/toggleterm.nvim", tag = "v2.*" })

	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "kyazdani42/nvim-web-devicons" })
	use("moll/vim-bbye")

	use("breuckelen/vim-resize")
	use("tommcdo/vim-exchange")

	-- Git
	use("lewis6991/gitsigns.nvim")
end)
