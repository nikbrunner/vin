local M = {}

---@type LazyPluginSpec
M.spec = {
    "folke/trouble.nvim",
    event = "LspAttach",
    ---@type trouble.Config
    opts = {
        ---@type trouble.Window.opts
        win = {
            auto_jump = true, -- auto jump to the item when there's only one
            auto_close = true,
            border = "double",
            position = "bottom",
            padding = { 1, 4 },
        },
        ---@type table<string, trouble.Mode>
        modes = {
            diagnostics = {
                focus = false,
                auto_close = true,
                ---@type trouble.Window.opts
                win = {
                    position = "bottom",
                    size = { height = 0.35 },
                },
            },
            lsp = {
                focus = false,
                ---@type trouble.Window.opts
                win = {
                    position = "right",
                    size = { width = 0.35 },
                },
            },
            symbols = {
                focus = false,
                ---@type trouble.Window.opts
                win = {
                    position = "right",
                    size = { width = 0.35 },
                },
            },
            lsp_defnitions = {
                focus = true,
                ---@type trouble.Window.opts
                win = {
                    border = "single",
                    position = "bottom",
                    title = "LSP Definitions",
                    padding = { 1, 4 },
                    size = { height = 0.35 },
                },
            },
            lsp_references = {
                focus = true,
                title = "LSP References",
                ---@type trouble.Window.opts
                win = {
                    border = "single",
                    position = "bottom",
                    title = "LSP References",
                    padding = { 1, 4 },
                    size = { height = 0.35 },
                },
            },
        },
    },
    keys = {
        -- { "gd", "<cmd>Trouble lsp_definitions<cr>", desc = "LSP Definitions (Trouble)" },
        { "gr", "<cmd>Trouble lsp_references<cr>", desc = "LSP References (Trouble)" },
        { "<leader>dq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
        { "<leader>di", "<cmd>Trouble lsp toggle<cr>", desc = "LSP Definitions / references / ... (Trouble)" },
        { "<leader>dd", "<cmd>Trouble diagnostics toggle  filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
        { "<leader>dD", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
        { "<leader>es", "<cmd>Trouble symbols toggle<cr>", desc = "Symbols (Trouble)" },
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
