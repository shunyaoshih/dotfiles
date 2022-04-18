local ok, bufferline = pcall(require, "bufferline")
if not ok then return end

bufferline.setup {
    options = {
        numbers = "buffer_id",
        close_command = "Bdelete! %d",

        right_mouse_command = "Bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,

        indicator_icon = "▎",
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

        offsets = {{filetype = "NvimTree", text = ""}},
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = false,
        show_tab_indicators = false,
        persist_buffer_sort = true,
        separator_style = "thin",
        enforce_regular_tabs = true,
        always_show_bufferline = true
    },
    highlights = {
        indicator_selected = {
            guifg = {attribute = "fg", highlight = "Normal"},
            guibg = {attribute = "bg", highlight = "Normal"}
        },
        modified = {
            guifg = {attribute = "fg", highlight = "TabLine"},
            guibg = {attribute = "bg", highlight = "Normal"}
        },
        modified_visible = {
            guifg = {attribute = "fg", highlight = "TabLine"},
            guibg = {attribute = "bg", highlight = "Normal"}
        },
        modified_selected = {
            guifg = {attribute = "fg", highlight = "Normal"},
            guibg = {attribute = "bg", highlight = "Normal"}
        }
    }
}
