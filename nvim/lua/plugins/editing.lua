return {
  {
    "djoshea/vim-autoread",
    event = "VeryLazy",
  },
  {
    "tpope/vim-repeat",
    event = "VeryLazy",
  },
  { "tpope/vim-surround" },
  {
    "wakatime/vim-wakatime",
    event = "VeryLazy",
  },
  {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    event = "VeryLazy",
    config = function()
      require('treesj').setup({})
    end,
  }
}
