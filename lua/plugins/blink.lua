return {
  {
    "saghen/blink.cmp",
    version = "v0.*",
    dependencies = { 'rafamadriz/friendly-snippets' },
    event = "InsertEnter",
    opts = {
      appearance = {
        nerd_font_variant = "mono",
      },
      keymap = {
        preset = "enter",
        ["<Enter>"] = { "accept", "fallback" },
        ["<C-n>"] = { "select_next" },
        ["<C-p>"] = { "select_prev" },
      },
      cmdline = {
        enabled = false
      },
      completion = {
        menu = { border = "single" },
        documentation = {
          auto_show_delay_ms = 0,
          window = {
            border = "single",
          },
          auto_show = false,
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
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    --TODO:inlay hints not working
    name = "lspconfig",
    dependencies = {
      -- { "AstroNvim/astrolsp", opts = {} },
      { "saghen/blink.cmp" },
    },
    opts = {
      inlay_hints = { enabled = true },
      servers = {
        html = {},
        clangd = {},
        -- pyright = {},
        pylsp = {},
        lua_ls = {},
        -- vtsls = {
        --   filetypes =
        --   { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
        -- },
        ts_ls = {},
        astro = {},
        gopls = {
          cmd = { "gopls" },
          filetypes = { "go", "gomod", "gowork", "gotmpl" },
        },
        tailwindcss = {},
        emmet_ls = {
          filetypes = {
            "typescript",
            "php",
            "blade",
            "javascriptreact",
            "javascript",
            "html",
            "typescriptreact"
          }
        },
        hyprls = {},
        jsonls = {},
        elixirls = {
          cmd = { "/home/papa/language_server.sh" },
          filetypes = { "elixir", "eelixir", "heex", "surface" }
        }
      }
    },
    cmd = { "LspInfo", "LspInstall", "LspUninstall" },
    event = { "BufReadPost", "BufNewFile" },
    config = function(_, opts)
      local lspconfig = require("lspconfig")
      local server = { "tailwindcss" }
      for server, config in pairs(opts.servers) do
        config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end
      -- vim.tbl_map(require("astrolsp").lsp_setup, require("astrolsp").config.servers)
    end,
  },
}
