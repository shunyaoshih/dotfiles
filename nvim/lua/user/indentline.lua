local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  return
end

vim.cmd [[highlight IndentBlanklineContextChar guifg=#9E9E9E gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#424242 gui=nocombine]]

indent_blankline.setup({
  char = "▏", -- bold version: "▎"
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = false,
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  use_treesitter = true,
  char_highlight_list = { "IndentBlanklineIndent1" },
  filetype_exclude = {
    "help",
    "startify",
    "dashboard",
    "packer",
    "neogitstatus",
    "NvimTree",
    "Trouble",
  },
  buftype_exclude = {
    "terminal",
    "nofile",
  },
  context_patterns = {
    "class",
    "return",
    "function",
    "method",
    "^if",
    "^while",
    "jsx_element",
    "^for",
    "^object",
    "^table",
    "block",
    "arguments",
    "if_statement",
    "else_clause",
    "jsx_element",
    "jsx_self_closing_element",
    "try_statement",
    "catch_clause",
    "import_statement",
    "operation_type",
  },
})
