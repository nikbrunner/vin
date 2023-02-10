---@type LazySpec
local spec = {
    "terra-theme/nvim",

    -- NOTE: Unfort. dev only looks for the repo name like `nvim` and not `terra-theme/nvim`, which requires adjustment in the LazyConfig `dev.path`
    -- I wish the `dev.path` would be configurable on the LazySpec, but it is not.
    -- Alternatively, I could just use a different `dir` for a specific local path, instead of using the `dev` property
    dev = true,
    lazy = false,
    priority = 1000,

    ---@type TerraConfig
    opts = {
        season = "winter",
    },

    config = function(_, opts)
        local terra = require("terra")
        terra.setup(opts)
    end,
}

return spec
