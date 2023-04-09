-- Install this plugin to be able to install parsers for languages
-- other than C, Lua, and Vimscript.
-- Reference: https://neovim.io/doc/user/treesitter.html.
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        "c",
        "cpp",
        "go",
        "lua",
        "python",
        "rust",
        "vim",
      },
      highlight = {
        enable = true,
        disable = function(lang, buf)
          -- Disable treesitter-based highlighting when the file is too big.
          local max_filesize = 100 * 1024
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
          return false
        end,
      },
    })
  end,
}
