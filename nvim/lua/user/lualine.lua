local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local colors = {
  light_red    = "#FF548C",
  orange       = "#FFAF5F",
  yellow       = "#FFEE68",
  green        = "#87D700",
  dark_blue    = "#0080CB",
  purple       = "#AF87FF",

  white        = "#E0E0E0",
  gray_1       = "#BDBDBD",
  gray_2       = "#9E9E9E",
  gray_3       = "#757575",
  gray_4       = "#616161",
  gray_5       = "#424242",
  gray_6       = "#212121",
  black        = "#000000"
}

local theme = {
  normal = {
    a = {bg = colors.dark_blue, fg = colors.black},
    b = {bg = colors.gray_5, fg = colors.gray_2},
    c = {bg = colors.gray_6, fg = colors.gray_3}
  },
  insert = {
    a = {bg = colors.green, fg = colors.black},
    b = {bg = colors.gray_5, fg = colors.gray_2},
    c = {bg = colors.gray_6, fg = colors.gray_3}
  },
  visual = {
    a = {bg = colors.orange, fg = colors.black},
    b = {bg = colors.gray_5, fg = colors.gray_2},
    c = {bg = colors.gray_6, fg = colors.gray_3}
  },
  replace = {
    a = {bg = colors.light_red, fg = colors.black},
    b = {bg = colors.gray_5, fg = colors.gray_2},
    c = {bg = colors.gray_6, fg = colors.gray_3}
  },
  command = {
    a = {bg = colors.dark_blue, fg = colors.black},
    b = {bg = colors.gray_5, fg = colors.gray_2},
    c = {bg = colors.gray_6, fg = colors.gray_3}
  },
  inactive = {
    a = {bg = colors.gray_6, fg = colors.gray_3},
    b = {bg = colors.gray_6, fg = colors.gray_3},
    c = {bg = colors.gray_6, fg = colors.gray_3}
  }
}

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = " ", warn = " " },
  colored = false,
  update_in_insert = false,
  always_visible = true,
}

local diff = {
  "diff",
  colored = false,
  symbols = { added = " ", modified = " ", removed = " " },
  cond = hide_in_width
}

local mode = {
  "mode",
  fmt = function(str)
    return str
  end,
}

local filetype = {
  "filetype",
  icons_enabled = false,
  icon = nil,
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
}

local location = {
  "location",
  padding = 0,
}

local progress = function()
  local current_line = vim.fn.line(".")
  local total_lines = vim.fn.line("$")
  local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end

local spaces = function()
  return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
  options = {
    icons_enabled = true,
    theme = theme,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { mode },
    lualine_b = { branch, diagnostics },
    lualine_c = {},
    lualine_x = { diff, spaces, "encoding" },
    lualine_y = { filetype, progress },
    lualine_z = { location },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
})
