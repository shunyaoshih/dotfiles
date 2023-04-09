-- Note: The order of loading config files matters.
require("user.options")
require("user.autocmds")
require("user.keymaps")
require("user.custom_functions")
require("user.lazy")

vim.cmd([[runtime custom/local.vim]])
