local lib = require("vin.lib")

local M = {}

-- TODO: add binding to add a new todo comment
-- TODO: prefill with parsed issue number?

---@type LazyPluginSpec
M.spec = {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "BufReadPre",
    keys = {
        {
            "<leader>st",
            "<cmd>TodoTelescope<CR>",
            desc = "Todos",
        },
        {
            "<leader>at",
            function()
                local branch_name = lib.git.get_current_git_branch()
                if branch_name then
                    local issue_id = lib.git.parse_issue_id_from_branch(branch_name)

                    vim.ui.input({ prompt = "Enter todo comment" }, function(todo_comment)
                        local comment

                        if issue_id then
                            comment = "TODO: " .. issue_id .. " " .. todo_comment
                        else
                            comment = "TODO: " .. " " .. todo_comment
                        end

                        vim.cmd("norm O" .. comment .. " ")

                        local current_line_num = vim.fn.line(".")

                        require("mini.comment").toggle_lines(current_line_num, current_line_num)

                        vim.cmd.wa()
                    end)
                end
            end,
            desc = "Add todo (/w parsing from branch issue",
        },
        {
            "]t",
            function()
                require("todo-comments").jump_next()
            end,
            desc = "Next todo comment",
        },
        {
            "[t",
            function()
                require("todo-comments").jump_prev()
            end,
            desc = "Prev todo comment",
        },
    },
    opts = {},
}

return M.spec
