---@type LazyPluginSpec
return {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {},
    keys = function()
        local ps = require("persistence")

        return {
            { "<leader>SS", ps.select, desc = "Select session" },
            { "<leader>Sl", ps.load, desc = "Load session" },
            {
                "<leader>Sr",
                function()
                    ps.load({ last = true })
                end,
                desc = "Restore session",
            },
        }
    end,
}
