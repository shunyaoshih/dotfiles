local nvim_tree_ok, nvim_tree = pcall(require, "nvim-tree")
if not nvim_tree_ok then
	return
end

vim.api.nvim_set_hl(0, "NvimTreeSymlink", { fg = "#D7005F" })
vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = "#00AFFF" })
vim.api.nvim_set_hl(0, "NvimTreeRootFolder", { fg = "#AF87FF", bold = true })
vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = "#00AFFF" })
vim.api.nvim_set_hl(0, "NvimTreeFileIcon", { fg = "#E0E0E0" })
vim.api.nvim_set_hl(0, "NvimTreeEmptyFolderName", { fg = "#00AFFF" })
vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = "#00AFFF" })
vim.api.nvim_set_hl(0, "NvimTreeExecFile", { fg = "#87D700" })
vim.api.nvim_set_hl(0, "NvimTreeOpenedFile", { fg = "#E0E0E0", bold = true })
vim.api.nvim_set_hl(0, "NvimTreeSpecialFile", { fg = "#E0E0E0" })
vim.api.nvim_set_hl(0, "NvimTreeImageFile", { fg = "#E0E0E0" })
vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg = "#E0E0E0" })

vim.api.nvim_set_hl(0, "LspDiagnosticsError", { fg = "#FF0000", bold = true })
vim.api.nvim_set_hl(0, "LspDiagnosticsWarning", { fg = "#FF0000", bold = true })
vim.api.nvim_set_hl(0, "LspDiagnosticsInformation", { fg = "#FF0000", bold = true })
vim.api.nvim_set_hl(0, "LspDiagnosticsHint", { fg = "#FF0000", bold = true })

vim.api.nvim_set_hl(0, "NvimTreeGitDirty", { fg = "#FFEE68", bold = true })
vim.api.nvim_set_hl(0, "NvimTreeGitStaged", { fg = "#51A500", bold = true })
vim.api.nvim_set_hl(0, "NvimTreeGitMerge", { fg = "#FFEE68", bold = true })
vim.api.nvim_set_hl(0, "NvimTreeGitRenamed", { fg = "#D7005F", bold = true })
vim.api.nvim_set_hl(0, "NvimTreeGitNew", { fg = "#51A500", bold = true })
vim.api.nvim_set_hl(0, "NvimTreeGitDeleted", { fg = "#D7005F", bold = true })

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
