return {
  "folke/tokyonight.nvim",
  -- Make sure the colorscheme is loaded during startup
  -- since this is the main colorscheme.
  lazy = false,
  -- Make sure to load this plugin before all other start plugins.
  priority = 1000,
  config = function()
    -- Set colorscheme to "tokyonight-night".
    vim.cmd([[colorscheme tokyonight-night]])
  end
}
