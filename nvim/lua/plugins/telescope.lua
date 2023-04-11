return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		event = "VeryLazy",
		dependencies = "nvim-lua/plenary.nvim",
		keys = {
			{ "<leader>of", "<cmd>Telescope find_files<cr>", desc = "Find files" },
			{ "<leader>og", "<cmd>Telescope live_grep<cr>", desc = "Find in files (Grep)" },
			{ "<leader>ob", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
		},
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		lazy = false,
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>oe", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", desc = "File explorer" },
		},
		config = function()
			require("telescope").load_extension("file_browser")
		end,
	},
}
