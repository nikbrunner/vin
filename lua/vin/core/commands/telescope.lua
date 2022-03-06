local telescope_builtin_status_ok, telescope_builtins = pcall(
	require,
	"telescope.builtin"
)
if not telescope_builtin_status_ok then
	return
end

local telescope_status_ok, telescope = pcall(require, "telescope")
if not telescope_status_ok then
	return
end

local general_commands = require("vin.core.commands.general")

local Telescope = {}

-- Find related files based on the current file's name
Telescope.find_related_files = function()
	telescope_builtins.find_files({
		default_text = general_commands.get_current_filename(),
	})
end

-- Find project folders with telescope extension
Telescope.find_projects = function()
	telescope.extensions.projects.projects()
end

return Telescope
