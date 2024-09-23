-- oneliner simple plugins
return {
    {
        'navarasu/onedark.nvim',
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require('onedark').setup {
                style = 'darker'
            }
            vim.cmd('colorscheme onedark')
        end,
    },
    {
        "pocco81/auto-save.nvim"
    },
    {
        "m4xshen/autoclose.nvim",
        config = function()
            require("autoclose").setup()
        end
    },
    {
        "numToStr/Comment.nvim",
        opts = {
        },
        lazy = false,
    },
    {
        "f-person/git-blame.nvim"
    },
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signcolumn = true,
        }
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main="ibl",
        config = function()
            require("ibl").setup()
        end
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {}
    },
    {
        "RRethy/vim-illuminate"
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
    }
}
