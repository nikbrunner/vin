vin.cmds.diffview = {}

local diffview_notification = function(branchName, message)
    if message == nil then
        vim.notify("Diff from current state to '" .. branchName .. "'")
    else
        vim.notify(message)
    end
end

-- Unused
vin.cmds.diffview.get_diff_to_master = function()
    local commonMasterBranchNames = { "master", "main" }

    local handleInput = function(branchName)
        if vin.lib.includes(commonMasterBranchNames, branchName) then
            vim.cmd("DiffviewOpen origin/" .. branchName .. "...HEAD")
            diffview_notification(branchName)
        end
    end

    vim.ui.select(commonMasterBranchNames, {
        prompt = "What is your master branch called?",
    }, handleInput)
end

vin.cmds.diffview.get_diff_to = function()
    local choices = {
        "Get Diff to other branch",
        "Enter a Git Rev String (HEAD~2, origin/main...HEAD e.g.)",
    }

    local handleDiffToBranch = function()
        local branches = vin.lib.get_all_branches()

        -- Remove the current branch from the selection
        local current_branch = vin.lib.get_current_branch()
        local index_of_current_branch = vin.lib.find_index(branches, current_branch)
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
