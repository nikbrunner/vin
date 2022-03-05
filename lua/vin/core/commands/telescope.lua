local telescope_builtin_status_ok, telescope_builtins = pcall(require, "telescope.builtin")
if not telescope_builtin_status_ok then
	return
end

local telescope, telescope = pcall(require, "telescope")
if not telescope then
	return
end

local Telescope = {}

-- Find related files based on the current file's name
Telescope.find_related_files = function()
	local fileNameWithExt = vim.fn.expand("%:t")
	local dotIndex = string.find(fileNameWithExt, ".", 1, true)
	local fileName = string.sub(fileNameWithExt, 1, dotIndex - 1)

	telescope_builtins.find_files({ default_text = fileName })
end

-- Find project folders with telescope extension
Telescope.find_projects = function ()
  telescope.extensions.projects.projects()
end

return Telescope
