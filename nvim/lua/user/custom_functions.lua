local M = {}

local fn = vim.fn
local opts = {noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap
local buf_keymap = vim.api.nvim_buf_set_keymap

function M.AddEmptyLineBelow() fn.append(fn.line("."), "") end

function M.AddEmptyLineAbove() fn.append(fn.line(".") - 1, "") end

function M.DeleteEmptyLineBelow()
    if fn.line(".") == fn.line("$") then return end
    local line = fn.getline(fn.line(".") + 1)
    if string.match(line, "^%s*$") ~= nil then
        local colsave = fn.col(".")
        vim.cmd [[
          :+1d
          ''
        ]]
        fn.cursor(fn.line("."), colsave)
    end
end

function M.DeleteEmptyLineAbove()
    if fn.line(".") == 1 then return end
    local line = fn.getline(fn.line(".") - 1)
    if string.match(line, "^%s*$") ~= nil then
        local colsave = fn.col(".")
        vim.cmd [[
          :-1d
          ''
        ]]
        fn.cursor(fn.line("."), colsave)
    end
end

function M.SetWrapKeyMapping()
    if vim.wo.wrap then
        buf_keymap(0, "n", "j", "gj", opts)
        buf_keymap(0, "n", "k", "gk", opts)
        buf_keymap(0, "n", "0", "g^", opts)
        buf_keymap(0, "n", "$", "g$", opts)
        buf_keymap(0, "o", "j", "gj", opts)
        buf_keymap(0, "o", "k", "gk", opts)
    else
        -- Only check if there is a key mapping for "j" since
        -- it should be enough.
        if fn.maparg("j", "n") ~= "" then
            vim.api.nvim_buf_del_keymap(0, "n", "j")
            vim.api.nvim_buf_del_keymap(0, "n", "k")
            vim.api.nvim_buf_del_keymap(0, "n", "0")
            vim.api.nvim_buf_del_keymap(0, "n", "$")
            vim.api.nvim_buf_del_keymap(0, "o", "j")
            vim.api.nvim_buf_del_keymap(0, "o", "k")
        end
    end
end

function M.ToggleWrap()
    if vim.wo.wrap then
        print("Wrap OFF")
        vim.wo.wrap = false
    else
        print("Wrap ON")
        vim.wo.wrap = true
    end
    M.SetWrapKeyMapping()
end

vim.cmd [[
  augroup wrap_line
    autocmd!
    autocmd BufRead,BufNewFile * execute "lua require(\"user.custom_functions\").SetWrapKeyMapping()"
  augroup end
]]

keymap("n", "<C-j>",
       ":lua require(\"user.custom_functions\").AddEmptyLineBelow()<CR>", opts)
keymap("n", "<C-k>",
       ":lua require(\"user.custom_functions\").AddEmptyLineAbove()<CR>", opts)
keymap("n", "<A-j>",
       ":lua require(\"user.custom_functions\").DeleteEmptyLineBelow()<CR>",
       opts)
keymap("n", "<A-k>",
       ":lua require(\"user.custom_functions\").DeleteEmptyLineAbove()<CR>",
       opts)
keymap("n", "<F3>", ":lua require(\"user.custom_functions\").ToggleWrap()<CR>",
       opts)

return M
