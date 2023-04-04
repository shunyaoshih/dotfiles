local ok, comment = pcall(require, "Comment")
if not ok then
  return
end

comment.setup({
  toggler = {
    -- Line-comment toggle keymap.
    line = "<leader>//",
    -- Block-comment toggle keymap.
    block = "<leader>b/",
  },
  opleader = {
    -- Line-comment keymap.
    line = "<leader>/",
    -- Block-comment keymap.
    block = "<leader>b",
  },
  extra = {
    -- Add comment on the line above.
    above = "<leader>/O",
    -- Add comment on the line below.
    below = "<leader>/o",
    -- Add comment at the end of line.
    eol = "<leader>/A",
  },
})
