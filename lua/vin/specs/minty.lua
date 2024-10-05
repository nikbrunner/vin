---@type LazyPluginSpec
return {
    "nvchad/minty",
    dependencies = { "nvchad/volt" },
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
