---@type LazyPluginSpec
return {
    "sphamba/smear-cursor.nvim",
    lazy = false,
    opts = {
        stiffness = 0.8,
        trailing_stiffness = 0.5,
        trailing_exponent = 0.25,
        distance_stop_animating = 0.25,
        hide_target_hack = false,
    },
}
