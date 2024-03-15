return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	config = function()
		require("ibl").setup({
			indent = {
				char = "│",
			},
			scope = {
				enabled = true,
			},
		})

		local hooks = require("ibl.hooks")
		hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
	end,
}
