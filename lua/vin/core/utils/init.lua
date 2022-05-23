require("vin.core.utils.globals")

local status_ok, utils = pcall(require, "telescope.utils")
if not status_ok then
	return
end

local M = {}

M.get_master_branch = function()
	local branches = utils.get_os_command_output({
		"git",
		"branch",
		"-l",
		"master",
		"main",
	})[1]

	-- TODO split function has been changed. THis needs to be fixed
	for _, v in pairs(split_by_space(branches)) do
		if v == "main" then
			return "main"
		end

		if v == "master" then
			return "master"
		end
	end
end

---
-- Find out current branch
-- @return {false|git branch name}
---
M.get_current_branch = function()
	for line in io.popen("git branch 2>nul"):lines() do
		local m = line:match("%* (.+)$")
		if m then
			return m
		end
	end

	return false
end

---
-- Find out alle branches
-- @return {false|all git branch name}
---
M.get_all_branches = function()
	local resultString

	local branches_output = io.popen("git branch -l")

	if branches_output == nil then
		print("No branches found!")
		return
	else
		local read_branches = branches_output:read("*a")
		branches_output:close()

		-- Remove the star indicator from the current branch, and remove the \n line chars
		-- TODO This could be done in a single sub
		local stripped = string.gsub(string.gsub(read_branches, "*", ""), "\n", "")

		-- Now split the string by spaces into a table and return it
		return split_by_space(stripped)
	end
end

return M
