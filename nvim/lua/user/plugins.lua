local fn = vim.fn

-- Automatically install packer.
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use.
local ok, packer = pcall(require, "packer")
if not ok then
	return
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file.
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Have packer use a popup window.
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	-- Plugin manager.
	use("wbthomason/packer.nvim")

	-- General speedup.
	use("lewis6991/impatient.nvim")

	-- Color theme.
	use("shunyaoshih/pikacode.nvim")
	use("norcalli/nvim-colorizer.lua")
	use({
		"akinsho/bufferline.nvim",
		tag = "*",
		requires = { "kyazdani42/nvim-web-devicons" },
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- Syntax parser.
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({
		"nvim-treesitter/playground",
		requires = { "nvim-treesitter/nvim-treesitter" },
	})

	-- Easy motion.
	use({ "phaazon/hop.nvim", branch = "v1" })

	-- Basic editing.
	use("djoshea/vim-autoread")
	use("tpope/vim-surround")
	use("tpope/vim-repeat")
	use("lukas-reineke/indent-blankline.nvim")
	use({ "numToStr/Comment.nvim" })
	use("windwp/nvim-autopairs")
	use({
		"kyazdani42/nvim-tree.lua",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use({ "goolord/alpha-nvim" })

	-- Semantic language support.
	-- External tooling manager such as
	-- LSP servers, DAP servers, linters, and formatters.
	use("williamboman/mason.nvim")
	-- Automatically install LSP servers.
	use("williamboman/mason-lspconfig.nvim")
	-- LSP client config.
	use("hrsh7th/cmp-nvim-lsp")
	use("neovim/nvim-lspconfig")
	use("simrat39/rust-tools.nvim")

	-- Auto-completion.
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")
	use("onsails/lspkind.nvim")

	-- Fuzzy finder.
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "kyazdani42/nvim-web-devicons", opt = true },
		},
	})

	-- Activity tracking.
	use("wakatime/vim-wakatime")

	-- Golang.
	use({ "fatih/vim-go", ft = "go" })

	if fn.has("mac") == 1 then
		-- Formatting.
		use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
	end

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
