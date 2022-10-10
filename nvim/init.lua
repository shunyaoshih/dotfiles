require("user.options")
require("user.custom_functions")
require("user.keymaps")
require("user.plugins")
require("user.alpha")
require("user.autopairs")
require("user.bufferline")
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
require("user.vim-lua-format")

if vim.fn.has("mac") then require("user.lsp") end

vim.cmd [[ runtime custom/local.vim ]]
