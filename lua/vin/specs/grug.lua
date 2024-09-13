---@diagnostic disable: missing-fields
local M = {}

---@type LazyPluginSpec
M.spec = {
    "MagicDuck/grug-far.nvim",
    ---@type GrugFarOptions
    ---@diagnostic disable-next-line: missing-fields
    opts = {
        windowCreationCommand = "topleft vsplit",
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
            desc = "Find",
        },
        {
            "<leader>F",
            mode = { "n", "x" },
            function()
                require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } })
            end,
            desc = "Search & [R]eplace (Workspace)",
        },
    },
}

return M.spec
