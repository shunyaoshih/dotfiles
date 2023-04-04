local bufferline_ok, bufferline = pcall(require, "bufferline")
if not bufferline_ok then
  return
end

bufferline.setup({
  options = {
    numbers = "buffer_id",
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,
    indicator = { style = "icon", icon = "▎" },
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 30,
    max_prefix_length = 30,
    tab_size = 21,
    diagnostics = false,
    diagnostics_update_in_insert = false,
    offsets = { { filetype = "NvimTree", text = "" } },
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = false,
    show_tab_indicators = false,
    persist_buffer_sort = true,
    separator_style = "thin",
    enforce_regular_tabs = false,
    always_show_bufferline = true,
  },
})
