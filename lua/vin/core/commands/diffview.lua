local notify_status_ok, notify = pcall(require, "notify")
if not notify_status_ok then
	return
end

local M = {}

local diffview_notification = function(branchName, message)
	if message == nil then
		notify("Diff to '" .. branchName .. "'", "info", {
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
	local handleInput = function(masterBranchName)
		if masterBranchName == "master" or masterBranchName == "main" then
			vim.cmd("DiffviewOpen origin/" .. masterBranchName .. "...HEAD")
			diffview_notification(masterBranchName)
		elseif masterBranchName == "other" then
			vim.ui.input({
				prompt = "How is you main branch called?",
			}, function(customMasterBranchName)
				vim.cmd(
					"DiffviewOpen origin/" .. customMasterBranchName .. "...HEAD"
				)
				diffview_notification(
					customMasterBranchName,
					"Try to find Diff to Custom Master Branch Name '"
						.. customMasterBranchName
						.. "'"
				)
			end)
		end
	end

	vim.ui.select({
		"master",
		"main",
		"other",
	}, {
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
					"Try to find Diff to Custom Master Branch Name '"
						.. branchName
						.. "'"
				)
	end

	vim.ui.input(input_prompt, handleInput)
end

return M
