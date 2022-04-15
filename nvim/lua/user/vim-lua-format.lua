local status_ok, _ = pcall(require, "vim-lua-format")
if not status_ok then return end

vim.cmd [[autocmd BufWrite *.lua call LuaFormat()]]
