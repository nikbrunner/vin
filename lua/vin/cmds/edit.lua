local notify_status_ok, notify = pcall(require, "notify")
if not notify_status_ok then
	return
end

Vin.cmds.edit = {}

Vin.cmds.edit.log_word = function()
	local current_word = vim.fn.expand("<cword>")
	local current_filename = Vin.cmds.general.get_current_filename()
	local message = '"' .. current_filename .. ":" .. current_word .. '", ' .. current_word

	if
		vim.bo.filetype == "typescript"
		or vim.bo.filetype == "typescriptreact"
		or vim.bo.filetype == "javascript"
		or vim.bo.filetype == "javascriptreact"
	then
		vim.cmd("norm oconsole.log(" .. message .. ");")
	elseif vim.bo.filetype == "go" then
		vim.cmd("norm ofmt.Println(" .. message .. ")")
	elseif vim.bo.filetype == "lua" then
		vim.cmd("norm oprint(" .. message .. ")")
	end
end

Vin.cmds.edit.smart_delete = function()
	if vim.api.nvim_get_current_line():match("^%s*$") then
		return '"_dd'
	else
		return "dd"
	end
end

-- TODO: move this to /keybindings
vim.keymap.set(
	"n",
	"dd",
	Vin.cmds.edit.smart_delete,
	{ noremap = true, expr = true }
)
