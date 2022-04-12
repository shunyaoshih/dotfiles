local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>tsh", ":TSHighlightCapturesUnderCursor<CR>", opts)
keymap("n", "<leader>tsp", ":TSPlaygroundToggle<CR>", opts)

configs.setup {
  ensure_installed = "all",
  -- Install parsers asynchronously.
  sync_install = false,
  -- List of parsers to ignore installing.
  ignore_install = { "" },
  highlight = {
    -- Enable the extension.
    enable = true,
    -- Disable certain language.
    disable = { "" },
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
    disable = { "yaml" }
  },
  playground = {
    enable = true
  }
}
