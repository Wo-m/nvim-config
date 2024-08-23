--[[ opts.lua ]]
local opt = vim.opt

-- [[ Context ]]
opt.number = true                -- bool: Show line numbers
opt.relativenumber = false       -- bool: Show relative line numbers
opt.scrolloff = 4                -- int:  Min num lines of context
opt.signcolumn = "yes"           -- str:  Show the sign column

-- [[ Filetypes ]]
opt.encoding = 'utf8'            -- str:  String encoding to use
opt.fileencoding = 'utf8'        -- str:  File encoding to use

-- [[ Theme ]]
opt.termguicolors = true         -- bool: If term supports ui color then enable
opt.cursorline = true

-- [[ Search ]]
opt.ignorecase = true            -- bool: Ignore case in search patterns
opt.smartcase = true             -- bool: Override ignorecase if search contains capitals
opt.incsearch = true             -- bool: Use incremental search
opt.hlsearch = false             -- bool: Highlight search matches

-- [[ Whitespace ]]
opt.expandtab = true             -- bool: Use spaces instead of tabs
opt.shiftwidth = 4               -- num:  Size of an indent
opt.softtabstop = 4              -- num:  Number of spaces tabs count for in insert mode
opt.tabstop = 4                  -- num:  Number of spaces tabs count for

opt.list = true
vim.cmd[[set noshowmode]]

-- [[ Vars ]]
local g = vim.g
g.t_co = 256
g.background = "dark"

vim.cmd.colorscheme('base16-black-metal-bathory')
-- associate tpp files with cpp
vim.filetype.add({
  extension = {
    tpp = "cpp",
  },
})

vim.filetype.add({
  extension = {
    vc = "py",
  },
})
-- use tabs in cpp files
vim.api.nvim_create_augroup('custom_indent', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
    group = 'custom_indent',
    pattern = '*',
    callback = function()
        vim.opt.expandtab = true
    end,
})
vim.api.nvim_create_autocmd('FileType', {
    group = 'custom_indent',
    pattern = 'cpp',
    callback = function()
        vim.opt.expandtab = false
    end,
})
