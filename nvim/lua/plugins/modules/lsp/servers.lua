local servers = {
	lua_ls = {
		manual_install = true,
		settings = {
			Lua = {
				telemetry = {
					enable = false,
				},
			},
		},
	},
	ts_ls = {
		manual_install = true,
		init_options = {
			preferences = {
				importModuleSpecifierPreference = "relative",
			},
		},
		commands = {
			OrganizeImports = {
				function()
					local params = {
						command = "_typescript.organizeImports",
						arguments = { vim.api.nvim_buf_get_name(0) },
						title = "",
					}
					vim.lsp.buf.execute_command(params)
				end,
				description = "Organize Imports",
			},
		},
	},
	unocss = { manual_install = true },
	biome = {},
	clangd = {},
	jsonls = {
		manual_install = true,
		settings = {
			json = {
				schemas = require("schemastore").json.schemas(),
				validate = { enable = true },
			},
		},
	},
	yamlls = {
		manual_install = true,
		settings = {
			yaml = {
				schemaStore = {
					enable = false,
					url = "",
				},
				schemas = require("schemastore").yaml.schemas(),
			},
		},
	},
}

local servers_to_install = vim.tbl_filter(function(key)
	local t = servers[key]
	if type(t) == "table" then
		return not t.manual_install
	else
		return t
	end
end, vim.tbl_keys(servers))

require("mason").setup()

local ensure_installed = {
	"typescript-language-server",
	"lua-language-server",
	"json-lsp",
	"yaml-language-server",

	"prettierd",
	"taplo",
	"stylua",
	"shfmt",
	"xmlformatter",
	"clang-format",
	"yamlfmt",
}
vim.list_extend(ensure_installed, servers_to_install)
require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

vim.lsp.enable(vim.tbl_keys(servers))

vim.lsp.config("*", {
	capabilities = {},
})

for server, config in pairs(servers) do
	if type(config) == "table" then
		vim.lsp.config(server, config)
	end
end
