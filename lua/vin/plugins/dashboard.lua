---@type LazySpec
local spec = {
    "nvimdev/dashboard-nvim",
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
    event = "VimEnter",
    opts = {
        theme = "hyper",
        change_to_vcs_root = true,
        config = {
            header = {
                "██    ██ ██ ███    ██ ",
                "██    ██ ██ ████   ██ ",
                "██    ██ ██ ██ ██  ██ ",
                " ██  ██  ██ ██  ██ ██ ",
                "  ████   ██ ██   ████ ",
                "",
                "",
                "",
            },
            footer = {
                "",
                "",
                "",
                "Fly with me  ",
            },
            shortcut = {
                {
                    icon = Vin.icons.ui.Package,
                    icon_hl = "@variable",
                    desc = "Plugin Manager (Lazy) ",
                    action = "Lazy",
                    key = "l",
                },
                {
                    icon = Vin.icons.ui.Target,
                    icon_hl = "@variable",
                    desc = "Package Manager (Mason) ",
                    action = "Mason",
                    key = "m",
                },
                {
                    icon = Vin.icons.ui.SignOut,
                    icon_hl = "@macro",
                    desc = "Quit ",
                    action = "qa!",
                    key = "q",
                },
            },
        },
    },
    config = function(_, opts)
        require("dashboard").setup(opts)
    end,
}

return spec
