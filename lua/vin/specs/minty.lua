---@type LazyPluginSpec
return {
    "nvchad/minty",
    dependencies = { "nvchad/volt" },
    opts = {
        huefy = {

            mappings = function(bufs) -- bufs is a table cuz 2 bufs!
                -- local api = require("minty.shades.api")
                -- vim.keymap.set("n", "s", api.save_color, { buffer = buf })
            end,
        },

        shades = {
            mappings = function(buf)
                local api = require("minty.shades.api")
                vim.keymap.set("n", "<C-s>", api.save_color, { buffer = buf })
            end,
        },
    },
    keys = {
        {
            "<leader>cph",
            function()
                require("minty.huefy").open()
            end,
            desc = "[H]ue Picker",
        },
        {
            "<leader>cps",
            function()
                require("minty.shades").open()
            end,
            desc = "[S]hade Picker",
        },
    },
}
