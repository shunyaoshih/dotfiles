local M = {}

local fn = vim.fn
local opts = {noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap

function M.AddEmptyLineBelow() fn.append(fn.line("."), "") end

function M.AddEmptyLineAbove()
    local scrolloff_save = vim.opt.scrolloff

    -- Avoid jerky scrolling with ^E at the top of the window.
    vim.opt.scrolloff = 0
    fn.append(fn.line(".") - 1, "")
    if fn.winline() ~= fn.winheight(0) then vim.cmd [[silent normal! <C-e>]] end
    vim.opt.scrolloff = scrolloff_save
end

keymap("n", "<C-j>",
       ":lua require(\"user.custom_functions\").AddEmptyLineBelow()<CR>", opts)
keymap("n", "<C-k>",
       ":lua require(\"user.custom_functions\").AddEmptyLineAbove()<CR>", opts)

return M
