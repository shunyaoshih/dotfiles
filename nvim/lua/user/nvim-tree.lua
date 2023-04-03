local nvim_tree_ok, nvim_tree = pcall(require, "nvim-tree")
if not nvim_tree_ok then
	return
end

nvim_tree.setup({
	disable_netrw = true,
	update_cwd = true,
	diagnostics = {
		enable = true,
		icons = { hint = "", info = "", warning = "", error = "" },
	},
	update_focused_file = { enable = true, update_cwd = true, ignore_list = {} },
	renderer = {
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					deleted = "",
					untracked = "",
					ignored = "◌",
				},
				folder = {
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
				},
			},
			show = { file = true, folder = true, folder_arrow = true, git = true },
		},
	},
})

vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<cr>", { noremap = true, silent = true })
