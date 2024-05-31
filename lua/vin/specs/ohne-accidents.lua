local M = {}

---@type LazyPluginSpec
M.spec = {
    "blumaa/ohne-accidents.nvim",
    branch = "chore/add-option-to-use-notify-api-instead-of-echo",
    event = "UIEnter",
    keys = {
        {
            "<leader>vc",
            ":OhneAccidents<CR>",
            desc = "Time since last config change",
        },
    },
    ---@type OhneAccidentsConfig
    opts = {
        api = "notify",
        multiLine = false,
        useLastCommit = true,
    },
}

return M.spec
