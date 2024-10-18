---@diagnostic disable: missing-fields
local M = {}

---@type LazyPluginSpec
M.spec = {
    "MagicDuck/grug-far.nvim",
    ---@type GrugFarOptions
    ---@diagnostic disable-next-line: missing-fields
    opts = {
        windowCreationCommand = "topleft vsplit | vertical resize 100",
        engines = {
            ripgrep = {
                placeholders = {
                    search = "ex: foo    foo([a-z0-9]*)    fun\\(",
                    replacement = "ex: bar    ${1}_foo    $$MY_ENV_VAR ",
                    filesFilter = "ex: *.lua     *.{css,js}    **/docs/*.md",
                    flags = "ex: --help, Ignore Case (-i), Match Whole World (-w), --replace= (empty replace) --multiline (-U)",
                    paths = "ex: /foo/bar   ../   ./hello\\ world/   ./src/foo.lua",
                },
            },
        },
    },
    keys = {
        {
            "<leader>f",
            mode = { "n", "x" },
            function()
                require("grug-far").open()
            end,
            desc = "Find " .. require("vin.icons").git.project,
        },
        {
            "<leader>cr",
            mode = { "n", "x" },
            function()
                require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } })
            end,
            desc = "[R]eplace",
        },
        {
            "<leader>st",
            mode = { "n", "x" },
            function()
                require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } })
            end,
            desc = "[T]ext (File)",
        },
        {
            "<leader>sT",
            mode = { "n", "x" },
            function()
                require("grug-far").open()
            end,
            desc = "[T]ext " .. require("vin.icons").git.project,
        },
    },
}

return M.spec
