local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then return end

local ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not ok then return end

local tree_cb = nvim_tree_config.nvim_tree_callback

vim.cmd [[highlight NvimTreeSymlink guifg=#D7005F gui=None]]
vim.cmd [[highlight NvimTreeFolderName guifg=#00AFFF gui=None]]
vim.cmd [[highlight NvimTreeRootFolder guifg=#AF87FF gui=bold]]
vim.cmd [[highlight NvimTreeFolderIcon guifg=#00AFFF gui=None]]
vim.cmd [[highlight NvimTreeFileIcon guifg=#E0E0E0 gui=None]]
vim.cmd [[highlight NvimTreeEmptyFolderName guifg=#00AFFF gui=None]]
vim.cmd [[highlight NvimTreeOpenedFolderName guifg=#00AFFF gui=None]]
vim.cmd [[highlight NvimTreeExecFile guifg=#87D700 gui=None]]
vim.cmd [[highlight NvimTreeOpenedFile guifg=#E0E0E0 gui=bold]]
vim.cmd [[highlight NvimTreeSpecialFile guifg=#E0E0E0 gui=None]]
vim.cmd [[highlight NvimTreeImageFile guifg=#E0E0E0 gui=None]]
vim.cmd [[highlight NvimTreeIndentMarker guifg=#E0E0E0 gui=None]]

vim.cmd [[highlight LspDiagnosticsError guifg=#FF0000 gui=bold]]
vim.cmd [[highlight LspDiagnosticsWarning guifg=#FF0000 gui=bold]]
vim.cmd [[highlight LspDiagnosticsInformation guifg=#FF0000 gui=bold]]
vim.cmd [[highlight LspDiagnosticsHint guifg=#FF0000 gui=bold]]

vim.cmd [[highlight NvimTreeGitDirty guifg=#FFEE68 gui=bold]]
vim.cmd [[highlight NvimTreeGitStaged guifg=#51A500 gui=bold]]
vim.cmd [[highlight NvimTreeGitMerge guifg=#FFEE68 gui=bold]]
vim.cmd [[highlight NvimTreeGitRenamed guifg=#D7005F gui=bold]]
vim.cmd [[highlight NvimTreeGitNew guifg=#51A500 gui=bold]]
vim.cmd [[highlight NvimTreeGitDeleted guifg=#D7005F gui=bold]]

vim.g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
        unstaged = "",
        staged = "S",
        unmerged = "",
        renamed = "➜",
        deleted = "",
        untracked = "",
        ignored = "◌"
    },
    folder = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = ""
    }
}

nvim_tree.setup {
    disable_netrw = true,
    update_cwd = true,
    diagnostics = {
        enable = true,
        icons = {hint = "", info = "", warning = "", error = ""}
    },
    update_focused_file = {enable = true, update_cwd = true, ignore_list = {}},
    show_icons = {git = 1, folders = 1, files = 1, folder_arrows = 1}
}

local opts = {noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
