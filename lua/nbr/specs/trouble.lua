local M = {}

---@type LazyPluginSpec
M.spec = {
    "folke/trouble.nvim",
    event = "LspAttach",
    ---@type trouble.Config
    opts = {
        focus = true,
        follow = false, -- Follow the current item
        ---@type trouble.Window.opts
        win = {
            type = "float",
            position = { 0.85, 0.5 },
            size = { width = 0.5, height = 0.20 },
            padding = { top = 1, left = 4 },
            border = "solid",
            title = "",
        },
        ---@type table<string, trouble.Mode>
        modes = {
            diagnostics = {},
            lsp = {
                pinned = true,
            },
            symbols = {
                focus = true,
                ---@type trouble.Window.opts
                win = {
                    type = "float",
                    position = { 0.85, 0.65 },
                    size = { width = 0.35, height = 0.5 },
                    padding = { top = 1, left = 4 },
                    border = "solid",
                    title = "",
                },
            },
            lsp_defnitions = {
                focus = true,
                auto_jump = true, -- auto jump to the item when there's only one
                auto_close = true,
            },

            lsp_references = {
                focus = true,
                auto_refresh = false, -- auto refresh when open
                params = {
                    include_declaration = false,
                },
            },
        },
    },
    keys = {
        { "gr", "<cmd>Trouble lsp_references<cr>", desc = "Symbol References" },
        {
            "gt",
            function()
                require("trouble").focus()
            end,
            desc = "Symbol References",
        },
        { "<leader>di", "<cmd>Trouble lsp toggle<cr>", desc = "Symbol Information" },
        { "<leader>dci", "<cmd>Trouble lsp_incoming_calls<cr>", desc = "Calls Incoming" },
        { "<leader>dco", "<cmd>Trouble lsp_outgoing_calls<cr>", desc = "Calls Outgoing" },
        { "<leader>dd", "<cmd>Trouble diagnostics toggle  filter.buf=0<cr>", desc = "Document" },
        { "<leader>dw", "<cmd>Trouble diagnostics toggle<cr>", desc = "Workspace" },
        { "<leader>dt", "<cmd>Trouble symbols toggle<cr>", desc = "Symbols" },
        {
            "[q",
            function()
                if require("trouble").is_open() then
                    ---@diagnostic disable-next-line: missing-fields, missing-parameter
                    require("trouble").prev({ skip_groups = true, jump = true })
                else
                    local ok, err = pcall(vim.cmd.cprev)
                    if not ok then
                        vim.notify(err, vim.log.levels.ERROR)
                    end
                end
            end,
            desc = "Previous Trouble/Quickfix Item",
        },
        {
            "]q",
            function()
                if require("trouble").is_open() then
                    ---@diagnostic disable-next-line: missing-fields, missing-parameter
                    require("trouble").next({ skip_groups = true, jump = true })
                else
                    local ok, err = pcall(vim.cmd.cnext)
                    if not ok then
                        vim.notify(err, vim.log.levels.ERROR)
                    end
                end
            end,
            desc = "Next Trouble/Quickfix Item",
        },
    },
}

return M.spec
