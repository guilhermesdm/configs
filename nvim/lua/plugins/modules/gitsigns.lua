---@type NvPluginSpec
-- NOTE: Git Signs
return {
	"lewis6991/gitsigns.nvim",
	event = {
		"BufReadPost",
		"BufNewFile",
	},
	opts = {
		current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
		current_line_blame = true,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
			delay = 500,
			ignore_whitespace = false,
			virt_text_priority = 100,
			use_focus = true,
		},
		signs = {
			add = { text = "│" },
			change = { text = "│" },
			delete = { text = "󰍵" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "│" },
		},
		on_attach = function() end,
	},
}
