return {
	{

		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd("colorscheme tokyonight-night")
		end,
	},
	{
		"rafi/neo-hybrid.vim",
		priority = 100,
		lazy = false,

		config = function()
			vim.cmd("colorscheme neohybrid")
		end,
	},
}
