local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

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
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
    disable = { "yaml" }
  },
  playground = {
    enable = true
  }
}
