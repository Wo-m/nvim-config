return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        "princejoogie/dir-telescope.nvim"
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        telescope.load_extension("fzf")
        telescope.load_extension("dir")
        telescope.setup {
            pickers = {
                find_files = {
                    hidden= true
                }
            }
        }

        -- set keymaps
        local keymap = vim.keymap

        keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })

        -- Ensure you have ripgrep installed for live_grep to work
        keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
        keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })

        -- Directory Search
        keymap.set("n", "<leader>fd", "<cmd>Telescope dir live_grep<cr>", { desc = "Find string in directory" })

        -- Show files with diffs (fg -> files git)
        keymap.set('n', '<Leader>fg', '<Cmd>Telescope git_status<CR>', opts)
    end,
}
