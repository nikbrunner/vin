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
    enabled = false,
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
            enabled = false,
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
            auto_trigger = false,
            debounce = 150,
            keymap = {
                accept = "<Tab>",
                dismiss = "<S-Tab>",
                next = "<M-]>",
                prev = "<M-[>",
            },
        },
        filetypes = {
            yaml = true,
            markdown = true,
            help = false,
            gitcommit = true,
            gitrebase = false,
            jsonc = true,
            ["neo-tree"] = false,
        },
    },
}

return M.spec
