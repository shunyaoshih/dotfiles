return {
  "nvim-lualine/lualine.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local branch = {
      "branch",
      icons_enabled = true,
      icon = "",
    }

    local diagnostics = {
      "diagnostics",
      sources = { "nvim_lsp", "nvim_diagnostic" },
      sections = { "error", "warn" },
      symbols = { error = " ", warn = " " },
      colored = false,
      always_visible = true,
    }

    local diff = {
      "diff",
      colored = false,
      symbols = { added = " ", modified = " ", removed = " " },
    }

    local filetype = {
      "filetype",
      colored = false,
      icons_enabled = false,
      icon = nil,
    }

    local progress = function()
      local current_line = vim.fn.line(".")
      local total_lines = vim.fn.line("$")
      local percentage = math.ceil(current_line / total_lines * 100)
      return tostring(percentage) .. "%%"
    end

    require("lualine").setup({
      options = {
        theme = "tokyonight",
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { branch, diagnostics },
        lualine_c = {},
        lualine_x = { diff, "encoding" },
        lualine_y = { filetype, progress },
        lualine_z = { "location" },
      },
    })
  end,
}
