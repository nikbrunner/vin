local M = {}

---@type LazyPluginSpec
M.spec = {
    "hoob3rt/lualine.nvim",
    dependencies = {
        "meuter/lualine-so-fancy.nvim",
        "piersolenski/wtf.nvim",
    },
    event = "VeryLazy",
    opts = function()
        local lazy_stats = require("lazy").stats()
        local lazy_status = require("lazy.status")

        local hide_in_width = function()
            return vim.fn.winwidth(0) > 120
        end

        return {
            options = {
                icons_enabled = true,
                theme = "auto",
                component_separators = { left = "|", right = "|" },
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
                    {
                        "fancy_mode",
                        padding = 2,
                        width = 1,
                    },
                },
                lualine_b = {
                    { "fancy_cwd", substitute_home = true, padding = 2 },
                },
                lualine_c = {
                    {
                        "fancy_branch",
                        icon = "",
                        padding = 3,
                    },
                    {
                        "fancy_diff",
                        symbols = { added = " ", modified = " ", removed = " " },
                    },
                    {
                        "fancy_diagnostics",
                        sources = { "nvim_diagnostic" },
                        symbols = { error = " ", warn = " ", info = " ", hint = " " },
                    },
                },
                lualine_x = {
                    {
                        function()
                            if vim.g.vin_autoformat_enabled then
                                return "󰉶 On"
                            else
                                return "󰉶 Off"
                            end
                        end,
                        cond = hide_in_width,
                    },
                    "fancy_macro",
                    "fancy_searchcount",
                },
                lualine_y = {
                    {
                        function()
                            return require("wtf").get_status()
                        end,
                    },
                    {
                        "fancy_filetype",
                        ts_icon = "",
                        padding = 2,
                        cond = hide_in_width,
                    },
                    { "fancy_lsp_servers" },
                },
                lualine_z = {
                    {
                        function()
                            return vim.g.colors_name or "default"
                        end,
                        cond = hide_in_width,
                    },
                    {
                        lazy_status.updates,
                        cond = lazy_status.has_updates and hide_in_width,
                    },
                    {
                        function()
                            return "󰑓 " .. lazy_stats.loaded .. "  " .. lazy_stats.count
                        end,
                        cond = hide_in_width,
                    },
                    {
                        function()
                            local ms = (math.floor(lazy_stats.startuptime * 100 + 0.5) / 100)
                            return " " .. ms .. "ms"
                        end,
                        cond = hide_in_width,
                    },
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
        }
    end,
    config = function(_, opts)
        require("lualine").setup(opts)
    end,
}

return M.spec
