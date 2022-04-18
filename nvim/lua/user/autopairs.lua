local ok, autopairs = pcall(require, "nvim-autopairs")
if not ok then return end

autopairs.setup {
    check_ts = true,
    -- Don't add a pair to the following Treesitter component.
    ts_config = {lua = {"string"}, javascript = {'template_string'}},
    disable_filetype = {"TelescopePrompt"},
    enable_check_bracket_line = true,
    fast_wrap = {map = '<A-e>'}
}

local ok, cmp = pcall(require, "cmp")
if not ok then return end
local cmp_autopairs = require "nvim-autopairs.completion.cmp"
cmp.event:on("confirm_done",
             cmp_autopairs.on_confirm_done {map_char = {tex = ""}})
