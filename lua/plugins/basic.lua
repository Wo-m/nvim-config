-- oneliner simple plugins
return {
    {
        "tinted-theming/tinted-vim"
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
        "kevinhwang91/nvim-bqf"
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
