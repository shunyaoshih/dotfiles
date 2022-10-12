local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
	return
end

configs.setup({
	ensure_installed = "all",
	sync_install = false,
	-- List of parsers to ignore installing.
	ignore_install = { "" },
	highlight = {
		-- Enable the extension.
		enable = true,
		-- Disable certain language.
		disable = { "go" },
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true, disable = { "cpp", "go" } },
	playground = { enable = true },
})

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>tsh", ":TSHighlightCapturesUnderCursor<CR>", opts)
keymap("n", "<leader>tsp", ":TSPlaygroundToggle<CR>", opts)
