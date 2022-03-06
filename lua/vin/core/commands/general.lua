local notify_status_ok, notify = pcall(require, "notify")
if not notify_status_ok then
	return
end

local General = {}

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

return General
