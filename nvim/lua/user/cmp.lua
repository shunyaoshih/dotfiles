local lspkind_ok, lspkind = pcall(require, "lspkind")
if not lspkind_ok then return end
-- lspkind.init()

local cmp_ok, cmp = pcall(require, "cmp")
if not cmp_ok then return end

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine.
        expand = function(args) vim.fn["vsnip#anonymous"](args.body) end
    },
    window = {
        documentation = {
            border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"}
        }
    },
    mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
        ['<Tab>'] = cmp.mapping.confirm({select = true})
    },
    sources = cmp.config.sources({
        {name = "nvim_lsp"}, {name = "path"}, {name = "vsnip"},
        {name = "buffer"}
    }),
    experimental = {ghost_text = true, native_menu = false},
    formatting = {
        format = lspkind.cmp_format({
            maxwidth = 50,
            ellipsis_char = "...",
            menu = {
                nvim_lsp = "[LSP]",
                buffer = "[Buffer]",
                path = "[Path]",
                vim_vsnip = "[Snippet]"
            }
        })
    }
})

-- Use buffer source for `/` and `?`.
cmp.setup.cmdline({'/', '?'}, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {{name = 'buffer'}}
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}})
})
