local M = {}

M.toggle_inline_completion = function()
    local suggestion = require("supermaven-nvim.completion_preview")
    local message = "AI Auto-Completion "

    if suggestion.disable_inline_completion then
        suggestion.disable_inline_completion = false
        vim.notify(message .. "ENABLED", vim.log.levels.INFO, { title = "SuperMaven" })
    else
        suggestion.disable_inline_completion = true
        vim.notify(message .. "DISABLED", vim.log.levels.INFO, { title = "SuperMaven" })
    end
end

---@type LazyPluginSpec
M.spec = {
    "supermaven-inc/supermaven-nvim",
    event = "InsertEnter",
    opts = {
        keymaps = {
            accept_suggestion = "<Right>",
            clear_suggestion = "<Left>",
            accept_word = "<C-Right>",
        },
        log_level = "off", -- set to "off" to disable logging completely
    },
    keys = {
        { "<leader>ic", M.toggle_inline_completion, desc = "Autocompletion" },
    },
    init = function()
        -- Disable inline completion by default
        require("supermaven-nvim.completion_preview").disable_inline_completion = true
    end,
    config = function(_, opts)
        require("supermaven-nvim").setup(opts)
    end,
}

return M.spec
