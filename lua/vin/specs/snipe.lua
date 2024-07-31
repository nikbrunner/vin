local M = {}

---@type LazyPluginSpec
M.spec = {
    "leath-dub/snipe.nvim",
    event = "BufRead",
    opts = {
        ui = {
            position = "center",
        },
    },
    keys = {
        {
            "<C-e>",
            function()
                require("snipe").create_buffer_menu_toggler()()
            end,
            desc = "Snipe",
        },
    },
    config = function(_, opts)
        require("snipe").setup(opts)
    end,
}

return M.spec
