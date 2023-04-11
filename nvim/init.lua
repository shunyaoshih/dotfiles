-- Note: The order of loading config files matters.
require("user.options")
require("user.autocmds")
require("user.keymaps")
require("user.custom_functions")
require("user.lazy")

vim.api.nvim_create_autocmd("VimEnter", { command = "runtime custom/local.vim" })
