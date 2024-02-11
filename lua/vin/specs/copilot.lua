-- NOTE: Usage & Billing: https://github.com/settings/billing
-- Authentication via Plugin `:Copilot auth`

local M = {}

function M.toggle_copilot_auto_suggestion()
    require("copilot.suggestion").toggle_auto_trigger()
    local state = vim.b.copilot_suggestion_auto_trigger
    vim.notify("Copilot: Auto Trigger " .. (state and "Enabled" or "Disabled"))
end

function M.toggle_copilot()
    require("copilot.command").toggle()
    local state = require("copilot.client").buf_is_attached(0)
    vim.notify("Copilot: " .. (state and "Enabled" or "Disabled"))
end

---@type LazySpec
M.spec = {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    dependencies = { "AndreM222/copilot-lualine" },
    keys = {
        {
            "<leader>ipa",
            M.toggle_copilot_auto_suggestion,
            desc = "Toggle Copilot Auto Suggestion",
        },
        {
            "<leader>ipt",
            M.toggle_copilot,
            desc = "Toggle Copilot",
        },
    },
    opts = {
        panel = {
            enabled = true,
            auto_refresh = false,
            keymap = {
                jump_prev = "[[",
                jump_next = "]]",
                accept = "<CR>",
                refresh = "gr",
                open = "<M-CR>",
            },
            layout = {
                position = "bottom", -- | top | left | right
                ratio = 0.4,
            },
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
