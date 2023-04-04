local alpha_ok, alpha = pcall(require, "alpha")
if not alpha_ok then
  return
end

local dashboard_ok, dashboard = pcall(require, "alpha.themes.dashboard")
if not dashboard_ok then
  return
end

dashboard.section.buttons.val = {
  dashboard.button("f", "  Find file", "<CMD>Telescope find_files <CR>"),
  dashboard.button("e", "  New file", "<CMD>ene <BAR> startinsert <CR>"),
  dashboard.button("c", "  Configuration", "<CMD>e ~/.config/nvim/init.lua<CR>"),
  dashboard.button("q", "  Quit Neovim", "<CMD>qa<CR>"),
}

alpha.setup(dashboard.config)
