-- NOTE: Usage & Billing: https://github.com/settings/billing
-- Authentication via Plugin

---@type LazySpec
local spec = {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = {
        panel = {
            enabled = false,
            auto_refresh = false,
            keymap = {
                jump_prev = "[[",
                jump_next = "]]",
                accept = "<CR>",
                refresh = "gr",
                open = "<M-y>",
            },
        },
        suggestion = {
            enabled = Vin.config.copilot.suggestions.enable,
            auto_trigger = Vin.config.copilot.suggestions.auto_trigger,
            debounce = 75,
            keymap = {
                accept = "<C-l>",
                accept_word = false,
                accept_line = false,
                next = "<C-n>",
                prev = "<C-p>",
                dismiss = "<C-h>",
            },
        },
        filetypes = {
            yaml = false,
            markdown = true,
            help = false,
            gitcommit = true,
            gitrebase = false,
            hgcommit = false,
            svn = false,
            cvs = false,
            ["."] = false,
        },
        copilot_node_command = "node", -- Node.js version must be > 16.x
    },
    config = function(_, opts)
        vim.schedule(function()
            local copilot = require("copilot")
            copilot.setup(opts)
        end)
    end,
}

return spec
