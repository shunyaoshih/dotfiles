local ok, indent_blankline = pcall(require, "indent_blankline")
if not ok then
  return
end

indent_blankline.setup({
  char = "▏", -- bold version: "▎"
  space_char_blankline = " ",
  show_current_context = true,
  show_first_indent_level = false,
  -- Disable treesitter for now since it's slow on large files.
  use_treesitter = false,
})
