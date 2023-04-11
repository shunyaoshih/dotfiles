return {
	"numToStr/Comment.nvim",
	event = "VeryLazy",
	config = function()
		require("Comment").setup({
			mappings = {
				basic = false,
				extra = false,
			},
		})

		-- Toggle comment the line under cursor.
		-- Please see ":help comment.api" for more information.
		local api = require("Comment.api")
		vim.keymap.set("n", "<leader>cc", api.toggle.linewise.current, { desc = "Toggle 1 line comment" })

		-- Toggle comment lines (linewise) with dot-repeat support.
		-- Example: <leader>cl3j will comment 4 lines.
		vim.keymap.set(
			"n",
			"<leader>cl",
			api.call("toggle.linewise", "g@"),
			{ desc = "Toggle lines of comment", expr = true }
		)

		-- Toggle comment selected lines in visual model.
		-- Please see ":help comment.api" for more information.
		local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
		vim.keymap.set("x", "<leader>c", function()
			vim.api.nvim_feedkeys(esc, "nx", false)
			api.toggle.linewise(vim.fn.visualmode())
		end)
	end,
}
