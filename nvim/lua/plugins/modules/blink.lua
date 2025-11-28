return {
  {
    "saghen/blink.cmp",
    version = "*",
    dependencies = {
      {
        "saghen/blink.compat",
        opts = { impersonate_nvim_cmp = true },
      },
      "rafamadriz/friendly-snippets",
      "fang2hou/blink-copilot",
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load({
            paths = { vim.fn.stdpath("config") .. "/snippets" },
          })
        end,
      },
    },

    build = "cargo build --release",

    ---@module 'blink.cmp'
    opts = {

      cmdline = {},

      keymap = {
        preset = "super-tab",
        ["<S-k>"] = { "scroll_documentation_up", "fallback" },
        ["<S-j>"] = { "scroll_documentation_down", "fallback" },
      },

      snippets = {
        preset = "luasnip",
        expand = function(snippet)
          require("luasnip").lsp_expand(snippet)
        end,
        active = function(filter)
          if filter and filter.direction then
            return require("luasnip").jumpable(filter.direction)
          end
          return require("luasnip").in_snippet()
        end,
        jump = function(direction)
          require("luasnip").jump(direction)
        end,
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },

        providers = {},
      },

      completion = {
        trigger = {
          show_on_trigger_character = true,
          show_on_insert_on_trigger_character = true,
          show_on_x_blocked_trigger_characters = { "'", '"', "(", "{" },
        },
        menu = {
          border = "rounded",
          draw = {
            columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
            treesitter = {},
          },
        },

        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500,
          treesitter_highlighting = true,
          window = {
            border = "rounded",
          },
        },

        ghost_text = {
          enabled = true,
        },
      },

      signature = {
        enabled = true,
        window = {
          border = "rounded",
        },
      },
    },
    -- allows extending the enabled_providers array elsewhere in your config
    -- without having to redefine it
    opts_extend = { "sources.default" },

    appearance = {
      kind_icons = {
        Copilot = "",
        Text = "󰉿",
        Method = "󰊕",
        Function = "󰊕",
        Constructor = "󰒓",

        Field = "󰜢",
        Variable = "󰆦",
        Property = "󰖷",

        Class = "󱡠",
        Interface = "󱡠",
        Struct = "󱡠",
        Module = "󰅩",

        Unit = "󰪚",
        Value = "󰦨",
        Enum = "󰦨",
        EnumMember = "󰦨",

        Keyword = "󰻾",
        Constant = "󰏿",

        Snippet = "󱄽",
        Color = "󰏘",
        File = "󰈔",
        Reference = "󰬲",
        Folder = "󰉋",
        Event = "󱐋",
        Operator = "󰪚",
        TypeParameter = "󰬛",
      },
    },
  },

  -- LSP servers and clients communicate what features they support through "capabilities".
  --  By default, Neovim support a subset of the LSP specification.
  --  With blink.cmp, Neovim has *more* capabilities which are communicated to the LSP servers.
  --  Explanation from TJ: https://youtu.be/m8C0Cq9Uv9o?t=1275
  --
  -- This can vary by config, but in general for nvim-lspconfig:
}
