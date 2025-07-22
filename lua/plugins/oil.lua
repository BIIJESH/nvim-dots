return {
  {
    "stevearc/oil.nvim",
    lazy = true,
    keys = {
      { "-", function() require("oil").toggle_float() end, { desc = "Toggle Oil Float" } }
    },
    config = function()
      local oil = require("oil")
      oil.setup({
        default_file_explorer = true,
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        columns = { "icon" },
        keymaps = {
          ["C-h"] = false,
          ["M-h"] = "actions.select_split",
        },
        view_options = {
          show_hidden = true,
        },
        float = {
          padding = 2,
          max_width = 60,
          max_height = 16,
          border = "rounded",
          win_options = {
            winblend = 0,
            wrap = true,
          },
          preview_split = "auto",
        },
      })
    end,
  },
  {
    "ibhagwan/fzf-lua",
    lazy = true,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "FzfLua",
    opts = {},
    config = function(_, opts)
      require("fzf-lua").setup({
        lsp = {
          code_actions = {
            winopts = {
              relative = "cursor",
              row      = 1,
              col      = 0,
              height   = 0.4,
              preview  = { vertical = "down:70%" }
            },
            previewer = vim.fn.executable("delta") == 1 and "codeaction_native" or nil,
            preview_pager = "delta --width=$COLUMNS --hunk-header-style=omit --file-style=omit",
          },
        },
        winopts = {
          height = 0.8,
          width = 0.8,
          preview = {
            layout = "horizontal",
            flip_columns = 0.65,
          },
          border = "rounded",
        },
        fzf_opts = {
          ["--prompt"] = "   ",
          ["--pointer"] = "󱞩 ",
        },
        files = {
          fd_opts = "--type f --hidden --follow --exclude .git --exclude node_modules --exclude venv",
        },
        grep = {
          rg_opts =
          "--hidden --column --line-number --no-heading --color=always --smart-case -g '!vendor/**' -g '!node_modules/**' -g '!venv/**'"
        },
        file_ignore_patterns = { "%.svg", "%.class", "%.png", "%.jpg", "node_modules/", "vendor/" },
      })
    end,
    keys = {
      { "<leader>ff", "<cmd>FzfLua files<CR>",    desc = "Files" },
      { "<leader>fr", "<cmd>FzfLua oldfiles<CR>", desc = "Recent files" },
      {
        "<leader>ca",
        function() require("fzf-lua").lsp_code_actions({ silent = true }) end,
        desc = "Code Actions",
      },
      { "<leader>fg", "<cmd>FzfLua live_grep<CR>",            desc = "Text" },
      { "<leader>fb", "<cmd>FzfLua buffers<CR>",              desc = "Buffers" },
      { "<leader>fh", "<cmd>FzfLua help_tags<CR>",            desc = "Help tags" },
      { "<leader>fc", "<cmd>FzfLua commands<CR>",             desc = "Commands" },
      { "<leader>fC", "<cmd>FzfLua colorschemes<CR>",         desc = "Colorscheme" },
      { "<leader>gr", "<cmd>FzfLua lsp_references<CR>",       desc = "Go to references" },
      { "<leader>rr", "<cmd>FzfLua registers<CR>",            desc = "Find registers list" },
      { "<leader>fd", "<cmd>FzfLua diagnostics_document<CR>", desc = "Find diagnostics in document " },
    },
  },
}
