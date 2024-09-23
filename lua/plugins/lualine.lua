return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()

        local lualine = require("lualine")
        local lazy_status = require("lazy.status")

        -- Line Style
        lualine.setup({
            options = {
                component_separators = '|',
                section_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = {
                    { 'mode', separator = { left = '' }, right_padding = 3 },
                },
                lualine_b = { 'branch', 'diff' },
                lualine_c = {},
                lualine_x = {},
                lualine_y = { 'filename', 'filetype' },
                lualine_z = {
                    { 'location', separator = { right = '' }, left_padding = 3 },
                },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {'filename'},
                lualine_z = {},
            },
            tabline = {},
            extensions = {},
        })
    end
  }
