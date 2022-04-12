local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- Plugin manager.
  use "wbthomason/packer.nvim"

  -- General speedup.
  use 'lewis6991/impatient.nvim'

  -- Popup window.
  use {
    "nvim-lua/popup.nvim",
    requires = "nvim-lua/plenary.nvim"
  }

  -- Color theme.
  use "shunyaoshih/pikacode.nvim"
  use "norcalli/nvim-colorizer.lua"
  use {
    "akinsho/bufferline.nvim",
    tag = "*",
    requires = {
      "kyazdani42/nvim-web-devicons",
      "moll/vim-bbye"
    }
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    }
  }

  -- Syntax parser.
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use {
    "nvim-treesitter/playground",
    requires = { "nvim-treesitter/nvim-treesitter" }
  }

  if fn.has("mac") then
    -- Auto-completion.
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"

    -- Snippets.
    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"
    use "rafamadriz/friendly-snippets"
  end

  -- Easy motion.
  use {
    'phaazon/hop.nvim',
    branch = 'v1'
  }

  -- Basic editing.
  use "djoshea/vim-autoread"
  use "lukas-reineke/indent-blankline.nvim"
  use 'numToStr/Comment.nvim'

  -- legacy basic editing.
  use "tpope/vim-surround"
  use "tpope/vim-repeat"
  use "Raimondi/delimitMate"

  -- Activity tracking.
  use "wakatime/vim-wakatime"

  -- Go.
  use {
    "fatih/vim-go",
    run = ":GoUpdateBinaries",
    ft = "go"
  }

  -- Rust.
  use {
    "rust-lang/rust.vim",
    ft = "rust"
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
