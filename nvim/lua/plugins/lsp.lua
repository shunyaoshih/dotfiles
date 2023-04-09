return {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
    "williamboman/mason.nvim",
    -- Automatically install LSP servers.
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/cmp-nvim-lsp',
    "simrat39/rust-tools.nvim",
  },
  keys = {
    { "<leader>l", "<cmd>Mason<cr>", desc = "Show LSP manager" },
  },
  config = function()
    -- LSP manager {{{
    require('mason').setup({
      ui = {
        border = require("user.border").border,
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })
    require('mason-lspconfig').setup({
      ensure_installed = {
        "lua_ls",
        "rust_analyzer",
      },
    })
    -- }}}
    -- Set border for nvim-lspconfig globally {{{
    -- including vim.lsp.buf.hover, vim.lsp.buf.signature_help, etc.
    -- Reference: https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#borders.
    local border = require("user.border").border
    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or border
      return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end

    -- Set border for `:LspInfo`.
    local lspconfig_ui_windows_ok, lspconfig_ui_windows = pcall(require, "lspconfig.ui.windows")
    if lspconfig_ui_windows_ok then
      lspconfig_ui_windows.default_options.border = border
    end
    -- }}}
    -- Define behaviors when LSP attaches to the buffer (`on_attach`) {{{
    local on_attach = function(client, bufnr)
      -- Automatically format file on save if supported.
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
          end,
        })
      end

      -- Set key mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      vim.keymap.set("n", "gd", vim.lsp.buf.definition,
        { desc = "Go to definition", noremap = true, silent = true, buffer = bufnr })
      vim.keymap.set("n", "K", vim.lsp.buf.hover,
        { desc = "More info under cursor", noremap = true, silent = true, buffer = bufnr })
      vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next,
        { desc = "Next diagnostics", noremap = true, silent = true, buffer = bufnr })
      vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev,
        { desc = "Prev diagnostics", noremap = true, silent = true, buffer = bufnr })
    end
    -- }}}
    -- LSP server behaviors {{{
    local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
    -- Lua (lua_ls) {{{
    require("lspconfig").lua_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global.
            globals = {
              "pcall",
              "vim",
            },
          },
        },
      },
    })
    -- }}}
    -- Rust (rust_analyzer) {{{
    require("rust-tools").setup({
      server = {
        on_attach = on_attach,
      },
    })
    -- }}}
    -- CiderLSP {{{
    if vim.fn.has('mac') == 0 then
      require("lspconfig.configs").ciderlsp = {
        default_config = {
          cmd = {
            "/google/bin/releases/cider/ciderlsp/ciderlsp",
            "--tooltag=nvim-cmp",
            "--noforward_sync_responses",
          },
          filetypes = {
            "bzl",
            "cpp",
            "go",
            "java",
            "kotlin",
            "objc",
            "proto",
            "python",
            "python",
            "textproto",
          },
          root_dir = require("lspconfig").util.root_pattern("BUILD"),
          settings = {},
        }
      }
      require("lspconfig").ciderlsp.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
    end
    -- }}}
    -- }}}
  end
}
