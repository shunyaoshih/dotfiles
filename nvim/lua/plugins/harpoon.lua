return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	event = "VimEnter",
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		local harpoon = require("harpoon")

		---@diagnostic disable-next-line: missing-parameter, missing-fields
		harpoon.setup({})

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():append()
		end, { desc = "[A]dd file to Harpoon", noremap = true, silent = true })

		vim.keymap.set("n", "<leader>th", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "[T]oggle [H]arpoon", noremap = true, silent = true })

		vim.keymap.set("n", "<F1>", function()
			harpoon:list():select(1)
		end, { desc = "Swithc to Harpoon file 1", noremap = true, silent = true })
		vim.keymap.set("n", "<F2>", function()
			harpoon:list():select(2)
		end, { desc = "Swithc to Harpoon file 2", noremap = true, silent = true })
		vim.keymap.set("n", "<F3>", function()
			harpoon:list():select(3)
		end, { desc = "Swithc to Harpoon file 3", noremap = true, silent = true })
		vim.keymap.set("n", "<F4>", function()
			harpoon:list():select(4)
		end, { desc = "Swithc to Harpoon file 4", noremap = true, silent = true })
		vim.keymap.set("n", "<F5>", function()
			harpoon:list():select(5)
		end, { desc = "Swithc to Harpoon file 5", noremap = true, silent = true })
		vim.keymap.set("n", "<F6>", function()
			harpoon:list():select(6)
		end, { desc = "Swithc to Harpoon file 6", noremap = true, silent = true })
		vim.keymap.set("n", "<F7>", function()
			harpoon:list():select(7)
		end, { desc = "Swithc to Harpoon file 7", noremap = true, silent = true })
		vim.keymap.set("n", "<F8>", function()
			harpoon:list():select(8)
		end, { desc = "Swithc to Harpoon file 8", noremap = true, silent = true })
		vim.keymap.set("n", "<F9>", function()
			harpoon:list():select(9)
		end, { desc = "Swithc to Harpoon file 9", noremap = true, silent = true })
		vim.keymap.set("n", "<F10>", function()
			harpoon:list():select(10)
		end, { desc = "Swithc to Harpoon file 10", noremap = true, silent = true })
	end,
}
