local M = {}

---@type LazyPluginSpec
M.spec = {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        statuscolumn = { enabled = true },
        debug = { enabled = true },
        notifier = { enabled = true },
        toggle = { enabled = true },
        gitbrowse = { enabled = true },
        zen = { enabled = true },
        scroll = { enabled = false },

        ---@type snacks.words.Config
        words = { debounce = 100 },

        ---@type snacks.dashboard.Config
        dashboard = {
            preset = {
                -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
                ---@type fun(cmd:string, opts:table)|nil
                pick = nil,
                -- Used by the `keys` section to show keymaps.
                -- Set your curstom keymaps here.
                -- When using a function, the `items` argument are the default keymaps.
                ---@type snacks.dashboard.Item[]
                keys = {
                    {
                        icon = "󰋚 ",
                        key = "<CR>",
                        desc = "Recent Filse",
                        action = ":lua require('fzf-lua').oldfiles({ cwd_only = true, prompt = 'Recent Files (CWD): '})",
                    },
                    { icon = " ", key = "<S-CR>", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                    { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                    { icon = " ", key = "f", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                    { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                    {
                        icon = " ",
                        key = "c",
                        desc = "Config",
                        action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
                    },
                    { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                    { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
                header = [[
                  ┓        •                                  
                ┏┓┣┓┏┓ ┏┓┓┏┓┏┳┓                               
                ┛┗┗┛┛ •┛┗┗┛┗┛┗┗                               
                ]],
            },

            sections = {
                { section = "header" },
                { section = "keys", gap = 1, padding = 1 },
                { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
                { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
                {
                    pane = 2,
                    icon = " ",
                    title = "Git Status",
                    section = "terminal",
                    enabled = vim.fn.isdirectory(".git") == 1,
                    cmd = "hub status --short --branch --renames",
                    height = 5,
                    padding = 1,
                    ttl = 5 * 60,
                    indent = 3,
                },
                { section = "startup" },
            },
        },

        terminal = {
            win = {
                border = "solid",
            },
        },

        lazygit = {
            configure = true,
            win = {
                border = "solid",
            },
        },

        styles = {
            notification_history = {
                border = "solid",
                wo = { winhighlight = "Normal:NormalFloat" },
            },
            notification = {
                border = "single",
            },
            zen = {
                width = 0.65,
                keys = {
                    q = function(self)
                        self:close()
                    end,
                    -- d = function(self)
                    --     require("snacks").toggle.dim()
                    -- end,
                },
            },
        },
    },

    init = function()
        local Snacks = require("snacks")

        vim.api.nvim_create_autocmd("User", {
            pattern = "VeryLazy",
            callback = function()
                -- stylua: ignore start
                Snacks.toggle.dim():map("<leader>ad")
                Snacks.toggle.diagnostics():map("<leader>ud")
                Snacks.toggle.line_number():map("<leader>ul")
                Snacks.toggle.inlay_hints():map("<leader>uh")
                Snacks.toggle.treesitter():map("<leader>uT")
                Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
                Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
                Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
                Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
                Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
                -- stylua: ignore end
            end,
        })
    end,

    keys = function()
        local Snacks = require("snacks")

        return {
        -- stylua: ignore start
            { "<C-/>",               function() Snacks.terminal() end, desc = "Toggle Terminal" },
            { "]]",                  function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference" },
            { "[[",                  function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference" },
            { "<leader>wh",          function() Snacks.lazygit() end, desc = "[H]istory" },
            { "<leader>gb",          function() Snacks.git.blame_line() end, desc = "[B]lame" },
            { "<leader>gR",          function() Snacks.gitbrowse() end, desc = "[R]emote" },
            { "<leader>gf",          function() Snacks.lazygit.log_file() end, desc = "[F]ile" },
            { "<leader>gl",          function() Snacks.lazygit.log() end, desc = "[L]og" },
            { "<leader>af",          function() Snacks.zen.zen() end, desc = "[F]ocus Mode" },
            { "<leader>az",          function() Snacks.zen.zoom() end, desc = "[Z]oom Mode" },
            { "<leader>an",          function() Snacks.notifier.show_history() end, desc = "[N]otifications" },
            {
                "<leader>aN",
                desc = "[N]ews",
                function()
                    Snacks.win({
                        file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
                        width = 0.6,
                        height = 0.6,
                        wo = {
                            border = "solid",
                            spell = false,
                            wrap = false,
                            signcolumn = "yes",
                            statuscolumn = " ",
                            conceallevel = 3,
                        },
                    })
                end,
            },
        }
        -- stylua: ignore end
    end,
}

return M.spec
