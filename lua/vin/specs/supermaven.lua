local M = {}

---@type LazyPluginSpec
M.spec = {
    "supermaven-inc/supermaven-nvim",
    event = "InsertEnter",
    enabled = false,
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
    config = function(_, opts)
        require("supermaven-nvim").setup(opts)
    end,
}

return M.spec
