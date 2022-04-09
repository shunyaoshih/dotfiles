local M = {}

local fn = vim.fn

function M.AddEmptyLineBelow()
  fn.append(fn.line("."), "")
end

return M
