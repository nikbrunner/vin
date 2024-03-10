local M = {}

---@type LazyPluginSpec
M.spec = {
    "nanozuki/tabby.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VimEnter",
    config = function()
        require("tabby.tabline").use_preset("active_wins_at_tail", {
            nerdfont = true,
            lualine_theme = require("vin.config").lualine_theme,
            buf_name = {
                mode = "relative",
            },
        })
    end,
}

return M.spec
