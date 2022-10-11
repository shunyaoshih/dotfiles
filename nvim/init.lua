require("user.options")
require("user.custom_functions")
require("user.keymaps")
require("user.plugins")
require("user.alpha")
require("user.autopairs")
require("user.bufferline")
require("user.cmp")
require("user.colorizer")
require("user.colorscheme")
require("user.comment")
require("user.go")
require("user.hop")
require("user.impatient")
require("user.indentline")
require("user.lualine")
require("user.nvim-tree")
require("user.telescope")
require("user.treesitter")

if vim.fn.has("mac") == 1 then
    require("user.lsp")
    require("user.vim-lua-format")
end

vim.cmd [[runtime custom/local.vim]]
