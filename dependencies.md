# Dependencies

### This file contains all things that need to be installed manually for this config to work properly

- install packer

```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

- install an LSP for the languages you want and add them to `after/plugin/lsp.lua`
- add the languages you want to treesitter in `after/plugin/treesitter.lua`
- install formatters or maybe even add new ones to `after/plugin/null-ls.lua`
- a [patched font](https://www.nerdfonts.com/) needs to be installed and active in the terminal for nvim-tree
