local M = {}

---@type LazyPluginSpec
M.spec = {
    "folke/zen-mode.nvim",
    keys = {
        { "<leader>z", "<CMD>ZenMode<CR>", desc = "Zen" },
    },
    opts = {
        window = {
            backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
            width = 0.65, -- width of the Zen window
            height = 1, -- height of the Zen window
            options = {
                relativenumber = true,
            },
        },
        plugins = {
            tmux = {
                -- Causing too much issues
                enabled = false,
            },
            options = {
                laststatus = 3,
            },
        },
    },
}

return M.spec
