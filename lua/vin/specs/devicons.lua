local M = {}

---@type LazyPluginSpec
M.spec = {
    "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    enabled = false,
    opts = function()
        local icons = require("vin.icons")

        return {
            color_icons = false,
            strict = true,
            override_by_filename = {
                [".luacheckrc"] = { icon = icons.filetype.rc },
                [".prettierrc"] = { icon = icons.filetype.rc },
                [".prettierignore"] = { icon = icons.filetype.rc },
                [".shellcheckrc"] = { icon = icons.filetype.rc },
                [".nvmrc"] = { icon = icons.filetype.rc },
            },
        }
    end,
    config = function(_, opts)
        require("nvim-web-devicons").setup(opts)
    end,
}

return M.spec
