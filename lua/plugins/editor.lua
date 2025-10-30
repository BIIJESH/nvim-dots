function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "Normal", { bg = "black" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "black" })
end
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
			{ "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", desc = "Preview hunk" },
			{ "<leader>gtb", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "Toggle current line blame" },
			{ "<leader>gtd", "<cmd>Gitsigns toggle_deleted<CR>", desc = "Toggle deleted" },
			{ "<leader>gb", "<cmd>Gitsigns blame<CR>", desc = "Gitsigns blames" },
		},
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "BufReadPre",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	init = function()
	--      -- vim.cmd.colorscheme("tokyonight-night")
	-- 	end,
	-- },
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({ disable_background = false, terminal_colors = true })
			vim.cmd("colorscheme rose-pine")
			ColorMyPencils()
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPost",
		main = "ibl",
		opts = {
			exclude = {
				filetypes = { "help", "dashboard", "neo-tree", "lazy", "mason", "NvimTree" },
			},
			indent = { char = "│", tab_char = "│" },
			scope = { enabled = false },
		},
		config = function(_, opts)
			vim.schedule(function()
				require("ibl").setup(opts)
			end)
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
}
