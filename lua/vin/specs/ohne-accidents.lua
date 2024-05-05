local M = {}

---@type LazyPluginSpec
M.spec = {
    "nikbrunner/ohne-accidents.nvim",
    dev = true,
    event = "UIEnter",
    enabled = false,
    pin = true,
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
    },
}

return M.spec
