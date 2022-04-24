local fn = vim.fn

-- Automatically install packer.
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git", "clone", "--depth", "1",
        "https://github.com/wbthomason/packer.nvim", install_path
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use.
local ok, packer = pcall(require, "packer")
if not ok then return end

-- Autocommand that reloads neovim whenever you save the plugins.lua file.
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Have packer use a popup window.
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float {border = "rounded"}
        end
    }
}

return packer.startup(function(use)
    -- Plugin manager.
    use "wbthomason/packer.nvim"

    -- General speedup.
    use 'lewis6991/impatient.nvim'

    -- Popup window.
    use {"nvim-lua/popup.nvim", requires = "nvim-lua/plenary.nvim"}

    -- Color theme.
    use "shunyaoshih/pikacode.nvim"
    use "norcalli/nvim-colorizer.lua"
    use {
        "akinsho/bufferline.nvim",
        tag = "*",
        requires = {"kyazdani42/nvim-web-devicons"}
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- Syntax parser.
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use {
        "nvim-treesitter/playground",
        requires = {"nvim-treesitter/nvim-treesitter"}
    }

    -- Easy motion.
    use {'phaazon/hop.nvim', branch = 'v1'}

    -- Basic editing.
    use "djoshea/vim-autoread"
    use "tpope/vim-surround"
    use "tpope/vim-repeat"
    use "lukas-reineke/indent-blankline.nvim"
    use {
        "numToStr/Comment.nvim",
        commit = "0aaea32f27315e2a99ba4c12ab9def5cbb4842e4"
    }
    use "windwp/nvim-autopairs"
    use {
        "kyazdani42/nvim-tree.lua",
        requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }
    use {'goolord/alpha-nvim'}

    -- Auto-completion.
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"

    -- Fuzzy finder.
    use {
        'nvim-telescope/telescope.nvim',
        commit = "d88094fbfd84b297178252230f6faf0e7d2f7650",
        requires = {
            {'nvim-lua/plenary.nvim'},
            {"kyazdani42/nvim-web-devicons", opt = true}
        }
    }

    -- Activity tracking.
    use "wakatime/vim-wakatime"

    -- Golang.
    use {"fatih/vim-go", ft = "go"}

    if fn.has("mac") then
        -- Lua.
        use "andrejlevkovitch/vim-lua-format"
    end

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then require("packer").sync() end
end)
