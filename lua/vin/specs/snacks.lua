---@type LazyPluginSpec
return {
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
            ["notification.history"] = {
                border = "solid",
                wo = { winhighlight = "Normal:NormalFloat" },
            },
        },
    },
    keys = function()
        local Snacks = require("snacks")

        return {
        -- stylua: ignore start
            { "<C-/>",               function() Snacks.terminal() end, desc = "Toggle Terminal" },
            { "]]",                  function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference" },
            { "[[",                  function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference" },
            { "<leader>un",          function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
            { "<leader>vn",          function() Snacks.notifier.show_history() end, desc = "Notification History" },
            { "<leader>gg",          function() Snacks.lazygit() end, desc = "Lazygit" },
            { "<leader>gb",          function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
            { "<leader>gB",          function() Snacks.gitbrowse() end, desc = "Git Browse" },
            { "<leader>gf",          function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
            { "<leader>gl",          function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)" },
            {
                "<leader>N",
                desc = "Neovim News",
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
    init = function()
        local Snacks = require("snacks")

        vim.api.nvim_create_autocmd("User", {
            pattern = "VeryLazy",
            callback = function()
                -- stylua: ignore start
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
}
