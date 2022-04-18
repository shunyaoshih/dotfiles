local ok, _ = pcall(require, "vim-lua-format")
if not ok then return end

vim.cmd [[autocmd BufWrite *.lua call LuaFormat()]]
