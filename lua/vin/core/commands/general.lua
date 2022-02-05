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
		icon = " ",
	})
end

return General
