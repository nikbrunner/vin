local M = {}

---@type LazyPluginSpec
M.spec = {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle",
    event = { "InsertLeave", "TextChanged" },
    keys = {
        { "<leader>as", ":ASToggle<CR>", desc = "Toggle auto save" },
    },
    opts = {
        enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
        execution_message = {
            enabled = false,
        },
        trigger_events = { -- See :h events
            immediate_save = { "BufLeave", "FocusLost" }, -- vim events that trigger an immediate save
            defer_save = { "InsertLeave", "TextChanged" }, -- vim events that trigger a deferred save (saves after `debounce_delay`)
            cancel_defered_save = { "InsertEnter" }, -- vim events that cancel a pending deferred save
        },
        debounce_delay = 1000, -- delay after which a pending save is executed
        debug = true,
    },
    config = function(_, opts)
        local group = vim.api.nvim_create_augroup("autosave", {})

        vim.api.nvim_create_autocmd("User", {
            pattern = "AutoSaveWritePre",
            group = group,
            ---@diagnostic disable-next-line: unused-local
            callback = function(auto_opts)
                require("conform").format({
                    async = false,
                    timeout_ms = 500,
                    lsp_fallback = true,
                })
            end,
        })

        vim.api.nvim_create_autocmd("User", {
            pattern = "AutoSaveWritePost",
            group = group,
            ---@diagnostic disable-next-line: unused-local
            callback = function(auto_opts)
                if auto_opts.data.saved_buffer ~= nil then
                    -- Convert saved_buffer path to relative path
                    local filename = vim.api.nvim_buf_get_name(auto_opts.data.saved_buffer)
                    local relative_filename = vim.fn.fnamemodify(filename, ":~:.")
                    vim.notify("AutoSave - " .. relative_filename)
                end
            end,
        })

        require("auto-save").setup(opts)
    end,
}

return M.spec
