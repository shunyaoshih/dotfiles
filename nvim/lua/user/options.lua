-- Please use ":help options" for more details.
-- Set leader key.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Make indenting smarter.
vim.opt.cindent = true

-- Make Neovim always use the system clipboard.
vim.opt.clipboard = "unnamedplus"

-- Show the colored column on the 80-th character.
vim.opt.colorcolumn = "80"

-- Auto-Completion behavior.
vim.opt.completeopt = { "menuone", "noselect" }

-- Show the screen line of the cursor. Useful to easily spot the cursor.
vim.opt.cursorline = true

-- Folding behavior
vim.opt.foldmethod = "marker"

-- Disable the cursor style configured by Neovim.
-- Use the one configured by the terminal emulator.
vim.opt.guicursor = ""

-- Search behavior.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Show tabs and trailing spaces.
vim.opt.list = true
vim.opt.listchars = "tab:»·,trail:·"

-- Enable mouse in all modes.
vim.opt.mouse = "a"

-- Paste toggle.
vim.opt.pastetoggle = "<F2>"

-- Maximum height of the pop-up menu.
vim.opt.pumheight = 5

-- Round indent to multiple of 'shiftwidth'.
-- Use CTRL-T and CTRL-D in Insert mode.
-- Use > and < in Normal mode.
vim.opt.shiftround = true

-- Do not display mode in the bottom line.
vim.opt.showmode = false

-- Always show tabs.
vim.opt.showtabline = 2

-- Force all horizontal splits to go below current window.
vim.opt.splitbelow = true

-- Force all horizontal splits to go to the right of current window.
vim.opt.splitright = true

-- No swap file.
vim.opt.swapfile = false

-- Enable 24-bit RGB colors.
vim.opt.termguicolors = true

-- Time to wait for a mapped sequence to complete (in milliseconds).
vim.opt.timeoutlen = 500

-- Enable persistent undo.
vim.opt.undofile = true
vim.opt.undodir = "~/.config/nvim/.undodir"

-- Faster completion.
vim.opt.updatetime = 300

-- Allow virtual editing in Visual block mode.
vim.opt.virtualedit = "block"

-- Do not wrap text by default.
vim.opt.wrap = false

-- No backup.
vim.opt.writebackup = false

-- Tab behavior.
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- How to show line number.
vim.opt.number = true
vim.opt.relativenumber = true

-- Always show the sign column.
vim.opt.signcolumn = "yes"

-- Space left for scrolling vertically and horizontally.
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
