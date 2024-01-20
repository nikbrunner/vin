-- NOTE: Usage & Billing: https://github.com/settings/billing
-- Authentication via Plugin `:Copilot auth`

local M = {}

function M.toggle_copilot()
    require("copilot.suggestion").toggle_auto_trigger()
    local state = vim.b.copilot_suggestion_auto_trigger
    vim.notify("Copilot: Auto Trigger " .. (state and "Enabled" or "Disabled"))
end

---@type LazySpec
M.spec = {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    keys = {},
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
                accept_word = "<S-Tab>",
                accept_line = false,
                next = "<M-]>",
                prev = "<M-[>",
                dismiss = "/",
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
