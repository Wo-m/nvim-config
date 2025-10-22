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
            keymap.set("n", "<leader>s", "<CMD>LspClangdSwitchSourceHeader<CR>", opts)

        end

        local function switch_source_header(bufnr, client)
          local method_name = 'textDocument/switchSourceHeader'
          ---@diagnostic disable-next-line:param-type-mismatch
          if not client or not client:supports_method(method_name) then
            return vim.notify(('method %s is not supported by any servers active on the current buffer'):format(method_name))
          end
          local params = vim.lsp.util.make_text_document_params(bufnr)
          ---@diagnostic disable-next-line:param-type-mismatch
          client:request(method_name, params, function(err, result)
            if err then
              error(tostring(err))
            end
            if not result then
              vim.notify('corresponding file cannot be determined')
              return
            end
            vim.cmd.edit(vim.uri_to_fname(result))
          end, bufnr)
        end

        local on_attach_clang = function(client, bufnr)
            vim.api.nvim_buf_create_user_command(bufnr, 'LspClangdSwitchSourceHeader', function()
              switch_source_header(bufnr, client)
            end, { desc = 'Switch between source/header' })
            on_attach(client, bufnr)
        end


        local capabilities = cmp_nvim_lsp.default_capabilities()
        local servers = { "clangd" }


        vim.lsp.config("pyright", {
            capabilities = capabilities,
            on_attach = on_attach,
        })
        vim.lsp.enable("pyright")

        vim.lsp.config("clangd", {
            capabilities = capabilities,
            cmd = {
                "clangd",
                "--offset-encoding=utf-16",
                "--malloc-trim",
                "-j=2",
                "--header-insertion=iwyu",
                --"--clang-tidy",
                --"--completion-style=detailed",
                --"--background-index=false",
                --"--log=verbose",
            },
            filetypes = { "c", "cc", "cpp", "objc", "objcpp", "cuda" },
            on_attach = on_attach_clang,
            flags = { debounce_text_changes = 150 }
        })
        vim.lsp.enable("clangd")


    end,
}
