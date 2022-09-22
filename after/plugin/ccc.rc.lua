local present, ccc = pcall(require, "ccc")
if not present then
    return
end

local mapping = ccc.mapping

ccc.setup({
    default_color = "#000000",

    bar_char = "■",

    point_char = "◇",

    highlighter = {
        auto_enable = true,
    },

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

    input = {
        ccc.input.hsl,
        ccc.input.rbg,
    },

    output = {
        ccc.output.hex,
        ccc.output.hex_short,
        ccc.output.css_rgb,
        ccc.output.css_hsl,
    },

    picker = {
        ccc.picker.hex,
        ccc.picker.hex_short,
        ccc.picker.css_rgb,
        ccc.picker.css_hsl,
    },
})
