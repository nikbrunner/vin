---@type LazyPluginSpec
return {
    "mistweaverco/kulala.nvim",
    pin = true,
    ft = "http",
    ---@doc: [Setup Options | Kulala.nvim](https://kulala.mwco.app/docs/getting-started/setup-options/)
    opts = {
        winbar = true,
    },
    keys = function()
        local kulala = require("kulala")

        return {
            { "[h", kulala.jump_prev, desc = "Previous request" },
            { "]h", kulala.jump_next, desc = "Next request" },
            { "<leader>hh", kulala.run, desc = "Run request" },
            { "<leader>h.", kulala.replay, desc = "Re-Run request" },
            { "<leader>he", kulala.set_selected_env, desc = "Select env" },
            { "<leader>hs", kulala.search, desc = "Search" },
            { "<leader>hc", kulala.copy, desc = "Copy request" },
        }
    end,
}
