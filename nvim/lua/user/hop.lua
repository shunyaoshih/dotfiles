local status_ok, hop = pcall(require, "hop")
if not status_ok then
  return
end

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>hw", ":HopChar2<CR>", opts)
keymap("n", "<leader>hl", ":HopLine<CR>", opts)

hop.setup {}
