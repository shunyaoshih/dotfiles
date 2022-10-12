local mason_ok, mason = pcall(require, "mason")
if not mason_ok then return end
mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then return end
mason_lspconfig.setup({
    ensure_installed = {"sumneko_lua", "rust_analyzer"},

    -- Whether servers that are set up (via lspconfig) should be automatically
    -- installed if they're not already installed.
    -- This setting has no relation with the `ensure_installed` setting.
    automatic_installation = true
})

local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then return end

local on_attach = function(_, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = {noremap = true, silent = true, buffer = bufnr}
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "<leader>f",
                   function() vim.lsp.buf.format {async = true} end, bufopts)

    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, bufopts)
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, bufopts)
end

local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not ok then return end
local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol
                                                          .make_client_capabilities())

-- Copy from https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua.
lspconfig.sumneko_lua.setup {
    settings = {
        Lua = {
            -- Didn't use the LSP formatter since I don't like its style.
            -- Use "andrejlevkovitch/vim-lua-format" instead.
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim).
                version = "LuaJIT"
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {"vim"}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true)
            },
            -- Do not send telemetry data containing
            -- a randomized but unique identifier.
            telemetry = {enable = false}
        }
    }
}

-- Use "rust-tools" to get type inlay hints.
-- This plugin already sets up lspconfig for rust
-- so we don't do it manually (there could be conflicts).
local rt_ok, rt = pcall(require, "rust-tools")
if not rt_ok then return end

rt.setup({
    server = {
        on_attach = on_attach,
        settings = {
            ["rust-analyzer"] = {
                cargo = {allFeatures = true},
                completion = {postfix = {enable = false}}
            }
        },
        capabilities = capabilities
    }
})
