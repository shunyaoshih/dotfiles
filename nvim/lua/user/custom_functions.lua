local M = {}

local fn = vim.fn
local opts = {noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap

function M.AddEmptyLineBelow() fn.append(fn.line("."), "") end

keymap("n", "<C-j>",
       ":lua require(\"user.custom_functions\").AddEmptyLineBelow()<CR>", opts)

return M
