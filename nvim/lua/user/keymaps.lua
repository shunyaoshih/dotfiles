local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name.
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key.
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

------------------------------------ Normal ------------------------------------
-- Save and quit files.
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>x", ":x<CR>", opts)
keymap("n", "<leader>q", ":q!<CR>", opts)
keymap("n", "<leader>a", ":qa!<CR>", opts)

-- Resize with arrows.
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers.
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<C-c>", ":bdelete<CR>", opts)

-- Use macro easily.
keymap("n", "Q", "@q", opts)

-- Convenience tricks.
keymap("n", "0", "^", opts)
keymap("n", "^", "0", opts)

-- Make Y behave like other capitals.
keymap("n", "Y", "y$", opts)

-- Clear highlights.
keymap("n", "<leader>nh", ":noh<CR>", opts)

-- Copy file path with/without the file name.
keymap("n", "<leader>pw", ":let @+ = expand('%:p')<CR>", opts)
keymap("n", "<leader>po", ":let @+ = expand('%:p:h')<CR>", opts)

-- Add/Remove empty lines above/below.
keymap("n", "<C-j>", ":lua require(\"user.custom_functions\").AddEmptyLineBelow()<CR>", opts)

------------------------------------ Visual ------------------------------------
-- Keep the register the same after pasting.
keymap("v", "p", '"_dP', opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

--------------------------------- Visual Block ---------------------------------
-- Move text up and down
keymap("x", "<S-j>", ":move '>+<CR>:echo \"move block down\"<CR>gv", opts)
keymap("x", "<S-k>", ":move '<-2<CR>:echo \"move block up\"<CR>gv", opts)
