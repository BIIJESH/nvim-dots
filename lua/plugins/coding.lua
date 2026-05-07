return {
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true,
					enable_rename = true,
					enable_close_on_slash = false,
				},
			})
		end,
	},
  { 
  "nvim-treesitter/nvim-treesitter-context",
  },
{
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers", 
        numbers = "none", 
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",

        indicator = {
          icon = "▎",
          style = "icon", 
        },

        buffer_close_icon = "󰅖",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",

        max_name_length = 18,
        max_prefix_length = 15,
        truncate_names = true,

        tab_size = 18,

        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,

        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "center",
          },
        },

        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = false,

        persist_buffer_sort = true,
        separator_style = "thin", 
        always_show_bufferline = true,

        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },
      },
    })
  end,
}
}
