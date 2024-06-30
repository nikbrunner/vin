local M = {}

---@type LazyPluginSpec[]
M.specs = {
    {
        "echasnovski/mini.surround",
        version = "*",
        event = "VeryLazy",
        opts = {
            mappings = {
                add = "Sa", -- Add surrounding in Normal and Visual modes
                delete = "Sd", -- Delete surrounding
                find = "Sf", -- Find surrounding (to the right)
                find_left = "SF", -- Find surrounding (to the left)
                highlight = "Sh", -- Highlight surrounding
                replace = "Sr", -- Replace surrounding
                update_n_lines = "Sn", -- Update `n_lines`
            },
        },
    },

    {
        "echasnovski/mini.notify",
        version = "*",
        lazy = false,
        enabled = true,
        keys = {
            {
                "<leader>vn",
                function()
                    require("mini.notify").show_history()
                end,
                desc = "[N]otifications History",
            },
        },
        opts = {
            lsp_progress = {
                -- oh god please stop annoying me
                enable = false,
            },

            window = {
                -- https://github.com/echasnovski/mini.nvim/blob/a118a964c94543c06d8b1f2f7542535dd2e19d36/doc/mini-notify.txt#L186-L198
                config = {
                    anchor = "SE",
                    col = vim.o.columns,
                    row = vim.o.lines - 2,
                    width = math.floor(vim.o.columns * 0.5),
                    border = "solid",
                },
                winblend = 10,
            },
        },
        config = function(_, opts)
            require("mini.notify").setup(opts)

            -- Wrap all vim.notify calls with mini.notify
            vim.notify = require("mini.notify").make_notify()
        end,
    },

    {
        "echasnovski/mini.statusline",
        event = "VeryLazy",
        enabled = true,
        opts = function()
            return {
                content = {
                    active = function()
                        local m = require("mini.statusline")

                        local fnamemodify = vim.fn.fnamemodify

                        local project_name = function()
                            local current_project_folder = fnamemodify(vim.fn.getcwd(), ":t")
                            local parent_project_folder = fnamemodify(vim.fn.getcwd(), ":h:t")
                            return parent_project_folder .. "/" .. current_project_folder
                        end

                        local lazy_plug_count = function()
                            local stats = require("lazy").stats()
                            return " " .. stats.count
                        end

                        local lazy_startup = function()
                            local stats = require("lazy").stats()
                            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                            return " " .. ms .. "ms"
                        end

                        local lazy_updates = function()
                            return require("lazy.status").updates()
                        end

                        local wtf = function()
                            return require("wtf").get_status()
                        end

                        local auto_format_indicator = function()
                            if vim.g.vin_autoformat_enabled then
                                return "󰉶 On"
                            else
                                return "󰉶 Off"
                            end
                        end

                        local mode, mode_hl = m.section_mode({ trunc_width = 120 })

                        local spell = vim.wo.spell and (m.is_truncated(120) and "S" or "SPELL") or ""
                        local wrap = vim.wo.wrap and (m.is_truncated(120) and "W" or "WRAP") or ""
                        local git = m.section_git({ trunc_width = 75 })
                        local diagnostics = m.section_diagnostics({ trunc_width = 75 })
                        local searchcount = m.section_searchcount({ trunc_width = 75 })
                        local location = m.section_location({ trunc_width = 120 })
                        local fileinfo = m.section_fileinfo({ trunc_width = 125 })
                        local filename = m.section_filename({ trunc_width = 140 })
                        local colorscheme_name = vim.g.colors_name or "default"
                        local colorscheme = m.is_truncated(200) and "" or " " .. colorscheme_name

                        return m.combine_groups({
                            { hl = mode_hl, strings = { mode } },
                            {
                                hl = "Function",
                                strings = (m.is_truncated(250) and { git } or { project_name(), git }),
                            },

                            "%<", -- Mark general truncate point

                            { hl = "Comment", strings = { location } },
                            { hl = "DiagnosticError", strings = { diagnostics } },

                            "%=", -- End left alignment

                            { hl = "Comment", strings = { searchcount } },
                            {
                                hl = "Comment",
                                strings = (m.is_truncated(120) and {} or {
                                    wtf(),
                                    wrap,
                                    spell,
                                    auto_format_indicator(),
                                    lazy_plug_count(),
                                    lazy_updates(),
                                    lazy_startup(),
                                    colorscheme,
                                }),
                            },
                            { hl = mode_hl, strings = { fileinfo } },
                        })
                    end,
                },
            }
        end,
        config = function(_, opts)
            require("mini.statusline").setup(opts)
            vim.opt.laststatus = 3
        end,
    },
}

return M.specs
