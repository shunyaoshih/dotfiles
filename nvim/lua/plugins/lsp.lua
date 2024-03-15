-- Define behaviors when LSP attaches to the buffer (`on_attach`) {{{
local on_attach = function(_, bufnr)
	-- Set key mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	vim.keymap.set(
		"n",
		"gd",
		vim.lsp.buf.definition,
		{ desc = "[LSP] Go to definition", noremap = true, silent = true, buffer = bufnr }
	)
	vim.keymap.set(
		"n",
		"K",
		vim.lsp.buf.hover,
		{ desc = "[LSP] More info under cursor", noremap = true, silent = true, buffer = bufnr }
	)
	vim.keymap.set(
		"n",
		"<leader>rn",
		vim.lsp.buf.rename,
		{ desc = "[R]e[n]ame", noremap = true, silent = true, buffer = bufnr }
	)
	vim.keymap.set(
		"n",
		"<leader>lfr",
		vim.lsp.buf.references,
		{ desc = "[LSP] Find references", noremap = true, silent = true, buffer = bufnr }
	)
	vim.keymap.set(
		"n",
		"<leader>ca",
		vim.lsp.buf.code_action,
		{ desc = "[C]ode [a]ction", noremap = true, silent = true, buffer = bufnr }
	)
	vim.keymap.set(
		"n",
		"<leader>do",
		vim.diagnostic.open_float,
		{ desc = "[LSP] Show diagnostics", noremap = true, silent = true, buffer = bufnr }
	)
	vim.keymap.set(
		"n",
		"<leader>dn",
		vim.diagnostic.goto_next,
		{ desc = "[LSP] Next diagnostics", noremap = true, silent = true, buffer = bufnr }
	)
	vim.keymap.set(
		"n",
		"<leader>dp",
		vim.diagnostic.goto_prev,
		{ desc = "[LSP] Prev diagnostics", noremap = true, silent = true, buffer = bufnr }
	)
end
-- }}}

return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			-- Easily install and manage LSP servers, DAP servers, linters, and formatters.
			"williamboman/mason.nvim",
			-- Automatically install LSP servers.
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"simrat39/rust-tools.nvim",
		},
		keys = {
			{ "<leader>lm", "<cmd>Mason<cr>", desc = "Show LSP manager" },
			{ "<leader>li", "<cmd>LspInfo<cr>", desc = "Show LSP info" },
		},
		config = function()
			local border = require("user.border").border
			-- LSP manager {{{
			require("mason").setup({
				ui = {
					border = border,
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
			require("mason-lspconfig").setup({
				ensure_installed = {
					"gopls",
					"lua_ls",
					"rust_analyzer",
				},
			})
			-- }}}
			-- Set border for nvim-lspconfig globally {{{
			-- including vim.lsp.buf.hover, vim.lsp.buf.signature_help, etc.
			-- Reference: https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#borders.
			local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
			function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
				opts = opts or {}
				opts.border = opts.border or border
				return orig_util_open_floating_preview(contents, syntax, opts, ...)
			end

			-- Set border for `:LspInfo`.
			require("lspconfig.ui.windows").default_options.border = border
			-- }}}
			-- LSP server behaviors {{{
			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
			-- Lua (lua_ls) {{{
			require("lspconfig").lua_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							-- Get the language server to recognize the `vim` global.
							globals = {
								"pcall",
								"vim",
							},
						},
					},
				},
			})
			-- }}}
			-- Rust (rust_analyzer) {{{
			require("rust-tools").setup({
				server = {
					on_attach = on_attach,
				},
			})
			-- }}}
			-- Golang (gopls) {{{
			if vim.fn.has("mac") == 1 then
				require("lspconfig").gopls.setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end
			-- }}}
			-- CiderLSP {{{
			if vim.fn.has("mac") == 0 then
				require("lspconfig.configs").ciderlsp = {
					default_config = {
						cmd = {
							"/google/bin/releases/cider/ciderlsp/ciderlsp",
							"--tooltag=nvim-cmp",
							"--noforward_sync_responses",
						},
						filetypes = {
							"bzl",
							"cpp",
							"go",
							"java",
							"kotlin",
							"markdown",
							"objc",
							"proto",
							"python",
							"python",
							"textproto",
						},
						root_dir = require("lspconfig").util.root_pattern("BUILD"),
						settings = {},
					},
				}
				require("lspconfig").ciderlsp.setup({
					capabilities = capabilities,
					on_attach = on_attach,
				})
			end
			-- }}}
			-- }}}
		end,
	},
}
