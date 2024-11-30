local M = {}

---@type LazyPluginSpec
M.spec = {
    "svermeulen/text-to-colorscheme.nvim",
    lazy = false,
    opts = {
        ai = {
            openai_api_key = os.getenv("OPENAI_API_KEY"),
            gpt_model = "gpt-4o",
        },
        disable_builtin_schemes = false,
        overrides = {
            FoldColumn = {
                link = "Normal",
            },
            SignColumn = {
                link = "Normal",
            },
        },
        default_palette = "patagonia",
        hex_palettes = {
            {
                name = "patagonia",
                background_mode = "dark",
                background = "#1a1f24",
                foreground = "#d0d6db",
                accents = {
                    "#5a9ea6",
                    "#6ca26c",
                    "#c4a484",
                    "#a6b8d4",
                    "#d4a6a6",
                    "#8db4a7",
                    "#d4c4a6",
                },
            },
        },
    },
    keys = {
        { "<leader>ug", ":T2CGenerate ", desc = "Generate a colorschme" },
        { "<leader>uG", "<CMD>T2CSave<CR>", desc = "Save a generated colorscheme" },
        { "<f8>", ":T2CShuffleAccents<cr>", desc = "Shuffle accents" },
        { "<f9>", ":T2CAddContrast -0.1<cr>", desc = "Decrease contrast" },
        { "<f10>", ":T2CAddContrast 0.1<cr>", desc = "Increase contrast" },
        { "<f11>", ":T2CAddSaturation -0.1<cr>", desc = "Decrease saturation" },
        { "<f12>", ":T2CAddSaturation 0.1<cr>", desc = "Increase saturation" },
    },
}

return M.spec
