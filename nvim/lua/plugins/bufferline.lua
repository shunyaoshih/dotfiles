return {
  "akinsho/bufferline.nvim",
  lazy = false,
  version = "v3.*",
  dependencies = "nvim-tree/nvim-web-devicons",
  keys = {
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer"},
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer"},
  },
  config = true,
}
