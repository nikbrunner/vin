local M = {}

---@type LazyPluginSpec
M.spec = {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "meuter/lualine-so-fancy.nvim",
        "piersolenski/wtf.nvim",
        "AndreM222/copilot-lualine",
    },
    event = "VeryLazy",
    opts = function()
        local wtf = require("wtf")

        local fnamemodify = vim.fn.fnamemodify

        local mode = {
            function()
                return require("vin.icons").misc.circle .. "Vin"
            end,
            padding = {
                left = 1,
                right = 6,
            },
        }

        local filetype = {
            "filetype",
            colored = false, -- Displays filetype icon in color if set to true
            padding = 2,
        }

        local filetype_icon = {
            "filetype",
            padding = 2,
        }

        local filename = {
            "filename",
            file_status = true, -- Displays file status (readonly status, modified status)
            newfile_status = true, -- Display new file status (new file means no write after created)
            path = 1, -- 0: Just the filename
        }

        local tabs = {
            "tabs",
            cond = function()
                return vim.fn.tabpagenr("$") > 1
            end,
        }

        local project_name = {
            function()
                local current_project_folder = fnamemodify(vim.fn.getcwd(), ":t")
                local parent_project_folder = fnamemodify(vim.fn.getcwd(), ":h:t")
                return parent_project_folder .. "/" .. current_project_folder
            end,
            padding = 2,
        }

        local lazy_plug_count = {
            function()
                local stats = require("lazy").stats()
                return " " .. stats.count
            end,
        }

        local lazy_startup = {
            function()
                local stats = require("lazy").stats()
                local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                return " " .. ms .. "ms"
            end,
        }

        local lazy_updates = {
            require("lazy.status").updates,
            padding = 1,
        }

        local copilot = {
            "copilot",
            symbols = {
                status = {
                    icons = {
                        enabled = " ",
                        sleep = " ", -- auto-trigger disabled
                        disabled = " ",
                        warning = " ",
                        unknown = " ",
                    },
                },
            },
            show_colors = true,
            show_loading = true,
        }

        local auto_format_indicator = {
            function()
                if vim.g.vin_autoformat_enabled then
                    return "󰉶 On"
                else
                    return "󰉶 Off"
                end
            end,
        }

        return {
            options = {
                theme = "black_atom_core",
                globalstatus = true,
                section_separators = { left = "", right = "" },
                component_separators = { left = "", right = "" },
                disabled_filetypes = {
                    statusline = { "dashboard", "alpha", "lazy" },
                    winbar = { "", "dashboard", "alpha", "edgy", "lazy", "neo-tree" },
                },
            },

            sections = {
                lualine_a = {
                    mode,
                },
                lualine_b = {
                    project_name,
                    "fancy_branch",
                    "fancy_location",
                    "francy_diff",
                },
                lualine_c = {
                    "fancy_diagnostics",
                },
                lualine_x = {
                    "fancy_searchcount",
                },
                lualine_y = {
                    wtf.get_status,
                    copilot,
                    auto_format_indicator,
                    lazy_updates,
                },
                lualine_z = {
                    "fancy_filetype",
                },
            },
            extensions = { "lazy" },
        }
    end,
}

return M.spec
