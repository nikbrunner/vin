require("vin.core.utils.globals")

local utils = require("telescope.utils")

local M = {}

M.get_master_branch_name = function()
	local branches = utils.get_os_command_output({
		"git",
		"branch",
		"-l",
		"master",
		"main",
	})[1]

	for _, v in pairs(split(branches, " ")) do
		if v == "main" then
			return "main"
		end

		if v == "master" then
			return "master"
		end
	end
end

return M
