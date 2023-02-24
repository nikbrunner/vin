---@type LazySpec
local spec = {
    "ellisonleao/glow.nvim",
    cmd = "Glow",
    opts = {
        -- NOTE: Special Installation until not broken: [Not working on macOS · Issue #113 · ellisonleao/glow.nvim](https://github.com/ellisonleao/glow.nvim/issues/113)
        glow_path = "/opt/homebrew/bin/glow@1.4.1", -- will be filled automatically with your glow bin in $PATH, if any
        install_path = "~/.local/bin", -- default path for installing glow binary
        border = "shadow", -- floating window border config
        style = "dark", -- filled automatically with your current editor background, you can override using glow json style
        pager = false,
        width = 80,
        height = 100,
        width_ratio = 0.7, -- maximum width of the Glow window compared to the nvim window size (overrides `width`)
        height_ratio = 0.7,
    },
    config = function(_, opts)
        require("glow").setup(opts)
    end,
}

return spec
