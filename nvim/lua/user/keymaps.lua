-- Show plugin manager.
vim.keymap.set("n", "<leader>p", "<cmd>Lazy<cr>",
  { desc = "Show plugin manager", noremap = true, silent = true })

-- Make it easier to save and quit.
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file", noremap = true, silent = true })
vim.keymap.set("n", "<leader>x", "<cmd>wq<cr>", { desc = "Save file and quit", noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", "<cmd>q!<cr>", { desc = "Quit", noremap = true, silent = true })

-- Execute macro recorded on "q" easily.
vim.keymap.set("n", "Q", "@q", { desc = "Execute macro <q>", noremap = true, silent = true })

-- Make Y behave like other capitals.
vim.keymap.set("n", "Y", "y$", { noremap = true, silent = true })

-- Automatically clear highlight.
vim.keymap.set("n", "<esc>", "<cmd>noh<cr><esc>",
  { desc = "Escape and clear hlsearch", noremap = true, silent = true })

-- Keep the register the same after pasting.
vim.keymap.set("v", "p", '"_dP', { noremap = true, silent = true })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })

-- Move text up and down easily.
vim.keymap.set("v", "<S-j>", ":m '>+1<cr>gv=gv", { desc = "Move down", noremap = true, silent = true })
vim.keymap.set("v", "<S-k>", ":m '<-2<cr>gv=gv", { desc = "Move up", noremap = true, silent = true })

-- Search word under cursor but stay on the current word.
vim.keymap.set("n", "gw", "*N", { desc = "Search word under cursor", noremap = true, silent = true })
