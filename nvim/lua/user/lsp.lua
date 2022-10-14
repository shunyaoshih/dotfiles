local border_ok, border = pcall(require, "user.border")
if not border_ok then
  return
end

local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
	return
end

mason.setup({
	ui = {
		border = border.border,
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
	return
end
mason_lspconfig.setup({
	ensure_installed = { "sumneko_lua", "rust_analyzer", "stylua" },
})

local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
	return
end

local on_attach = function(_, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)

	-- vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, bufopts)
	-- vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, bufopts)
	vim.keymap.set("n", "<leader>dj", function()
		vim.diagnostic.goto_next({ float = { border = border.border } })
	end, bufopts)
	vim.keymap.set("n", "<leader>dk", function()
		vim.diagnostic.goto_prev({ float = { border = border.border } })
	end, bufopts)
end

local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not ok then
	return
end
local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Copy from https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua.
lspconfig.sumneko_lua.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim).
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim", "pcall" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing
			-- a randomized but unique identifier.
			telemetry = { enable = false },
		},
	},
})

-- Use "rust-tools" to get type inlay hints.
-- This plugin already sets up lspconfig for rust
-- so we don't do it manually (there could be conflicts).
local rt_ok, rt = pcall(require, "rust-tools")
if not rt_ok then
	return
end

rt.setup({
	server = {
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			["rust-analyzer"] = {
				cargo = { allFeatures = true },
				completion = { postfix = { enable = false } },
			},
		},
	},
})

-- Formatting setup.
-- Formatter can be installed by ":LspInstall".
local null_ls_ok, null_ls = pcall(require, "null-ls")
if not null_ls_ok then
	return
end
null_ls.setup({
	on_attach = function(client, bufnr)
		-- Format on save.
		-- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save#sync-formatting.
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,

	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.rustfmt,
	},
})
