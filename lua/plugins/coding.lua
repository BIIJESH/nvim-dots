return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "python",
        "typescript",
        "lua",
        "html",
        "css",
        "javascript",
      },
      sync_install = false,
      auto_install = false,
      incremental_selection = {
        enable = false,            -- Disable incremental selection
      },
      indent = { enable = false }, -- Disable Tree-sitter indentation for performance
      highlight = {
        enable = true,
        -- disable = { "javascript", "typescript" },
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
        additional_vim_regex_highlighting = false,
      },
    }
  },
  {
    'numToStr/Comment.nvim',
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require('Comment').setup()
    end
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false
        },
      })
    end
  },
}
