local M = {}

---@type LazyPluginSpec
M.spec = {
    "olimorris/codecompanion.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim",
        { "stevearc/dressing.nvim", opts = {} },
    },
    -- Source: https://github.com/olimorris/codecompanion.nvim?tab=readme-ov-file#hammer_and_wrench-defaults
    opts = {
        strategies = {
            chat = {
                adapter = "anthropic",
            },
            inline = {
                adapter = "openai",
            },
        },
        pre_defined_prompts = {
            ["Generate a Commit Message"] = {
                strategy = "chat",
                description = "Generate a commit message",
                opts = {
                    mapping = "<leader>im",
                    modes = { "n" },
                    slash_cmd = "commit",
                    auto_submit = true,
                },
                prompts = {
                    {
                        role = "system",
                        content = function()
                            local has_staged_changes = vim.fn.system("git diff --staged") ~= ""

                            if not has_staged_changes then
                                vim.notify(
                                    "Error while generating commit message: No staged changes found"
                                        .. "\n\n"
                                        .. "Please stage your changes before running this command.",
                                    vim.log.levels.ERROR
                                )
                                return
                            end

                            local base_template = "You are an expert at following the Conventional Commit specification."
                                .. "Given the git diff listed below, please generate a detailed commit message for me and return it to me directly without explanation:"
                                .. "Use the summary line to describe the overall change, followed by an empty line, and then a more detailed, consice description of the change in the body in bullet points."
                                .. "Use as litte bullet points as possible. We want to keep the commit message short and concise."
                                .. "If you encounter variable names or other code elements, please wrap them in backticks. (e.g. `<var-name>`)"
                                .. "When asserting the scope, consider if it makes most sense to include the file name or the folder scope by looking at the pathes of the files changed."
                                .. "In most cases, the summary is enough to describe the overall change. Use the body only if the summary is not enough to describe the change."
                                .. "If the commit affects multiple files, consider the pathes of the files changed for the scope."
                                .. "If the commit only affects a single file, or one file has the main role in the change, please use the following format:"
                                .. "- feat|fix|docs|style|refactor|test|chore|revert(<affected-file (without file-extension) or scope>): description"
                                .. "In the bullet points, use the following format:"
                                .. "- feat|fix|docs|style|refactor|test|chore|revert(<affected-file (without file-extension) or scope>): description"

                            local template = base_template

                            -- If the branch name includes an issue ticket number, we use it to prefix the commit message.
                            -- Example: bcd-1234-some-new-feature -> BCD-1234 feat: some new feature
                            local current_branch = vim.fn.system("git rev-parse --abbrev-ref HEAD")
                            local issue_id = string.match(current_branch, "^bcd%-(%d%d%d%d)")
                            local prefix = issue_id and "BCD-" .. issue_id .. " " or ""

                            if issue_id then
                                template = base_template
                                    .. "\n\n"
                                    .. "Please prefix the summary line with the following issue ID: "
                                    .. prefix
                                    .. "\n\n"
                                    .. "Example: BCD-1234 feat: some new feature"
                            end

                            return template
                        end,
                    },
                    {
                        role = "user",
                        content = function()
                            return "This is the diff I have staged:"
                                .. "\n\n```diff\n"
                                .. vim.fn.system("git diff --cached")
                                .. "\n```"
                        end,
                    },
                },
            },
        },
        opts = {
            silence_notifications = true,
            auto_save_chats = true,
            saved_chats_dir = vim.fn.stdpath("config") .. "/codecompanion/chats",
        },
    },
    keys = {
        { "<leader>ia", "<cmd>CodeCompanionActions<CR>", desc = "Actions" },
        { "<leader>it", "<cmd>CodeCompanionToggle<CR>", desc = "Toggle" },
        { "ga", "<cmd>CodeCompanionAdd<CR>", desc = "Add Selection", mode = { "v" } },
    },
    init = function()
        vim.cmd([[cab cc CodeCompanion]])
    end,
}

return M.spec
