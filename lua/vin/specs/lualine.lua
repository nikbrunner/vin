local M = {}

---@type LazySpec
M.spec = {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "meuter/lualine-so-fancy.nvim",
        "piersolenski/wtf.nvim",
    },
    event = "VeryLazy",
    opts = function()
        local wtf = require("wtf")

        local fnamemodify = vim.fn.fnamemodify

        local mode = {
            function()
                return " Vin"
            end,
            padding = 4,
        }

        local filetype_icon = {
            "filetype",
            ts_icon = "",
            colored = true, -- Displays filetype icon in color if set to true
            icon_only = true, -- Display only an icon for filetype
            padding = 2,
        }

        local filename = {
            "filename",
            file_status = true, -- Displays file status (readonly status, modified status)
            newfile_status = true, -- Display new file status (new file means no write after created)
            path = 1, -- 0: Just the filename
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

        local dap_status = {
            function()
                return "  " .. require("dap").status()
            end,
            cond = function()
                return package.loaded["dap"] and require("dap").status() ~= ""
            end,
        }

        local noice_status = {
            function()
                ---@diagnostic disable-next-line: undefined-field
                return require("noice").api.status.mode.get()
            end,
            cond = function()
                ---@diagnostic disable-next-line: undefined-field
                return package.loaded["noice"] and require("noice").api.status.mode.has()
            end,
        }

        return {
            options = {
                theme = "terra",
                globalstatus = true,
                section_separators = { left = "", right = "" },
                component_separators = { left = "", right = "" },
                disabled_filetypes = {
                    statusline = { "dashboard", "alpha", "lazy" },
                    winbar = { "", "dashboard", "alpha", "edgy", "lazy", "neo-tree" },
                },
            },

            winbar = {
                lualine_a = {},
                lualine_b = { filetype_icon },
                lualine_c = { filename },
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
            inactive_winbar = {
                lualine_a = {},
                lualine_b = { filetype_icon },
                lualine_c = { filename },
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },

            sections = {
                lualine_a = {
                    mode,
                },
                lualine_b = {
                    project_name,
                    "fancy_branch",
                    "francy_diff",
                    "tabs",
                },
                lualine_c = {
                    "diagnostics",
                },
                lualine_x = {
                    noice_status,
                    { "fancy_diagnostics" },
                    { "fancy_searchcount" },
                },
                lualine_y = {
                    wtf.get_status,
                    dap_status,
                    lazy_startup,
                    lazy_plug_count,
                    lazy_updates,
                },
                lualine_z = {},
            },
            extensions = { "neo-tree", "lazy" },
        }
    end,
}

return M.spec
