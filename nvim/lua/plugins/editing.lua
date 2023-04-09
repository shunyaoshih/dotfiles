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
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    lazy = false,
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>fb", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", desc = "File browser" },
    },
    config = function()
      require("telescope").load_extension("file_browser")
    end,
  },
}
