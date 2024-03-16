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

function M.set(table)
	local set = {}
	for _, v in ipairs(table) do
		set[v] = true
	end
	return set
end

-- Check if the file in the current buffer is a test file.
function M.isTestFile()
	local path_without_extension = vim.fn.expand("%:r")
	if path_without_extension:match("_test$") then
		return true
	end
	return false
end

function M.GoToTestFile()
	-- Check if the file type is supported.
	local supported_file_types = M.set({ "cpp", "go" })
	if not supported_file_types[vim.bo.filetype] then
		print("Filetype [" .. vim.bo.filetype .. "] is not supported!")
		return
	end

	-- Check if we are already at the test file.
	if M.isTestFile() then
		print("You are already at test file!")
		return
	end

	-- Edit the test file.
	-- Note that we could be either at the test file or header file at this point.
	local test_file_path = vim.fn.expand("%:r") .. "_test."
	if vim.bo.filetype == "cpp" then
		test_file_path = test_file_path .. "cc"
	elseif vim.bo.filetype == "go" then
		test_file_path = test_file_path .. "go"
	end
	vim.cmd(":edit " .. test_file_path)
end

function M.isSourceFile()
	if M.isTestFile() then
		return false
	end
	if vim.bo.filetype == "go" then
		return true
	end
	if vim.fn.expand("%:e") == "cc" then
		return true
	end
	return false
end

function M.GoToSourceFile()
	-- Check if the file type is supported.
	local supported_file_types = M.set({ "cpp", "go" })
	if not supported_file_types[vim.bo.filetype] then
		print("Filetype [" .. vim.bo.filetype .. "] is not supported!")
		return
	end

	-- Check if we are already at the source file.
	if M.isSourceFile() then
		print("You are already at source file!")
		return
	end

	-- Edit the test file.
	-- Note that we could be either at the test file or header file at this point.
	local source_file_path = ""
	if vim.bo.filetype == "go" then
		source_file_path = vim.fn.expand("%:r"):sub(1, -6) .. ".go"
	elseif vim.bo.filetype == "cpp" then
		if vim.fn.expand("%:r"):match("_test$") then
			source_file_path = vim.fn.expand("%:r"):sub(1, -6) .. ".cc"
		else
			source_file_path = vim.fn.expand("%:r") .. ".cc"
		end
	end
	vim.cmd(":edit " .. source_file_path)
end

function M.GoToHeaderFile()
	-- Check if the file type is supported.
	local supported_file_types = M.set({ "cpp" })
	if not supported_file_types[vim.bo.filetype] then
		print("Filetype [" .. vim.bo.filetype .. "] is not supported!")
		return
	end

	-- Check if we are already at the header file.
	if vim.fn.expand("%:e"):match("^h") then
		print("You are already at header file!")
		return
	end

	local header_file_path = ""
	if vim.fn.expand("%:r"):match("_test$") then
		header_file_path = vim.fn.expand("%:r"):sub(1, -6) .. ".h"
	else
		header_file_path = vim.fn.expand("%:r") .. ".h"
	end
	vim.cmd(":edit " .. header_file_path)
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
	{ desc = "[T]oggle [w]rap", noremap = true, silent = true }
)

vim.keymap.set(
	"n",
	"gt",
	'<cmd>lua require("user.custom_functions").GoToTestFile()<cr>',
	{ desc = "Go to test file", noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"gs",
	'<cmd>lua require("user.custom_functions").GoToSourceFile()<cr>',
	{ desc = "Go to source file", noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"gh",
	'<cmd>lua require("user.custom_functions").GoToHeaderFile()<cr>',
	{ desc = "Go to header file", noremap = true, silent = true }
)

return M
