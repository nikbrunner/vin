local M = {}

---@type LazyPluginSpec
M.spec = {
    "nikbrunner/fff.nvim",
    dependencies = { "ibhagwan/fzf-lua" },
    dev = true,
    ---@module "fff"
    ---@type fff.Config
    opts = {
        change_dir = true,
        paths = {
            static = {
                ["~/.scripts"] = vim.fn.expand("$HOME") .. "/.scripts",
            },
            dynamic = {
                {
                    path = vim.fn.expand("~/repos"),
                    scan_depth = 2,
                    use_git = true,
                },
                {
                    path = vim.fn.expand("$XDG_CONFIG_HOME"),
                    scan_depth = 1,
                },
            },
        },
    },
    keys = {
        {
            "<leader>f",
            function()
                require("fff").find()
            end,
            desc = "FFF",
        },
    },
}

return M.spec
