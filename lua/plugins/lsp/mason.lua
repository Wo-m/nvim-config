return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        -- import mason
        local mason = require("mason")

        -- import mason-lspconfig
        local mason_lspconfig = require("mason-lspconfig")

        local mason_tool_installer = require("mason-tool-installer")

        local servers = { "clangd" }

        mason.setup({
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        })

        mason_lspconfig.setup({
          -- list of servers for mason to install
          ensure_installed = {
            "lua_ls",
            "pyright",
          },
          -- auto-install configured servers (with lspconfig)
          automatic_installation = true, -- not the same as ensure_installed
        })
    end,
}
