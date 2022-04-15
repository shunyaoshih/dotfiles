local M = {}

local fn = vim.fn

function M.AddEmptyLineBelow() fn.append(fn.line("."), "") end

local opts = {noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap

keymap("n", "<C-j>",
       ":lua require(\"user.custom_functions\").AddEmptyLineBelow()<CR>", opts)

return M
