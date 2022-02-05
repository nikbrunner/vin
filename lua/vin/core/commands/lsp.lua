local notify_status_ok, notify = pcall(require, "notify")
if not notify_status_ok then
	return
end

Lsp = {}

Lsp.format_file = function()
	vim.lsp.buf.formatting()
	vim.cmd([[silent w]])

	notify("Formated and saved file", "info", {
		title = "Format",
		timeout = 125,
		icon = " ",
	})
end

Lsp.code_action = function()
	-- vim.lsp.buf.code_action()
	vim.cmd([[CodeActionMenu]])

	notify("Pick a Code Action!", "info", {
		title = "Refactor",
		timeout = 125,
		icon = " ",
	})
end

return Lsp
