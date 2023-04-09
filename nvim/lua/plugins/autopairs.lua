return {
  "windwp/nvim-autopairs",
  event = "VeryLazy",
  config = function()
    require("nvim-autopairs").setup({
      check_ts = true,
    })
  end,
}
