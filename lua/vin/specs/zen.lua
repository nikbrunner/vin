local M = {}

---@type LazyPluginSpec
M.spec = {
    "folke/zen-mode.nvim",
    keys = {
        { "<leader>z", "<CMD>ZenMode<CR>", desc = "Zen Mode" },
    },
    opts = {
        window = {
            backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
            width = 165, -- width of the Zen window
            height = 1, -- height of the Zen window
            options = {
                relativenumber = true, -- disable relative numbers
            },
        },
        plugins = {
            -- disable some global vim options (vim.o...)
            -- comment the lines to not apply the options
            options = {
                enabled = true,
                ruler = false, -- disables the ruler text in the cmd line area
                showcmd = false, -- disables the command in the last line of the screen
                -- you may turn on/off statusline in zen mode by setting 'laststatus'
                -- statusline will be shown only if 'laststatus' == 3
                laststatus = 0, -- turn off the statusline in zen mode
            },
            gitsigns = { enabled = false }, -- disables git signs
            tmux = { enabled = false }, -- disables the tmux statusline
            -- - listen_on unix:/tmp/kitty
            -- this will change the font size on wezterm when in zen mode
            -- See alse also the Plugins/Wezterm section in this projects README
            wezterm = {
                enabled = true,
                -- can be either an absolute font size or the number of incremental steps
                font = "+4", -- (10% increase per step)
            },
        },
    },
}

return M.spec
