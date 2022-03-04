local telescope_status_ok, telescope = pcall(require, "telescope.builtin")
if not telescope_status_ok then
	return
end

local M = {}

M.find_related_files = function()
	local currentFileNameWithExt = vim.fn.expand("%:t")
	local dotIndex = string.find(currentFileNameWithExt, ".", 1, true)
	local fileName = string.sub(currentFileNameWithExt, 1, dotIndex - 1)

	telescope.find_files({ default_text = fileName })
end

return M
