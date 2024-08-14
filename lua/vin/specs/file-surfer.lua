local M = {}

---@type LazyPluginSpec
M.spec = {
    "nikbrunner/file-surfer.nvim",
    dir = require("vin.config").pathes.repos .. "/nikbrunner/file-surfer.nvim",
    pin = true,
    dependencies = { "ibhagwan/fzf-lua" },
    event = "VeryLazy",
    ---@module "file-surfer"
    ---@type file-surfer.Config
    opts = {
        change_dir = true,
        tmux = {
            enable = true,
            default_mappings = true,
        },
        paths = {
            static = {
                ["~/.scripts"] = vim.fn.expand("$HOME") .. "/.scripts",
                ["dcd-rest"] = vim.fn.expand("$HOME") .. "/repos/nikbrunner/dcd-notes/http",
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
            "<leader>p",
            function()
                require("file-surfer").find()
            end,
            desc = "Projects",
        },
    },
}

return M.spec
