local M = {}

---@type LazyPluginSpec[]
M.specs = {
    {
        "nvim-tree/nvim-web-devicons",
        dependencies = {
            {
                "projekt0n/circles.nvim",
                event = "VeryLazy",
                opts = function()
                    local icons = require("vin.icons")

                    return {
                        icons = {
                            empty = icons.misc.circle_md,
                            filled = icons.misc.circle_md,
                            lsp_prefix = icons.misc.circle_md,
                        },
                    }
                end,
                config = function(_, opts)
                    require("circles").setup(opts)
                end,
            },
        },
        event = "VeryLazy",
        opts = function()
            local icons = require("vin.icons")

            return {
                color_icons = true,
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
    },
}

return M.specs
