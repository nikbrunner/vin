local notify_status_ok, notify = pcall(require, "notify")
if not notify_status_ok then
	return
end

local M = {
	all = {},
	blocks = {},
	line = {},
}

M.save_all = function()
	vim.cmd([[silent wa]])

	notify("Saved all files!", "info", {
		timeout = 125,
		render = "minimal",
	})
end

-- get the current filename without extension
M.get_current_filename = function()
	local fileNameWithExt = vim.fn.expand("%:t")
	local dotIndex = string.find(fileNameWithExt, ".", 1, true)
	local fileName = string.sub(fileNameWithExt, 1, dotIndex - 1)
	return fileName
end

M.blocks.select = function()
	vim.cmd([[norm ^v$%]])
end

M.blocks.yank = function()
	M.blocks.select()
	vim.cmd([[norm y]])
end

M.blocks.delete = function()
	M.blocks.select()
	vim.cmd([[norm d]])
end

M.all.select = function()
	vim.cmd([[norm ggVG]])
end

M.all.yank = function()
	M.all.select()
	vim.cmd([[norm y]])
end

M.all.delete = function()
	M.all.select()
	vim.cmd([[norm d]])
end

M.line.select = function()
	vim.cmd([[norm ^v$]])
end

return M
