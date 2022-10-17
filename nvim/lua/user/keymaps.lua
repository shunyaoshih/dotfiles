local opts = { noremap = true, silent = true }

-- Remap space as leader key.
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", opts)
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
vim.api.nvim_set_keymap("n", "<leader>w", ":w<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>x", ":wq<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>q", ":q!<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>a", ":qa!<CR>", opts)

-- Resize with arrows.
vim.api.nvim_set_keymap("n", "<A-Up>", ":resize +2<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-Down>", ":resize -2<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers.
vim.api.nvim_set_keymap("n", "<S-l>", ":bnext<CR>", opts)
vim.api.nvim_set_keymap("n", "<S-h>", ":bprevious<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-c>", ":bdelete<CR>", opts)

-- Use macro easily.
vim.api.nvim_set_keymap("n", "Q", "@q", opts)

-- Convenience tricks.
vim.api.nvim_set_keymap("n", "0", "^", opts)
vim.api.nvim_set_keymap("n", "^", "0", opts)

-- Make Y behave like other capitals.
vim.api.nvim_set_keymap("n", "Y", "y$", opts)

-- Clear highlights.
vim.api.nvim_set_keymap("n", "<leader>nh", ":noh<CR>", opts)

-- Copy file path with/without the file name.
vim.api.nvim_set_keymap("n", "<leader>pw", ":let @+ = expand('%:p')<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>po", ":let @+ = expand('%:p:h')<CR>", opts)

------------------------------------ Visual ------------------------------------
-- Keep the register the same after pasting.
vim.api.nvim_set_keymap("v", "p", '"_dP', opts)

-- Stay in indent mode
vim.api.nvim_set_keymap("v", "<", "<gv", opts)
vim.api.nvim_set_keymap("v", ">", ">gv", opts)

--------------------------------- Visual Block ---------------------------------
-- Move text up and down
vim.api.nvim_set_keymap("x", "<S-j>", ':move \'>+<CR>:echo "move block down"<CR>gv', opts)
vim.api.nvim_set_keymap("x", "<S-k>", ':move \'<-2<CR>:echo "move block up"<CR>gv', opts)
