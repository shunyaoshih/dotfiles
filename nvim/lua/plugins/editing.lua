return {
  { "djoshea/vim-autoread" },
  { "tpope/vim-repeat" },
  { "tpope/vim-surround" },
  { "wakatime/vim-wakatime" },
  {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesj').setup({})
    end,
  }
}
