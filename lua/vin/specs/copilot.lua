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
    keys = {
        { "<leader>cic", M.toggle_copilot, desc = "Copilot: Toggle Auto Trigger" },
    },
    opts = {
        panel = {
            enabled = false,
            auto_refresh = false,
        },
        suggestion = {
            enabled = true,
            auto_trigger = false,
            debounce = 150,
            keymap = {
                accept = "<Tab>",
                accept_word = false,
                accept_line = false,
                next = "<Right>",
                prev = "<Left>",
                dismiss = "<S-Tab>",
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
