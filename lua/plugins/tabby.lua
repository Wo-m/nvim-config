return {
    'nanozuki/tabby.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require('tabby').setup({
            preset = "active_wins_at_tail"
        })

        local keymap = vim.keymap
        keymap.set('n', '<Leader>,', '<Cmd>tabp<CR>', opts)
        keymap.set('n', '<Leader>.', '<Cmd>tabn<CR>', opts)
        keymap.set('n', '<Leader>t', '<Cmd>BufferPick<CR>', opts)
        keymap.set('n', '<Leader>c', '<Cmd>tabclose<CR>', opts)
        keymap.set('n', '<Leader>ca', '<Cmd>tabonly<CR>', opts)
        keymap.set('n', '<Leader>n', '<Cmd>tabnew %<CR>', opts)
    end,
}
