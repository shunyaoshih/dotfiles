local ok, autopairs = pcall(require, "nvim-autopairs")
if not ok then
	return
end

autopairs.setup({
	check_ts = true,
	-- Don't add a pair to the following Treesitter component.
	ts_config = { lua = { "string" } },
	disable_filetype = { "TelescopePrompt" },
	enable_check_bracket_line = true,
	fast_wrap = { map = "<A-e>" },
})
