---@type LazyPluginSpec
return {
    "nanozuki/tabby.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VimEnter",
    config = function()
        require("tabby.tabline").use_preset("active_wins_at_tail", {
            nerdfont = true, -- whether use nerdfont
            lualine_theme = "terra", -- lualine theme name
            buf_name = {
                mode = "relative",
            },
        })
    end,
}
