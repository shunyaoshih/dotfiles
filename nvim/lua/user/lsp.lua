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
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
	},
})

local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
	return
end

local on_attach = function(client, bufnr)
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

	vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, bufopts)
	vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, bufopts)
end

local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not ok then
	return
end
local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.lua_ls.setup({
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
