return {
  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
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
    cmd = { "TodoTrouble", "TodoFzfLua" },
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
      { "<leader>xt", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<CR>",                                                desc = "Todo/Fix/Fixme (Trouble)" },
      { "<leader>xT", "<cmd>TodoTrouble toggle<CR>",                                                                 desc = "Todo (Trouble)" },
      { "<leader>ft", function() require('fzf-lua').grep({ search = 'TODO|HACK|PERF|NOTE|FIX', no_esc = true }) end, desc = "Search TODO, HACK, PERF, NOTE, FIX (fzf-lua)" }
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
    lazy = true,
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
        "<Space>",
        function()
          local wk = require("which-key")
          wk.show("", { mode = "n" }) -- Ensure it is called with the correct mode
        end,
        mode = "n",                   -- Ensures it only triggers in normal mode
        desc = "Trigger which-key with Space",
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
    config = function()
      vim.cmd("colorscheme tokyonight-night")
    end
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
  {
    'vyfor/cord.nvim',
    build = ':Cord update',
    opts = function()
      return {
        display = {
          theme = 'pastel'
        },
        lazy = {
          icon = require('cord.api.icon').get('idle', 'onyx'),
        }
      }
    end,
    config = function()
      vim.keymap.set('n', '<leader>Ct', function()
        require('cord.api.command').toggle_presence()
      end, { desc = "Toggle Discord Presence" })

      vim.keymap.set('n', '<leader>Ci', function()
        require('cord.api.command').toggle_idle_force()
      end, { desc = "Toggle Discord Idle" })
    end
  }
}
