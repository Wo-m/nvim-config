return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        -- import lspconfig plugin
        local lspconfig = require("lspconfig")

        -- import cmp-nvim-lsp plugin
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local keymap = vim.keymap

        local opts = { noremap = true, silent = true }
        local on_attach = function(client, bufnr)
            opts.buffer = bufnr

            -- set keybinds
            opts.desc = "Show LSP references"
            keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

            opts.desc = "Go to declaration"
            keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

            opts.desc = "Show LSP definitions"
            keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

            opts.desc = "Show LSP implementations"
            keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

            opts.desc = "See available code actions"
            keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

            opts.desc = "Smart rename"
            keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

            opts.desc = "Show documentation for what is under cursor"
            keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

            opts.desc = "Restart LSP"
            keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

            opts.desc = "Format Buffer"
            keymap.set("n", "<leader>fb", vim.lsp.buf.format, opts)

            opts.desc = "Format Buffer"
            keymap.set("v", "<leader>fb", vim.lsp.buf.format, opts)

            opts.desc = "Swap Header/Source"
            keymap.set("n", "<leader>s", "<CMD>ClangdSwitchSourceHeader<CR>", opts)

        end

        local capabilities = cmp_nvim_lsp.default_capabilities()


        lspconfig["pyright"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig["clangd"].setup {
            capabilities = capabilities,
            cmd = {
                "clangd",
                "--clang-tidy",
                "--completion-style=detailed",
                "--offset-encoding=utf-16",
            },
            on_attach = on_attach,
            flags = { debounce_text_changes = 150 }
          }


    end,
}
