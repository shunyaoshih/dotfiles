local M = {}

function M.AddEmptyLineBelow()
  vim.fn.append(vim.fn.line("."), "")
end

return M
