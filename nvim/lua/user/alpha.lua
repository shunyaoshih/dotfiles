local ok, alpha = pcall(require, "alpha")
if not ok then
	return
end

local ok, dashboard = pcall(require, "alpha.themes.dashboard")
if not ok then
	return
end

dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.vim <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

alpha.setup(dashboard.config)
