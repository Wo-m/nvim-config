return {
    'akinsho/toggleterm.nvim', 
    version = "*",
    config = function()
        local toggleterm = require("toggleterm")
        toggleterm.setup({})

        local keymap = vim.keymap
        local map = vim.api.nvim_set_keymap

        -- Always open terminal in float mode (personal preference)
        keymap.set('n', '<Leader>p', '<Cmd>ToggleTerm size=40 direction=float<CR>', opts) -- open
        map("t", "jj", "<C-\\><C-n> <Cmd>q<Cr>", {}) -- close

        -- Open terminal in insert mode
        vim.cmd([[
            autocmd BufEnter * lua if vim.bo.buftype == 'terminal' then vim.cmd('startinsert!') end
        ]])
    end,
    opts = {
        hidden=true
    }
}
