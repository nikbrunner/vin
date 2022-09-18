local present, ccc = pcall(require, "ccc")
if not present then
    return
end

local mapping = ccc.mapping

ccc.setup({
    default_color = "#000000",

    bar_char = "■",

    point_char = "◇",

    bar_len = 30,

    win_opts = {
        relative = "cursor",
        row = 1,
        col = 1,
        style = "minimal",
        border = "rounded",
    },

    preserve = false,

    save_on_quit = false,

    inputs = {
        ccc.inputs.hsl,
        ccc.inputs.rbg,
    },

    outputs = {
        ccc.outputs.hex,
        ccc.outputs.hex_short,
        ccc.outputs.css_rgb,
        ccc.outputs.css_hsl,
    },

    pickers = {
        ccc.pickers.hex,
        ccc.pickers.hex_short,
        ccc.pickers.css_rgb,
        ccc.pickers.css_hsl,
    },
})
