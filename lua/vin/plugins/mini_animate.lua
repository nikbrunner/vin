---@type LazySpec
local spec = {
    "echasnovski/mini.animate",
    version = "*",
    enabled = false,
    opts = {
        cursor = {
            enable = false,
        },

        -- Vertical scroll
        scroll = {
            enable = true,
        },

        -- Window resize
        resize = {
            -- Whether to enable this animation
            enable = false,
        },

        -- Window open
        open = {
            enable = false,
        },

        -- Window close
        close = {
            enable = false,
        },
    },
    config = function(_, opts)
        require("mini.animate").setup(opts)
    end,
}

return spec
