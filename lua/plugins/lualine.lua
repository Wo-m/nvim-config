return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")
		local colors = {
			blue   = '#80a0ff',
			cyan   = '#79dac8',
			black  = '#080808',
			white  = '#c6c6c6',
			red    = '#ff5189',
			violet = '#d183e8',
			grey   = '#303030',
			orange = '#ff9e64',
			moon_bg = '#222436', -- match with tokyonight moon theme

			meh_orange = '#dd7766',
			meh_dark_grey = '#24252a',
			meh_purple = "#cc99cc"
			}

		-- Themes
		local wom_tokyonight = { -- reconfigured bubble theme
			normal = {
				a = { fg = colors.black, bg = colors.violet },
				b = { fg = colors.white, bg = colors.grey },
				c = { fg = colors.black, bg = colors.moon_bg },
			},
		  
			insert = { a = { fg = colors.black, bg = colors.blue } },
			visual = { a = { fg = colors.black, bg = colors.cyan } },
			replace = { a = { fg = colors.black, bg = colors.red } },
			command = { a = { fg = colors.black, bg = colors.orange } },
		  
			inactive = {
				a = { fg = colors.white, bg = colors.moon_bg },
				b = { fg = colors.white, bg = colors.moon_bg },
				c = { fg = colors.black, bg = colors.moon_bg },
			},
		}

		local wom_meh = {
			normal = {
				a = { fg = colors.black, bg = colors.meh_orange },
				b = { fg = colors.white, bg = colors.grey },
				c = { fg = colors.black, bg = colors.meh_dark_grey },
			},
			
			insert = { a = { fg = colors.black, bg = colors.meh_purple } },
			visual = { a = { fg = colors.black, bg = colors.cyan } },
			replace = { a = { fg = colors.black, bg = colors.red } },
			command = { a = { fg = colors.black, bg = colors.orange } },
		  
			inactive = {
				y = { fg = colors.black, bg = colors.meh_orange },
			},
		}

		-- Line Style
		lualine.setup({
			options = {
				theme = wom_meh,
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
