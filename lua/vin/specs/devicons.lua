local M = {}

---@type "web-devicons" | "mini.icons"
M.enabled_icons = "web-devicons"

---@type LazyPluginSpec[]
M.specs = {
    {
        "nvim-tree/nvim-web-devicons",
        enabled = M.enabled_icons == "web-devicons",
        dependencies = {
            {
                "projekt0n/circles.nvim",
                enabled = M.enabled_icons == "web-devicons",
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

    {
        "echasnovski/mini.icons",
        enabled = M.enabled_icons == "mini.icons",
        opts = {},
        lazy = true,
        specs = {
            { "nvim-tree/nvim-web-devicons", enabled = M.enabled_icons == "web-devicons", optional = true },
        },
        init = function()
            package.preload["nvim-web-devicons"] = function()
                -- needed since it will be false when loading and mini will fail
                package.loaded["nvim-web-devicons"] = {}
                require("mini.icons").mock_nvim_web_devicons()
                return package.loaded["nvim-web-devicons"]
            end
        end,
    },
}

return M.specs
