local notify_status_ok, notify = pcall(require, "notify")
if not notify_status_ok then
	return
end

local General = {
	all = {},
	blocks = {},
	line = {},
}

General.save_all = function()
	vim.cmd([[silent wa]])

	notify("Saved all files!", "info", {
		title = "Save",
		timeout = 125,
		icon = "💾",
	})
end

-- get the current filename without extension
General.get_current_filename = function()
	local fileNameWithExt = vim.fn.expand("%:t")
	local dotIndex = string.find(fileNameWithExt, ".", 1, true)
	local fileName = string.sub(fileNameWithExt, 1, dotIndex - 1)
	return fileName
end

General.blocks.select = function()
	vim.cmd([[norm ^v$%]])
end

General.blocks.yank = function()
	General.blocks.select()
	vim.cmd([[norm y]])
end

General.blocks.delete = function()
	General.blocks.select()
	vim.cmd([[norm d]])
end

General.all.select = function()
	vim.cmd([[norm ggVG]])
end

General.all.yank = function()
	General.all.select()
	vim.cmd([[norm y]])
end

General.all.delete = function()
	General.all.select()
	vim.cmd([[norm d]])
end

General.line.select = function()
	vim.cmd([[norm ^v$]])
end

return General
