local M = {}

---@type LazyPluginSpec
M.spec = {
    "hoob3rt/lualine.nvim",
    dependencies = {
        "meuter/lualine-so-fancy.nvim",
        "piersolenski/wtf.nvim",
    },
    event = "VeryLazy",
    config = function()
        local colors = require("black-atom.api").get_colors()

        local fg = {
            light = colors.semantics.fg.primary.light,
            main = colors.semantics.fg.primary.main,
            dark = colors.semantics.fg.primary.dark,
        }

        local bg = {
            light = colors.semantics.bg.primary.light,
            main = colors.semantics.bg.primary.main,
            dark = colors.semantics.bg.primary.dark,
        }

        local modecolor = {
            n = colors.palette.red,
            i = colors.palette.cyan,
            v = colors.palette.magenta,
            [""] = colors.palette.magenta,
            V = colors.palette.red,
            c = colors.palette.yellow,
            no = colors.palette.red,
            s = colors.palette.yellow,
            S = colors.palette.yellow,
            [""] = colors.palette.yellow,
            ic = colors.palette.yellow,
            R = colors.palette.green,
            Rv = colors.palette.magenta,
            cv = colors.palette.red,
            ce = colors.palette.red,
            r = colors.palette.cyan,
            rm = colors.palette.cyan,
            ["r?"] = colors.palette.cyan,
            ["!"] = colors.palette.dark_red,
            t = colors.palette.red,
        }

        local space = {
            function()
                return " "
            end,
            color = { bg = bg.main, fg = colors.palette.blue },
        }

        local modes = {
            "mode",
            color = function()
                local mode_color = modecolor
                return { bg = mode_color[vim.fn.mode()], fg = bg.dark, gui = "bold" }
            end,
            separator = { left = "", right = "" },
        }

        local filename = {
            "filename",
            file_status = true, -- Displays file status (readonly status, modified status)
            newfile_status = true, -- Display new file status (new file means no write after created)
            path = 1, -- 0: Just the filename
            color = { bg = colors.palette.blue, fg = bg.main, gui = "bold" },
            separator = { left = "", right = "" },
        }

        local filetype = {
            "filetype",
            icons_enabled = false,
            color = { bg = bg.light, fg = colors.semantics.fg.primary.main, gui = "italic,bold" },
            separator = { left = "", right = "" },
        }

        local branch = {
            "fancy_branch",
            icon = "",
            color = { bg = colors.palette.green, fg = bg.main, gui = "bold" },
            separator = { left = "", right = "" },
        }

        local diff = {
            "fancy_diff",
            color = { bg = bg.light, fg = fg.main, gui = "bold" },
            separator = { left = "", right = "" },
            symbols = { added = " ", modified = " ", removed = " " },

            diff_color = {
                added = { fg = colors.palette.green },
                modified = { fg = colors.palette.yellow },
                removed = { fg = colors.palette.red },
            },
        }

        local diagnostics = {
            "fancy_diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
            diagnostics_color = {
                error = { fg = colors.palette.red },
                warn = { fg = colors.palette.yellow },
                info = { fg = colors.palette.magenta },
                hint = { fg = colors.palette.cyan },
            },
            color = { bg = colors.semantics.bg.active, fg = colors.semantics.fg.invert, gui = "bold" },
            separator = { left = "", right = "" },
        }

        local lsp = {
            "fancy_lsp_servers",
            separator = { left = "", right = "" },
            color = { bg = colors.palette.magenta, fg = bg.main, gui = "italic,bold" },
        }

        ---@diagnostic disable-next-line: unused-local
        local last_commit_message = {
            function()
                local message = vim.fn.systemlist("git log -1 --pretty=%s")[1]
                if message == nil then
                    return ""
                end
                return message
            end,
            color = { bg = bg.light, fg = fg.main, gui = "italic,bold" },
            separator = { left = "", right = "" },
        }

        ---@diagnostic disable-next-line: unused-local
        local git_clean = {
            function()
                if vim.fn.system("git status -s") == "" then
                    return "✔"
                else
                    return "✘"
                end
            end,
            color = { bg = bg.light, fg = fg.main, gui = "italic,bold" },
            separator = { left = "", right = "" },
        }

        local lazy_plug_count = {
            function()
                local stats = require("lazy").stats()
                return " " .. stats.count
            end,
            separator = { left = "", right = "" },
            color = { bg = colors.palette.dark_yellow, fg = colors.semantics.fg.invert, gui = "bold" },
        }

        local lazy_startup = {
            function()
                local stats = require("lazy").stats()
                local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                return " " .. ms .. "ms"
            end,
            separator = { left = "", right = "" },
            color = { bg = bg.light, fg = fg.main },
        }

        local lazy_plug_updates = {
            require("lazy.status").updates,
            padding = 1,
            separator = { left = "", right = "" },
            color = { bg = bg.light, fg = fg.dark },
        }

        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = "black_atom",
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                disabled_filetypes = {
                    statusline = { "" },
                    winbar = { "" },
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = true,
            },

            sections = {
                lualine_a = {
                    modes,
                },
                lualine_b = {
                    space,
                    branch,
                    space,
                },
                lualine_c = {
                    filetype,
                    filename,
                    diff,
                    diagnostics,
                    space,
                },
                lualine_x = {
                    space,
                },
                lualine_y = { lsp },
                lualine_z = {
                    space,
                    lazy_plug_count,
                    lazy_plug_updates,
                    lazy_startup,
                },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
        })
    end,
}

return M.spec
