---@type LazySpec
local spec = {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    dependencies = {
        {
            "ggandor/flit.nvim",
            opts = {
                labeled_modes = "nv",
            },
        },
    },
    enabled = true,
    config = function(_, opts)
        local leap = require("leap")
        leap.setup(opts)
        leap.add_default_mappings(true)
    end,
}

return spec
