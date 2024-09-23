return {
    'akinsho/toggleterm.nvim', 
    version = "*",
    config = function()
        local toggleterm = require("toggleterm")
        toggleterm.setup({})

        local keymap = vim.keymap
        local map = vim.api.nvim_set_keymap
        local Terminal  = require('toggleterm.terminal').Terminal


        --- setup terminals
        local reg_terminal = Terminal:new({direction = 'float'})
        local lazygit = Terminal:new({ cmd = "lazygit", direction = 'float'})

        function _reg_terminal()
          reg_terminal:toggle()
        end
        function _lazygit_toggle()
          lazygit:toggle()
        end

        -- keymaps
        vim.api.nvim_set_keymap("n", "<leader>;", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
        vim.api.nvim_set_keymap('n', '<Leader>p', '<cmd>lua _reg_terminal()<CR>', {noremap = true, silent = true})

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
