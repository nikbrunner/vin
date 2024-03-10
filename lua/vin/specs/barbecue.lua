---@type LazyPluginSpec
local spec = {
    "utilyre/barbecue.nvim",
    event = "BufReadPre",
    name = "barbecue",
    version = "*",
    dependencies = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
        ---Whether to attach navic to language servers automatically.
        ---
        ---@type boolean
        attach_navic = false,

        ---filetypes not to enable winbar in
        ---@type string[]
        exclude_filetypes = { "gitcommit", "ftterm_lazygit" },

        ---whether to display path to file
        ---@type boolean
        show_dirname = true,

        ---whether to replace file icon with the modified symbol when buffer is modified
        ---@type boolean
        show_modified = true,

        ---Whether context text should follow its icon's color.
        ---@type boolean
        context_follow_icon_color = true,

        symbols = {
            modified = require("vin.icons").git.modified,
            ellipsis = require("vin.icons").misc.dots,
            separator = require("vin.icons").misc.forwardSlash,
        },

        kinds = require("vin.icons").kinds,
    },
    config = function(_, opts)
        require("barbecue").setup(opts)
    end,
}

return spec
