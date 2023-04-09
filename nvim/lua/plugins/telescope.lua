return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.1',
  lazy = false,
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
  },
}
