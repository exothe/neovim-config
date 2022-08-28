require('nvim-treesitter.configs').setup {

	ensure_installed = { "typescript", "python", "lua" },
  auto_install = true,

  highlight = {
    enable = true,
  },
}
