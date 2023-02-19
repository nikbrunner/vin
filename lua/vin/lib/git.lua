local utils = require("vin.lib.utils")

local M = {}

---Find out current branch
---@return false|current_branch_name: string Current Branch Name
M.get_current_branch = function()
    return vim.fn.system("git rev-parse --abbrev-ref HEAD")
end

---Find out all branches
---@return false|table
M.get_all_branches = function()
    local resultString

    local branches_output = io.popen("git branch -l")

    if branches_output == nil then
        print("No branches found!")
        return false
    else
        local read_branches = branches_output:read("*a")
        branches_output:close()

        -- Remove the star indicator from the current branch, and remove the \n line chars
        -- TODO This could be done in a single sub
        local stripped = string.gsub(string.gsub(read_branches, "*", ""), "\n", "")

        -- Now split the string by spaces into a table and return it
        local all_branches = utils.split_by_space(stripped)
        return all_branches
    end
end

return M
