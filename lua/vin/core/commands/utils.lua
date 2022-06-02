local notify_status_ok, notify = pcall(require, "notify")
if not notify_status_ok then
	return
end

local M = {}

M.pick_window = function()
	local success, picker = pcall(require, "window-picker")

	if success then
		local picked_window_id = picker.pick_window()

		if picked_window_id then
			vim.api.nvim_set_current_win(picked_window_id)
		else
			notify("   Pick aborted", "warn", {
				timeout = 1000,
				render = "minimal",
			})
			return
		end
	end
end

M.log_word = function()
	local current_word = vim.fn.expand("<cword>")
	local message = '"' .. current_word .. '", ' .. current_word

	if
		vim.bo.filetype == "typescript"
		or vim.bo.filetype == "typescriptreact"
		or vim.bo.filetype == "javascript"
		or vim.bo.filetype == "javascriptreact"
	then
		vim.cmd("norm oconsole.log(" .. message .. ");")
	elseif vim.bo.filetype == "go" then
		vim.cmd("norm ofmt.Println(" .. message .. ")")
	end
end

return M
