local M = {}

---@type LazyPluginSpec
M.spec = {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = {
        use_diagnostic_signs = true,
        position = "bottom", -- position of the list can be: bottom, top, left, right
        icons = false, -- use devicons for filenames
        mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
        group = true, -- group results by file
        padding = true, -- add an extra new line on top of the list
        win_config = { border = "single" }, -- window configuration for floating windows. See |nvim_open_win()|.
        auto_close = true, -- automatically close the list when you have no diagnostics
        auto_fold = true, -- automatically fold a file trouble list at creation
        cycle_results = false, -- cycle item list when reaching beginning or end of list
    },
    keys = {
        { "<leader>dD", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "[D]ocument Diagnostics" },
        { "<leader>dW", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "[W]orkspace Diagnostics" },
        { "<leader>dl", "<cmd>TroubleToggle loclist<cr>", desc = "[L]ocation List" },
        { "<leader>dq", "<cmd>TroubleToggle quickfix<cr>", desc = "[Q]uickfix List" },
        {
            "[q",
            function()
                if require("trouble").is_open() then
                    require("trouble").previous({ skip_groups = true, jump = true })
                else
                    local ok, err = pcall(vim.cmd.cprev)
                    if not ok then
                        vim.notify(err, vim.log.levels.ERROR)
                    end
                end
            end,
            desc = "Previous trouble/quickfix item",
        },
        {
            "]q",
            function()
                if require("trouble").is_open() then
                    require("trouble").next({ skip_groups = true, jump = true })
                else
                    local ok, err = pcall(vim.cmd.cnext)
                    if not ok then
                        ---@diagnostic disable-next-line: param-type-mismatch
                        vim.notify(err, vim.log.levels.ERROR)
                    end
                end
            end,
            desc = "Next trouble/quickfix item",
        },
    },
}

return M.spec
