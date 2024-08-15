---@type LazyPluginSpec
return {
    "mistweaverco/kulala.nvim",
    ft = "http",
    ---@doc: [Setup Options | Kulala.nvim](https://kulala.mwco.app/docs/getting-started/setup-options/)
    opts = {
        winbar = true,
    },
    keys = function()
        local kulala = require("kulala")

        return {
            { "[r", kulala.jump_prev, desc = "Previous request" },
            { "<leader>hh", kulala.run, desc = "Run request" },
            { "<leader>hs", kulala.search, desc = "Run request" },
            { "]r", kulala.jump_next, desc = "Next request" },
        }
    end,
}
