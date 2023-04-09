-- Show plugin manager.
vim.api.nvim_set_keymap("n", "<leader>p", "<cmd>Lazy<cr>",
  { desc = "Show plugin manager", noremap = true, silent = true })

-- Make it easier to save and quit.
vim.api.nvim_set_keymap("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file", noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>x", "<cmd>wq<cr>", { desc = "Save file and quit", noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>q", "<cmd>q!<cr>", { desc = "Quit", noremap = true, silent = true })

-- Execute macro recorded on "q" easily.
vim.api.nvim_set_keymap("n", "Q", "@q", { desc = "Execute macro <q>", noremap = true, silent = true })

-- Make Y behave like other capitals.
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true, silent = true })

-- Automatically clear highlight.
vim.api.nvim_set_keymap("n", "<esc>", "<cmd>noh<cr><esc>",
  { desc = "Escape and clear hlsearch", noremap = true, silent = true })

-- Keep the register the same after pasting.
vim.api.nvim_set_keymap("v", "p", '"_dP', { noremap = true, silent = true })

-- Stay in indent mode
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })

-- Move text up and down easily.
vim.api.nvim_set_keymap("v", "<S-j>", ":m '>+1<cr>gv=gv", { desc = "Move down", noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<S-k>", ":m '<-2<cr>gv=gv", { desc = "Move up", noremap = true, silent = true })

-- Search word under cursor but stay on the current word.
vim.api.nvim_set_keymap("n", "gw", "*N", { desc = "Search word under cursor", noremap = true, silent = true })
