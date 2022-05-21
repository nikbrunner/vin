local notify_status_ok, notify = pcall(require, "notify")
if not notify_status_ok then
	return
end

local M = {}

-- TODO Detect and notify about errors
-- If opening the diff is not successfull notify!

local diffview_notification = function(branchName, message)
	if message == nil then
		notify("Diff from current state to '" .. branchName .. "'", "info", {
			title = "Diff",
			icon = " ",
		})
	else
		notify(message, "info", {
			title = "Diff",
			icon = " ",
		})
	end
end

M.get_diff_to_master = function()
	local commonMasterBranchNames = { "master", "main" }

	local handleInput = function(branchName)
		if table_contains(commonMasterBranchNames, branchName) then
			vim.cmd("DiffviewOpen origin/" .. branchName .. "...HEAD")
			diffview_notification(branchName)
		end
	end

	vim.ui.select(commonMasterBranchNames, {
		prompt = "What is your master branch called?",
	}, handleInput)
end

M.get_diff_to_custom = function()
	local input_prompt = {
		prompt = "Enter Git Rev Query (e.g. 'origin/main...HEAD' or. 'HEAD~2')",
	}

	local handleInput = function(branchName)
		vim.cmd("DiffviewOpen " .. branchName)

		diffview_notification(
			branchName,
			"Try to find Diff to Custom Master Branch Name '" .. branchName .. "'"
		)
	end

	vim.ui.input(input_prompt, handleInput)
end

return M
