---@type LazySpec
local spec = {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "meuter/lualine-so-fancy.nvim",
    },
    event = "VeryLazy",
    opts = function()
        local fnamemodify = vim.fn.fnamemodify

        ---@type TerraColors
        local terra_colors = require("terra.colors")

        local separators = Vin.icons.separators

        local hide_in_width = function()
            return vim.fn.winwidth(0) > 80
        end

        local mode = {
            function()
                return Vin.icons.misc.Vim
            end,
            padding = 1,
        }

        local date = {
            function()
                return os.date("%A, %d %B %Y")
            end,
            padding = 1,
        }

        local time = {
            function()
                return os.date("%H:%M:%S")
            end,
            padding = 1,
        }

        local project_name = {
            function()
                local current_project_folder = fnamemodify(vim.fn.getcwd(), ":t")
                local parent_project_folder = fnamemodify(vim.fn.getcwd(), ":h:t")
                return Vin.icons.kind.Folder
                    .. " "
                    .. parent_project_folder
                    .. "/"
                    .. current_project_folder
            end,
            padding = 2,
        }

        local tabs = {
            "tabs",
            max_length = 20, -- Maximum width of tabs component.
            mode = 0, -- 0: Shows tab_nr 1: Shows tab_name 2: Shows tab_nr + tab_name
            padding = 1,
        }

        local lazy_plug_count = {
            function()
                local stats = require("lazy").stats()
                return Vin.icons.ui.Package .. " " .. stats.count
            end,
            color = { fg = terra_colors.palette.dark_yellow },
        }

        local lazy_startup = {
            function()
                local stats = require("lazy").stats()
                local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                return Vin.icons.ui.Dashboard .. " " .. ms .. "ms"
            end,
            color = { fg = terra_colors.palette.dark_yellow },
        }

        local lazy_updates = {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = { fg = terra_colors.palette.dark_yellow },
            padding = 1,
        }

        return {
            options = {
                globalstatus = true,
                icons_enabled = true,
                theme = "auto",
                section_separators = {
                    left = separators.left.round,
                    right = separators.right.round,
                },
                component_separators = {
                    left = separators.left.straight,
                    right = separators.right.straight,
                },
                disabled_filetypes = {
                    statusline = {
                        "alpha",
                    },
                    winbar = {
                        "alpha",
                        "NvimTree",
                        "neo-tree",
                        "",
                    },
                },
                always_divide_middle = true,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                },
            },
            tabline = {
                lualine_a = { date, time },
                lualine_b = { lazy_plug_count, lazy_startup, lazy_updates },
                lualine_y = { tabs },
            },
            -- Disabled for now for use with barbecue
            -- winbar = {
            --     lualine_a = {},
            --     lualine_b = { filetype_icon, filename },
            --     lualine_c = {},
            --     lualine_x = { diff, "diagnostics" },
            --     lualine_y = {},
            --     lualine_z = {},
            -- },
            -- inactive_winbar = {
            --     lualine_a = {},
            --     lualine_b = { filetype_icon, filename },
            --     lualine_c = {},
            --     lualine_x = {},
            --     lualine_y = {},
            --     lualine_z = {},
            -- },
            sections = {
                lualine_a = { mode },
                lualine_b = { project_name },
                lualine_c = { "fancy_branch", "fancy_diff" },
                lualine_x = {
                    { "fancy_macro" },
                    { "fancy_diagnostics" },
                    { "fancy_searchcount" },
                    { "fancy_location" },
                },
                lualine_y = {
                    { "fancy_lsp_servers" },
                },
                lualine_z = {
                    { "fancy_filetype", ts_icon = "" },
                },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
            extensions = {},
        }
    end,
}

return spec
