---@diagnostic disable: missing-fields
local M = {}

---@type LazyPluginSpec
M.spec = {
    "MagicDuck/grug-far.nvim",
    ---@type GrugFarOptions
    ---@diagnostic disable-next-line: missing-fields
    opts = {
        windowCreationCommand = "topleft vsplit 30",
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
            desc = "[T]ext (Workspace)",
        },
    },
}

return M.spec
