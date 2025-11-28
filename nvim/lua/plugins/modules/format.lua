return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		local prettier = { "prettierd", "prettier", stop_after_first = true }
		local biome_or_prettier = { "biome", "prettierd", "prettier", stop_after_first = true }

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
				javascript = prettier,
				javascriptreact = prettier,
				typescript = prettier,
				typescriptreact = prettier,
				json = biome_or_prettier,
				jsonc = biome_or_prettier,
				html = biome_or_prettier,
				markdown = prettier,
				c = { "qmkfmt", "clang-format", stop_after_first = true },
				cpp = { "clang-format" },
				rust = { "rustfmt" },
				sh = { "shfmt" },
				fish = { "fish_indent" },
				toml = { "taplo" },
				yaml = { "yamlfmt" },
				xml = { "xmlformatter" },
				go = {
					"gofumpt",
					"goimports-reviser",
					"golines",
				},
			},
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 2500,
			},
			formatters = {
				qmkfmt = {
					command = "qmkfmt",
					args = { "$FILENAME" },
					stdin = false,
					condition = function(_, ctx)
						if ctx.filename:find("[qmk_firmware|qmk_userspace]") == nil then
							return false
						end

						if ctx.filename:find("[keymap.c]") == nil then
							return false
						end

						return true
					end,
				},
			},
		})

		vim.keymap.set({ "n" }, "<leader>fb", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "format file" })

		vim.keymap.set({ "v" }, "<leader>fb", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "format selection" })

		vim.api.nvim_create_user_command("Format", function(args)
			local range = nil
			if args.count ~= -1 then
				local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
				range = {
					start = { args.line1, 0 },
					["end"] = { args.line2, end_line:len() },
				}
			end

			conform.format({ async = true, lsp_fallback = true, range = range })
		end, { range = true })
	end,
}
