local M = {}

---@type LazyPluginSpec
M.spec = {
    "nikbrunner/arrow.nvim",
    dev = true,
    dependencies = {
        "WolfeCub/harpeek.nvim",
        keys = {
            {
                "<leader>mp",
                function()
                    require("harpeek").toggle()
                end,
            },
        },
        config = function()
            require("harpeek").setup()
        end,
    },
    event = { "VeryLazy" },
    keys = {
        {
            "<C-s>",
            function()
                require("arrow.persist").toggle()
                local state = require("arrow.statusline").in_on_arrow_file()
                if state then
                    vim.notify("Arrow: Marked File", vim.log.levels.INFO, { title = "Arrow" })
                else
                    vim.notify("Arrow: Unmarked File", vim.log.levels.INFO, { title = "Arrow" })
                end
            end,
            desc = "Mark File",
        },
        {
            "H",
            function()
                require("arrow.persist").previous()
            end,
            desc = "Previous Marked File",
        },
        {
            "L",
            function()
                require("arrow.persist").next()
            end,
            desc = "Next Marked File",
        },
    },
    opts = {
        leader_key = "<leader>mm",
        show_icons = true,
        always_show_path = true,
        separate_by_branch = true,
        mappings = {
            edit = "e",
            delete_mode = "d",
            clear_all_items = "C",
            toggle = "a",
            open_vertical = "v",
            open_horizontal = "s",
            quit = "q",
        },
        window = {
            border = "solid",
        },
    },
}

return M.spec
