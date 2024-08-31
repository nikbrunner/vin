local M = {}

---@type LazyPluginSpec
M.spec = {
    "olimorris/codecompanion.nvim",
    enabled = true,
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
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
        keymaps = {
            send = {
                modes = {
                    n = "<C-s>",
                    i = "<C-s>",
                },
                index = 1,
                callback = "keymaps.send",
                description = "Send",
            },
        },
        default_prompts = {
            ["Generate a Commit Message"] = {
                strategy = "chat",
                description = "Generate a commit message",
                opts = {
                    index = 5,
                    default_prompt = true,
                    mapping = "<LocalLeader>cm",
                    slash_cmd = "commit",
                    auto_submit = true,
                },
                prompts = {
                    {
                        role = "${user}",
                        contains_code = true,
                        content = function()
                            return "You are an expert at following the Conventional Commit specification. Given the git diff listed below, without detailed explanation, please generate a commit message for me:"
                                .. "\n\n```\n"
                                .. vim.fn.system("git diff")
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
        { "<leader>ia", "<cmd>CodeCompanionActions<CR>", desc = "AI Actions" },
        { "<leader>it", "<cmd>CodeCompanionToggle<CR>", desc = "AI Actions" },
        { "ga", "<cmd>CodeCompanionAdd<CR>", desc = "Add Selection", mode = { "v" } },
    },
    init = function()
        vim.cmd([[cab cc CodeCompanion]])
    end,
}

return M.spec
