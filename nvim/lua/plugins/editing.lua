return {
  {
    "djoshea/vim-autoread",
    event = "VeryLazy",
  },
  {
    "tpope/vim-repeat",
    event = "VeryLazy",
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        keymaps = {
          -- Disable conflicintg keymaps by assigning all of them to <_>.
          normal_cur = "_",
          normal_cur_line = "_",
        },
      })
    end,
  },
  {
    "wakatime/vim-wakatime",
    event = "VeryLazy",
  },
  {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    event = "VeryLazy",
    keys = {
      { "<leader>sj", "<cmd>TSJToggle<cr>", desc = "Split/join code block" },
    },
    config = function()
      require('treesj').setup({
        use_default_keymaps = false,
      })
    end,
  }
}
