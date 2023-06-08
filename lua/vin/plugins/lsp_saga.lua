---@type LazySpec
local spec = {
    "nvimdev/lspsaga.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "nvim-treesitter/nvim-treesitter",
    },
    event = "LspAttach",
    opts = {
        finder = {
            max_height = 0.5,
            min_width = 30,
            force_max_height = false,
            keys = {
                jump_to = "p",
                expand_or_jump = "o",
                vsplit = "v",
                split = "s",
                tabe = "t",
                tabnew = "T",
                quit = { "q", "<ESC>" },
                close_in_preview = "<ESC>",
            },
        },

        definition = {
            edit = "<C-c>o",
            vsplit = "<C-c>v",
            split = "<C-c>s",
            tabe = "<C-c>t",
            quit = "q",
        },

        lightbulb = {
            enable = false,
            enable_in_insert = false,
        },

        outline = {
            win_position = "right",
            win_width = Vin.config.sidebar_width,
            preview_width = 0.4,
            show_detail = true,
            auto_preview = true,
            auto_refresh = true,
            auto_close = true,
            auto_resize = false,
            custom_sort = nil,
            keys = {
                expand_or_jump = "o",
                quit = "q",
            },
        },

        ui = {
            border = "rounded",
        },
    },
    config = function(_, opts)
        require("lspsaga").setup(opts)
    end,
}

return spec
