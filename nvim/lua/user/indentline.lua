local ok, indent_blankline = pcall(require, "indent_blankline")
if not ok then
	return
end

vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { fg = "#9E9E9E", nocombine = true })
vim.api.nvim_set_hl(0, "IndentBlanklineIndent1", { fg = "#424242", nocombine = true })

indent_blankline.setup({
	char = "▏", -- bold version: "▎"
	space_char_blankline = " ",
	show_current_context = true,
	show_first_indent_level = false,
	-- Disable treesitter for now since it's slow on large files.
	use_treesitter = false,
	char_highlight_list = { "IndentBlanklineIndent1" },
})
