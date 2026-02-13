# NVIM config
## Plugins
### Configured
plugins with proper configuration and/or keybinds
- [mason](https://github.com/mason-org/mason.nvim)
- [lualine](https://github.com/nvim-lualine/lualine.nvim)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
- nvim-treesitter
- tabby
- telescope
- toggleterm
### Basic / Simple 
plugins with little to no configuration, adds small but useful features; commenting shortcuts, auto bracket closing, todo comment highlighting, indent guides, etc.
- tinted-vim
- auto-save
- autoclose
- comment
- git-blame
- gitsigns
- ident-blankline
- todo-comments
- vim-illuminate
- nvim-bqf
- which-key
- spelunker
## Requirements
- fzf
- ripgrep
- npm (required by mason to install certain lsps)
- any nerdfont (I use [caskaydia mono](https://www.nerdfonts.com/font-downloads))

## Theme
using black metal (bathory) from tinted-vim.

Note: the comment colour is quite unreadable, I would recommend changing it. Go to source (e.g. ~/.local/share/nvim/lazy/tinted-vim/colors/base16-black-metal-bathory.vim) and change s:gui03 to your desired colour. I use #9dcccc - a very pale blue
