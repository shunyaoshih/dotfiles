local M = {}

M.border = {
	{ "╭", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "╮", "FloatBorder" },
	{ "│", "FloatBorder" },
	{ "╯", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "╰", "FloatBorder" },
	{ "│", "FloatBorder" },
}

-- Set border for nvim-lspconfig globally
-- including vim.lsp.buf.hover, vim.lsp.buf.signature_help, etc.
-- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#borders.
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or M.border
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Set border for `:LspInfo`.
local lspconfig_ui_windows_ok, lspconfig_ui_windows = pcall(require, "lspconfig.ui.windows")
if lspconfig_ui_windows_ok then
	lspconfig_ui_windows.default_options.border = M.border
end

return M
