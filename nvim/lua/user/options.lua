-- Please use ":help options" for more details.
-- Make indenting smarter.
vim.opt.cindent = true

-- Make Neovim always use the system clipboard.
vim.opt.clipboard = "unnamedplus"

-- Auto-Completion behavior.
vim.opt.completeopt = { "menuone", "noselect" }

-- Show the screen line of the cursor. Useful to easily spot the cursor.
vim.opt.cursorline = true

-- Search behavior.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Enable mouse in all modes.
vim.opt.mouse = "a"

-- Maximum height of the pop-up menu.
vim.opt.pumheight = 5

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

-- Faster completion.
vim.opt.updatetime = 300

-- No backup.
vim.opt.writebackup = false

-- Tab behavior.
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.shiftwidth = 2                          -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2                             -- insert 2 spaces for a tab

-- How to show line number.
vim.opt.number = true                           -- set numbered lines
vim.opt.relativenumber = true                   -- set relative numbered lines

-- Always show the sign column.
vim.opt.signcolumn = "yes"

-- Space left for scrolling vertically and horizontally.
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
