return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"pyright",
				"eslint",
				"rust_analyzer",
				"clangd",
				"ts_ls",
			},
		},
	},
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"saghen/blink.cmp",
		"b0o/schemastore.nvim",
	},
	config = function()
		require("plugins.modules.lsp.servers")
		require("plugins.modules.lsp.progress")
		require("plugins.modules.lsp.diagnostic")
	end,
}
