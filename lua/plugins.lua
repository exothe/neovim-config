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
	use("ray-x/lsp_signature.nvim")
	use("numToStr/Comment.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("lervag/vimtex") -- for latex
	use({ "mfussenegger/nvim-jdtls", disable = false }) -- for java jdtls

	-- Autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
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
	use("andymass/vim-matchup")

	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
	})

	use("folke/which-key.nvim")

	use({ "akinsho/toggleterm.nvim", tag = "v2.*" })

	use({ "akinsho/bufferline.nvim", requires = "nvim-tree/nvim-web-devicons" })
	use("moll/vim-bbye")

	use("breuckelen/vim-resize")
	use("tommcdo/vim-exchange")
	use("christoomey/vim-tmux-navigator")
	use("preservim/vimux")

	-- Git
	use("lewis6991/gitsigns.nvim")

	use({
		"epwalsh/obsidian.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
end)
