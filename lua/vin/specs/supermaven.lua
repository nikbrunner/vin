local M = {}

M.toggle_inline_completion = function()
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
    opts = {
        keymaps = {
            accept_suggestion = "<Tab>",
            clear_suggestion = "<C-e>",
            accept_word = "<S-Tab>",
        },
    },
    keys = {
        { "<leader>ia", M.toggle_inline_completion, desc = "[C]ode [I]ntelligence [A]utocompletion" },
        { "<C-a>", mode = "i", M.toggle_inline_completion, desc = "Toggle [A]utocompletion" },
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
