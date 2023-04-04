local ok, lualine = pcall(require, "lualine")
if not ok then
  return
end

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
  cond = hide_in_width,
}

local filetype = { "filetype", icons_enabled = false, icon = nil }

local branch = { "branch", icons_enabled = true, icon = "" }

local progress = function()
  local current_line = vim.fn.line(".")
  local total_lines = vim.fn.line("$")
  local percentage = math.ceil(current_line / total_lines * 100)
  return tostring(percentage) .. "%%"
end

local spaces = function()
  return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "tokyonight",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { branch, diagnostics },
    lualine_c = {},
    lualine_x = { diff, spaces, "encoding" },
    lualine_y = { filetype, progress },
    lualine_z = { "location" },
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
