return {
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"folke/snacks.nvim", -- optional
		},
		config = function()
			local neogit = require("neogit")

			neogit.setup({
				kind = "vsplit",
				signs = {
					section = { "", "" },
					item = { "", "" },
					hunk = { "", "" },
				},
				integrations = {
					snacks = true,
					diffview = true,
				},
			})
		end,
	},
}
