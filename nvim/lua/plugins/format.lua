if vim.fn.has("mac") == 1 then
	return {
		{
			"stevearc/conform.nvim",
			opts = {
				notify_on_error = false,
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
				formatters_by_ft = {
					lua = { "stylua" },
					-- Conform can also run multiple formatters sequentially
					-- python = { "isort", "black" },
					--
					-- You can use a sub-list to tell conform to run *until* a formatter
					-- is found.
					-- javascript = { { "prettierd", "prettier" } },
				},
			},
		},
	}
else
	vim.api.nvim_exec2([[
      source /usr/share/vim/google/google.vim
      source /usr/share/vim/google/glug/bootstrap.vim
      Glug google-filetypes
      Glug codefmt plugin[mappings] gofmt_executable="goimports"
      augroup autoformat_settings
        autocmd FileType go AutoFormatBuffer gofmt
        autocmd FileType bzl AutoFormatBuffer buildifier
        autocmd FileType python,piccolo AutoFormatBuffer pyformat
        autocmd FileType cpp,proto AutoFormatBuffer clang-format
        autocmd FileType markdown AutoFormatBuffer mdformat
      augroup END
      Glug blazedeps auto_filetypes=`['go']`
    ]])
	return {}
end
