-- NOTE: Usage & Billing: https://github.com/settings/billing
-- Authentication via Plugin `:Copilot auth`

local M = {}

---@type LazySpec
M.spec = {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    keys = {
        {
            "<leader>cip",
            function()
                require("copilot.suggestion").toggle_auto_trigger()
            end,
            desc = "Copilot: Toggle Auto Trigger",
        },
    },
    opts = {
        panel = {
            enabled = false,
            auto_refresh = false,
        },
        suggestion = {
            enabled = true,
            auto_trigger = true,
            debounce = 150,
            keymap = {
                accept = "<Tab>",
                accept_word = false,
                accept_line = false,
                next = "<M-]>",
                prev = "<M-[>",
                dismiss = "<C-[>",
            },
        },
        filetypes = {
            yaml = true,
            markdown = true,
            help = false,
            gitcommit = true,
            gitrebase = false,
        },
    },
}

return M.spec
