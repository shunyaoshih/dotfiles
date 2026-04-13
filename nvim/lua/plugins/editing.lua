return {
	{
		"djoshea/vim-autoread",
		event = "VeryLazy",
	},
	{
		"tpope/vim-repeat",
		event = "VeryLazy",
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			vim.g.nvim_surround_no_mappings = true
		end,
	},
	{
		"wakatime/vim-wakatime",
		event = "VeryLazy",
	},
	{
		"Wansmer/treesj",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		event = "VeryLazy",
		keys = {
			{ "<leader>tb", "<cmd>TSJToggle<cr>", desc = "[T]oggle split/join code [b]lock" },
		},
		config = function()
			require("treesj").setup({
				use_default_keymaps = false,
			})
		end,
	},
	{
		"stevearc/oil.nvim",
		opts = {},
		keys = {
			{ "<leader>ls", "<cmd>Oil --float .<cr>", desc = "[L]i[s]t" },
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
}
