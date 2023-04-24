-- Define behaviors when LSP attaches to the buffer (`on_attach`) {{{
-- Reference: https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts#neovim-08.
local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			if vim.bo.filetype == "go" then
				return client.name == "null-ls"
			end
			return client.name == "null-ls" or client.name == "ciderlsp"
		end,
		bufnr = bufnr,
	})
end

local on_attach = function(client, bufnr)
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
	end

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
		"<leader>lrn",
		vim.lsp.buf.rename,
		{ desc = "[LSP] Rename", noremap = true, silent = true, buffer = bufnr }
	)
	vim.keymap.set(
		"n",
		"<leader>lfr",
		vim.lsp.buf.references,
		{ desc = "[LSP] Find references", noremap = true, silent = true, buffer = bufnr }
	)
	vim.keymap.set(
		"n",
		"<leader>lca",
		vim.lsp.buf.code_action,
		{ desc = "[LSP] Code action", noremap = true, silent = true, buffer = bufnr }
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
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local null_ls = require("null-ls")

			require("null-ls").setup({
				on_attach = on_attach,
				sources = {
					null_ls.builtins.formatting.goimports,
					null_ls.builtins.formatting.rustfmt,
					null_ls.builtins.formatting.stylua,
				},
			})
		end,
	},
}
