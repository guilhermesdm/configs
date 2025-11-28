return {
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPre",
		main = "ibl",
		config = function()
			vim.opt.list = true

			require("ibl").setup({
				exclude = {
					filetypes = { "help", "dashboard", "packer", "NvimTree", "Trouble", "TelescopePrompt", "Float" },
					buftypes = { "terminal", "nofile", "telescope" },
				},
				indent = {
					char = "│",
					tab_char = "│",
				},
				scope = {
					enabled = true,
				},
			})
		end,
	},
}
