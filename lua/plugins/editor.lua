return {
  {
    "lewis6991/gitsigns.nvim", --TODO: need to check this
    event = "BufReadPre",
    opts = {},
    keys = {
      {
        "]h",
        function()
          require("gitsigns").nav_hunk("next")
        end,
        desc = "Next hunk",
      },
      {
        "[h",
        function()
          require("gitsigns").nav_hunk("prev")
        end,
        desc = "Previous hunk",
      },
      { "<leader>gp",  "<cmd>Gitsigns preview_hunk<CR>",              desc = "Preview hunk" },
      { "<leader>gtb", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "Toggle current line blame" },
      { "<leader>gtd", "<cmd>Gitsigns toggle_deleted<CR>",            desc = "Toggle deleted" },
      { "<leader>bb",  "<cmd>Gitsigns blame<CR>",                     desc = "Gitsigns blames" },
    },
  },
  {
    "folke/todo-comments.nvim",
    lazy = true,
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufEnter" },
    cmd = { "TodoTrouble", "TodoTelescope" },
    opts = {},
    keys = {
      {
        "]t",
        function()
          require("todo-comments").jump_next()
        end,
        desc = "Next todo comment",
      },
      {
        "[t",
        function()
          require("todo-comments").jump_prev()
        end,
        desc = "Previous todo comment",
      },
      { "<leader>xt", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<CR>",   desc = "Todo/Fix/Fixme (Trouble)" },
      { "<leader>xT", "<cmd>TodoTrouble toggle<CR>",                    desc = "Todo (Trouble)" },
      { "<leader>ft", "<cmd>TodoFzfLua<CR>",                            desc = "Todo (fzf-lua)" },
      { "<leader>fT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<CR>", desc = "Todo/Fix/Fixme" },
    },
  },
  {
    "folke/flash.nvim",
    opts = {},
    lazy = true,
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
        {
          "<c-s>",
          mode = { "c" },
          function()
            require("flash").toggle()
          end,
          desc = "Toggle Flash Search",
        },
      },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VimEnter",
    dependencies = {
      "echasnovski/mini.icons",
    },
    opts_extend = { "spec" },
    opts = {
      defaults = {},
      spec = {
        {
          mode = { "n", "v" },
          { "<leader>b",  group = "buffer" },
          { "<leader>c",  group = "code" },
          { "<leader>f",  group = "find" },
          { "<leader>g",  group = "git" },
          { "<leader>gt", group = "toggle" },
          { "<leader>n",  group = "noice" },
          { "<leader>q",  group = "session" },
          { "<leader>t",  group = "toggle" },
          { "<leader>x",  group = "diagnostics/quickfix" },
          { "]",          group = "next" },
          { "[",          group = "previous" },
          { "g",          group = "goto" },
          { "z",          group = "fold" },
        },
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
    end,
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer local keymaps (which-key)",
      },
    },
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "BufReadPre",
    config = function()
      require("nvim-surround").setup({
      })
    end
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "Bekaboo/dropbar.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local dropbar_api = require("dropbar.api")
      vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
      vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
      vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { enabled = false },
    },
    main = "ibl",
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
}
