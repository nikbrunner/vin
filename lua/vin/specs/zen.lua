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
            width = 165, -- width of the Zen window
            height = 1, -- height of the Zen window
            options = {
                relativenumber = true,
            },
        },
        plugins = {
            tmux = { enabled = true }, -- disables the tmux statusline
        },
        on_open = function()
            vim.opt.laststatus = 0
        end,
        on_close = function()
            vim.opt.laststatus = 3
        end,
    },
}

return M.spec
