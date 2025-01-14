return {
  {
    "saghen/blink.cmp",
    version = "v0.*",
    dependencies = 'rafamadriz/friendly-snippets',
    event = "InsertEnter",
    opts = {
      appearance = {
        nerd_font_variant = "mono",
      },
      keymap = {
        preset = "enter",
        ["<Enter>"] = { "accept", "fallback" },
        ["<Tab>"] = { "select_next" },
        ["<S-Tab>"] = { "select_prev" },
      },
      completion = {
        menu = { border = "single" },
        documentation = {
          auto_show_delay_ms = 0,
          window = {
            border = "single",
          },
          auto_show = true,
        },
        trigger = {
          show_in_snippet = true,
          show_on_trigger_character = true,
        },
      },
      signature = {
        enabled = true,
        window = {
          border = "single",
        },
      },
      sources = {
        providers = {
          lsp = {
            async = true
          },
        },
        default = { "lsp", "path", "snippets", "buffer" }, --BUG:with lsp as source ts_ls is so slow
        cmdline = { enabled = false },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    name = "lspconfig",
    dependencies = {
      { "AstroNvim/astrolsp", opts = {} },
      { "saghen/blink.cmp" },
    },
    opts = {
      servers = {
        html = {},
        lua_ls = {},
        astro = {},
        ts_ls = {
          filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "literal",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },
        tailwindcss = {
          filetypes = {
            "astro", "javascriptreact", "javascript", "ejs", "typescriptreact", "typescript"
          },
          settings = {
            tailwindCSS = {
              classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
              includeLanguages = {
                eelixir = "html-eex",
                eruby = "erb",
                htmlangular = "html",
                templ = "html"
              },
              lint = {
                cssConflict = "warning",
                invalidApply = "error",
                invalidConfigPath = "error",
                invalidScreen = "error",
                invalidTailwindDirective = "error",
                invalidVariant = "error",
                recommendedVariantOrder = "warning"
              },
              validate = true,
            },
          },
        },
        emmet_ls = {
          filetypes = {
            "typescript",
            "html",
            "typescriptreact"
          }
        },
      }
    },
    cmd = { "LspInfo", "LspInstall", "LspUninstall" },
    event = { "BufReadPost", "BufNewFile" },
    config = function(_, opts)
      local lspconfig = require("lspconfig")
      for server, config in pairs(opts.servers) do
        config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end
      vim.tbl_map(require("astrolsp").lsp_setup, require("astrolsp").config.servers)
    end,
  },
}
