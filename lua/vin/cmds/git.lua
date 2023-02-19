local general = require("vin.cmds.general")
local utils = require("vin.lib.utils")
local gitsigns = require("gitsigns")

local M = {}

M.open_changes_in_qf = function()
    gitsigns.setqflist()
end

M.hunk_preview = function()
    gitsigns.preview_hunk()
end

M.toggle_current_line_blame = function()
    gitsigns.toggle_current_line_blame()
    vim.notify("Toggled Current Line Blame")
end

M.blame_line = function()
    gitsigns.blame_line()
    general.center_line_vertical()
end

M.hunk_reset = function()
    gitsigns.reset_hunk()
    general.center_line_vertical()
end

M.hunk_go_prev = function()
    gitsigns.prev_hunk()
    general.center_line_vertical()
end

M.hunk_go_next = function()
    gitsigns.next_hunk()
    general.center_line_vertical()
end

M.hunk_stage = function()
    gitsigns.stage_hunk()
end

M.hunk_undo_stage = function()
    gitsigns.undo_stage_hunk()
end

M.buffer_stage = function()
    gitsigns.stage_buffer()
end

M.buffer_reset = function()
    gitsigns.reset_buffer()
end

local diffview_notification = function(branchName, message)
    if message == nil then
        vim.notify("Diff from current state to '" .. branchName .. "'")
    else
        vim.notify(message)
    end
end

-- Unused
M.get_diff_to_master = function()
    local commonMasterBranchNames = { "master", "main" }

    local handleInput = function(branchName)
        if utils.includes(commonMasterBranchNames, branchName) then
            vim.cmd("DiffviewOpen origin/" .. branchName .. "...HEAD")
            diffview_notification(branchName)
        end
    end

    vim.ui.select(commonMasterBranchNames, {
        prompt = "What is your master branch called?",
    }, handleInput)
end

M.get_diff_to = function()
    local choices = {
        "Get Diff to other branch",
        "Enter a Git Rev String (HEAD~2, origin/main...HEAD e.g.)",
    }

    local handleDiffToBranch = function()
        local branches = utils.get_all_branches()

        -- Remove the current branch from the selection
        local current_branch = utils.get_current_branch()
        local index_of_current_branch = utils.find_index(branches, current_branch)
        table.remove(branches, index_of_current_branch)

        vim.ui.select(branches, {
            prompt = "Pick a branch",
        }, function(branchName)
            if branchName == nil or branchName == "" then
                return
            end

            vim.cmd("DiffviewOpen " .. branchName)

            diffview_notification(
                branchName,
                "Diff from current branch to '" .. branchName .. "'"
            )
        end)
    end

    local handleDiffToGitRev = function()
        vim.ui.input({ prompt = "Enter a Git Rev" }, function(git_rev)
            if git_rev == nil or git_rev == "" then
                return
            end

            vim.cmd("DiffviewOpen " .. git_rev)
        end)
    end

    local handleChoice = function(choice)
        if choice == choices[1] then
            handleDiffToBranch()
        elseif choice == choices[2] then
            handleDiffToGitRev()
        end
    end

    vim.ui.select(choices, {
        prompt = "What do you want to do?",
    }, handleChoice)
end

return M
