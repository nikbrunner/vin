local M = {}

M.toggle_inline_ai = function()
    local suggestion = require("supermaven-nvim.completion_preview")
    local message = "Inline AI autocompletion "

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
    enabled = true,
    opts = {
        keymaps = {
            accept_suggestion = "<Tab>",
            clear_suggestion = "<C-]>",
            accept_word = "<C-j>",
        },
        ignore_filetypes = {},
        disable_inline_completion = false, -- disables inline completion for use with cmp
        disable_keymaps = false, -- disables built in keymaps for more manual control
    },
    keys = {
        { "<leader>cia", M.toggle_inline_ai, desc = "[C]ode [I]ntelligence [A]utocompletion" },
    },
    config = function(_, opts)
        require("supermaven-nvim").setup(opts)
    end,
}

return M.spec
