if vim.fn.has("mac") == 0 then
	vim.api.nvim_exec(
		[[
      source /usr/share/vim/google/google.vim
      source /usr/share/vim/google/glug/bootstrap.vim
      Glug google-filetypes
      Glug codefmt plugin[mappings] gofmt_executable="goimports"
      augroup autoformat_settings
        autocmd FileType go AutoFormatBuffer gofmt
        autocmd FileType bzl AutoFormatBuffer buildifier
        autocmd FileType proto AutoFormatBuffer protofmt
        autocmd FileType python,piccolo AutoFormatBuffer pyformat
        autocmd FileType cpp,proto AutoFormatBuffer clang-format
        autocmd FileType markdown AutoFormatBuffer mdformat
      augroup END
      Glug blazedeps auto_filetypes=`['go']`
    ]],
		false
	)
	return {}
end

return {
	{
		"ckipp01/stylua-nvim",
		config = function()
			-- Format on save.
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = vim.api.nvim_create_augroup("format_lua_file", { clear = true }),
				pattern = { "*.lua" },
				callback = function()
					require("stylua-nvim").format_file()
				end,
			})
		end,
	},
	{
		"google/vim-codefmt",
		dependencies = {
			"google/vim-maktaba",
			"google/vim-glaive",
		},
		config = function()
			vim.api.nvim_exec(
				[[
          Glaive codefmt plugin[mappings]
          Glaive codefmt gofmt_executable="goimports"
          augroup autoformat_settings
            autocmd FileType go AutoFormatBuffer gofmt
            autocmd FileType rust AutoFormatBuffer rustfmt
          augroup END
        ]],
				false
			)
		end,
	},
}
