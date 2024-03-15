return {
	"folke/which-key.nvim",
	event = "VimEnter",
	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		require("which-key").setup({})

		-- Document existing key chains.
		require("which-key").register({
			["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
			["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
			["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
		})
	end,
}
