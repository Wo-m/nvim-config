local map = vim.api.nvim_set_keymap

-- Open WhichKey
map("n", "<leader>", "<cmd>WhichKey<cr>", {})

-- Save and Quit
map("n", "<leader>q", "<cmd>q!<cr>", {})
map("n", "<leader>w", "<cmd>wq<cr>", {})

-- Escape
map("i", "jj", "<Esc>", { noremap = true })
map("i", "<Esc>", "", { noremap = true })
