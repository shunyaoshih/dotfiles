local ok, hop = pcall(require, "hop")
if not ok then
	return
end

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>hw", ":HopChar2<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>hl", ":HopLine<CR>", opts)

vim.api.nvim_set_keymap("v", "<leader>hw", "<CMD>HopChar2<CR>", opts)
vim.api.nvim_set_keymap("v", "<leader>hl", "<CMD>HopLine<CR>", opts)

vim.api.nvim_set_keymap("x", "<leader>hw", "<CMD>HopChar2<CR>", opts)
vim.api.nvim_set_keymap("x", "<leader>hl", "<CMD>HopLine<CR>", opts)

hop.setup({})
