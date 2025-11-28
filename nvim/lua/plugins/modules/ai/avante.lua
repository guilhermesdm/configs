return {
	"yetone/avante.nvim",
	enabled = false,
	lazy = true,
	event = "VeryLazy",
	priority = 900,
	version = false,
	opts = {
		mode = "legacy",
		provider = "claude",
		selector = {
			provider = "snacks",
		},
		windows = {
			position = "smart",
			width = 35,
			wrap = true,
			sidebar_header = {
				rounded = false,
			},
			input = {
				prefix = " ",
				height = 8,
			},
			ask = {
				floating = false,
				border = "none",
				start_insert = false,
			},
		},
		file_selector = {
			provider = "snacks",
		},
		hints = { enabled = true },
		auto_suggestion_provider = "copilot",
		behaviour = {
			auto_suggestions = true, -- Experimental stage
			auto_set_highlight_group = true,
			auto_set_keymaps = true,
			auto_apply_diff_after_generation = false,
			support_paste_from_clipboard = true,
			enable_token_counting = true,
			enable_cursor_planning_mode = true,
			enable_claude_text_editor_tool_mode = true,
			minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
		},
		providers = {
			claude = {
				endpoint = "https://api.anthropic.com",
				model = "claude-sonnet-4-20250514",
				timeout = 30000, -- Timeout in milliseconds
				extra_request_body = {
					temperature = 0.75,
					max_tokens = 20480,
				},
			},
			copilot = {
				model = "claude-3.7-sonnet-thought",
				timeout = 10 * 60 * 1000,
				extra_request_body = {
					temperature = 0,
					max_tokens = 80000,
				},
				max_completion_tokens = 80000,
				reasoning_effort = "high",
			},
		},
	},
	build = "make",
	dependencies = {
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{
			"<leader>at",
			function()
				require("avante").toggle()
			end,
			desc = "avante: toggle",
		},
		{
			"<leader>aA",
			function()
				vim.cmd("Copilot! attach")
				vim.notify("Copilot attached", vim.log.levels.INFO, { title = "avante" })
			end,
			desc = "avante: attach Copilot",
		},
		{
			"<leader>aD",
			function()
				vim.cmd("Copilot! detach")
				vim.notify("Copilot detached", vim.log.levels.INFO, { title = "avante" })
			end,
			desc = "avante: detach Copilot",
		},
	},
}
