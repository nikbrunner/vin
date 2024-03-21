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

---@type LazyPluginSpec
M.spec = {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    keys = {
        {
            "<leader>ica",
            M.toggle_copilot_auto_suggestion,
            desc = "Toggle [A]uto Suggestion",
        },
        {
            "<leader>ict",
            M.toggle_copilot,
            desc = "Toggle [S]tatus (On/Off)",
        },
        {
            "<leader>ics",
            "<cmd>Copilot status<CR>",
            desc = "Status",
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
                -- accept = "<Right>",
                accept = "<Right>",
                accept_word = "<M-Right>",
                next = "<M-]>",
                prev = "<M-[>",
                dismiss = "<Left>",
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
