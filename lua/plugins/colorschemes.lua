return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "moon"
		}
	},
	{
		"andreasvc/vim-256noir",
		lazy = true
	},
	{
		"davidosomething/vim-colors-meh",
		lazy = true
	},
	{
		"kvrohit/rasmus.nvim",
		lazy = true
	},
	{
		"Mofiqul/adwaita.nvim",
		lazy = false,
		priority = 1000,
		
		-- configure and set on startup
		config = function()
			vim.g.adwaita_disable_cursorline = true -- to disable cursorline
			vim.cmd('colorscheme adwaita')
		end
	}
}
