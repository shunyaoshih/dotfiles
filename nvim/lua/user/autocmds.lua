-- Jump to the last position when reopening a file.
-- :h last-position-jump
vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("restore_cursor", { clear = true }),
  callback = function()
    if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.cmd([[normal! g`"]])
    end
  end,
})

-- Highlight on yank.
-- Reference: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua.
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Close some filetypes with <q>.
-- Reference: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua.
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
  pattern = {
    "help",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Set some key mappings based on whether we wrap line or not.
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("wrap_line", { clear = true }),
  callback = function()
    require("user.custom_functions").SetWrapKeyMapping()
  end,
})
