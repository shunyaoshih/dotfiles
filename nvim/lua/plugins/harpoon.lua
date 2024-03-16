return {
	"ThePrimeagen/harpoon",
	lazy = false,
	dependencies = "nvim-lua/plenary.nvim",
	keys = {
		{ "<leader>th", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "[T]oggle [H]arpoon" },
		{ "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "[A]dd file to Harpoon" },
		{ "<F1>", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Swithc to Harpoon file 1" },
		{ "<F2>", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "Swithc to Harpoon file 2" },
		{ "<F3>", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "Swithc to Harpoon file 3" },
		{ "<F4>", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "Swithc to Harpoon file 4" },
		{ "<F5>", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", desc = "Swithc to Harpoon file 5" },
		{ "<F6>", "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", desc = "Swithc to Harpoon file 6" },
		{ "<F7>", "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", desc = "Swithc to Harpoon file 7" },
		{ "<F8>", "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", desc = "Swithc to Harpoon file 8" },
		{ "<F9>", "<cmd>lua require('harpoon.ui').nav_file(9)<cr>", desc = "Swithc to Harpoon file 9" },
		{ "<F10>", "<cmd>lua require('harpoon.ui').nav_file(10)<cr>", desc = "Swithc to Harpoon file 10" },
	},
	config = function()
		require("harpoon").setup({
			menu = {
				width = vim.api.nvim_win_get_width(0) - 30,
			},
		})
	end,
}
