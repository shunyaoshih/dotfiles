local ok, indent_blankline = pcall(require, "indent_blankline")
if not ok then return end

vim.cmd [[highlight IndentBlanklineContextChar guifg=#9E9E9E gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#424242 gui=nocombine]]

indent_blankline.setup {
    char = "▏", -- bold version: "▎"
    space_char_blankline = " ",
    show_current_context = true,
    show_first_indent_level = false,
    use_treesitter = true,
    char_highlight_list = {"IndentBlanklineIndent1"}
}
