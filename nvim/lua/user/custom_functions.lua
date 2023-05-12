local M = {}

function M.AddEmptyLineBelow()
	vim.fn.append(vim.fn.line("."), "")
end

function M.AddEmptyLineAbove()
	vim.fn.append(vim.fn.line(".") - 1, "")
end

function M.DeleteEmptyLineBelow()
	if vim.fn.line(".") == vim.fn.line("$") then
		return
	end
	local line = vim.fn.getline(vim.fn.line(".") + 1)
	if string.match(line, "^%s*$") ~= nil then
		local colsave = vim.fn.col(".")
		vim.cmd([[
      :+1d
      ''
    ]])
		vim.fn.cursor(vim.fn.line("."), colsave)
	end
end

function M.DeleteEmptyLineAbove()
	if vim.fn.line(".") == 1 then
		return
	end
	local line = vim.fn.getline(vim.fn.line(".") - 1)
	if string.match(line, "^%s*$") ~= nil then
		local colsave = vim.fn.col(".")
		vim.cmd([[
      :-1d
      ''
    ]])
		vim.fn.cursor(vim.fn.line("."), colsave)
	end
end

function M.SetWrapKeyMapping()
	if vim.wo.wrap then
		local opts = { noremap = true, silent = true, buffer = 0 }
		vim.keymap.set("n", "j", "gj", opts)
		vim.keymap.set("n", "k", "gk", opts)
		vim.keymap.set("n", "^", "g^", opts)
		vim.keymap.set("n", "$", "g$", opts)
		vim.keymap.set("o", "j", "gj", opts)
		vim.keymap.set("o", "k", "gk", opts)
	else
		-- Only check if there is a key mapping for "j" since
		-- it should be enough.
		if vim.fn.maparg("j", "n") ~= "" then
			local opts = { buffer = 0 }
			vim.keymap.del("n", "j", opts)
			vim.keymap.del("n", "k", opts)
			vim.keymap.del("n", "^", opts)
			vim.keymap.del("n", "$", opts)
			vim.keymap.del("o", "j", opts)
			vim.keymap.del("o", "k", opts)
		end
	end
end

function M.ToggleWrap()
	if vim.wo.wrap then
		print("Wrap OFF")
		vim.wo.wrap = false
	else
		print("Wrap ON")
		vim.wo.wrap = true
	end
	M.SetWrapKeyMapping()
end

vim.keymap.set(
	"n",
	"<A-j>",
	'<cmd>lua require("user.custom_functions").AddEmptyLineBelow()<cr>',
	{ desc = "Add one line below", noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"<A-k>",
	'<cmd>lua require("user.custom_functions").AddEmptyLineAbove()<cr>',
	{ desc = "Add one line above", noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"<A-J>",
	'<cmd>lua require("user.custom_functions").DeleteEmptyLineBelow()<cr>',
	{ desc = "Delete one line below", noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"<A-K>",
	'<cmd>lua require("user.custom_functions").DeleteEmptyLineAbove()<cr>',
	{ desc = "Delete one line above", noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"<leader>tw",
	'<cmd>lua require("user.custom_functions").ToggleWrap()<cr>',
	{ desc = "Toggle wrap", noremap = true, silent = true }
)

return M
