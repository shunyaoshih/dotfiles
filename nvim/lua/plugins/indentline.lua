return {
  "lukas-reineke/indent-blankline.nvim",
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = function()
    require("indent_blankline").setup({
      char = "│",
      show_current_context = true,
      show_first_indent_level = false,
    })
  end,
}
