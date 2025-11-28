Snacks = Snacks

return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			bigfile = { enabled = true },
			dashboard = { enabled = false },
			indent = { enabled = false },
			input = { enabled = true },
			notifier = { enabled = true },
			explorer = { enabled = true },
			picker = {
				enabled = true,
				explorer = {
					opts = {
						win = {
							list = {
								keys = {
									["<c-]>"] = "explorer_cd",
								},
							},
						},
					},
				},
				previewers = {
					git = {
						native = true,
					},
				},
				win = {
					input = {
						keys = {
							["<c-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
							["<c-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
							["<c-b>"] = { "list_scroll_up", mode = { "i", "n" } },
							["<c-f>"] = { "list_scroll_down", mode = { "i", "n" } },
						},
					},
				},
			},
			quickfile = { enabled = false },
			scroll = { enabled = false },
			statuscolumn = {
				enabled = true,
			},
			words = { enabled = false },
		},
		keys = {
			-- ╭─────────────────────────────────────────────────────────╮
			-- │ Zen                                                     │
			-- ╰─────────────────────────────────────────────────────────╯
			{
				"<leader>z",
				function()
					Snacks.zen({ win = { width = 200 } })
				end,
				desc = "Zen Mode",
			},
			{
				"<leader>Z",
				function()
					Snacks.zen.zoom()
				end,
				desc = "Zoom Mode",
			},
			-- ╭─────────────────────────────────────────────────────────╮
			-- │ Picker                                                  │
			-- ╰─────────────────────────────────────────────────────────╯
			{
				"<leader>e",
				function()
					Snacks.picker.explorer()
				end,
				desc = "explorer",
			},
			{
				"<C-p>",
				function()
					Snacks.picker.smart()
				end,
				desc = "smart files",
			},
			{
				"<leader>pw",
				function()
					Snacks.picker.grep_word()
				end,
				desc = "grep word",
				mode = { "n", "v" },
			},

			{
				"<leader>pl",
				function()
					Snacks.picker.projects()
				end,
				desc = "projects list",
			},

			{
				"<leader>cd",
				function()
					Snacks.picker.diagnostics()
				end,
				desc = "diagnostics",
			},

			{
				"<leader>ff",
				function()
					Snacks.picker.files()
				end,
				desc = "files",
			},
			{
				"<leader>fh",
				function()
					Snacks.picker.recent()
				end,
				desc = "recent files",
			},
			{
				"<leader>fH",
				function()
					Snacks.picker.command_history()
				end,
				desc = "command history",
			},
			{
				"<leader>fs",
				function()
					Snacks.picker.search_history()
				end,
				desc = "search history",
			},
			{
				"<leader>fq",
				function()
					Snacks.picker.qflist()
				end,
				desc = "quickfix list",
			},
			{
				"<leader>fc",
				function()
					Snacks.picker.colorschemes()
				end,
				desc = "color schemes",
			},
			{
				"<leader>fd",
				function()
					Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
				end,
				desc = "dotfiles",
			},
			{
				"<leader>fg",
				function()
					Snacks.picker.grep()
				end,
				desc = "grep",
			},

			{
				"<leader>gf",
				function()
					Snacks.picker.git_files()
				end,
				desc = "git files",
			},
			{
				"<leader>gs",
				function()
					Snacks.picker.git_status()
				end,
				desc = "git status",
			},
			{
				"<leader>glA",
				function()
					Snacks.picker.git_log()
				end,
				desc = "log",
			},
			{
				"<leader>glC",
				function()
					Snacks.picker.git_log_file()
				end,
				desc = "file commits",
			},
			-- LSP
			{
				"gd",
				function()
					Snacks.picker.lsp_definitions()
				end,
				desc = "Goto Definition",
			},
			{
				"gD",
				function()
					Snacks.picker.lsp_declarations()
				end,
				desc = "Goto Declaration",
			},
			{
				"gr",
				function()
					Snacks.picker.lsp_references()
				end,
				nowait = true,
				desc = "References",
			},
			{
				"gI",
				function()
					Snacks.picker.lsp_implementations()
				end,
				desc = "Goto Implementation",
			},
			{
				"gy",
				function()
					Snacks.picker.lsp_type_definitions()
				end,
				desc = "Goto T[y]pe Definition",
			},
			{
				"<leader>ss",
				function()
					Snacks.picker.lsp_symbols()
				end,
				desc = "LSP Symbols",
			},
			{
				"<leader>sS",
				function()
					Snacks.picker.lsp_workspace_symbols()
				end,
				desc = "LSP Workspace Symbols",
			},
		},
	},
}
