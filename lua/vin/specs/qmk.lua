local M = {}

---@type LazyPluginSpec
M.spec = {
    "codethread/qmk.nvim",
    ft = "c",
    event = "VeryLazy",
    opts = {
        comment_preview = {
            position = "inside",
            keymap_overrides = {
                KC_TRANSPARENT = " ",
                ["SS_TILD_SLSH"] = "~/",
                ["SS_FATARROW"] = "=>",
            },
        },
    },
    config = function(_, sharedOpts)
        local setup = function(opts)
            local mergedOpts = vim.tbl_deep_extend("force", sharedOpts, opts or {})
            require("qmk").setup(mergedOpts)
        end

        local group = vim.api.nvim_create_augroup("qmk-auto-format-group", {})

        vim.api.nvim_create_autocmd("BufEnter", {
            desc = "Format CRKBD koyo keymap",
            group = group,
            pattern = "*nikbrunner/qmk_firmware/keyboards/crkbd/keymaps/koyo/keymap.c",
            callback = function()
                setup({
                    name = "LAYOUT_split_3x5_3",
                    layout = {
                        "x x x x x _ x x x x x",
                        "x x x x x _ x x x x x",
                        "x x x x x _ x x x x x",
                        "_ _ x x x _ x x x _ _",
                    },
                })
            end,
        })

        vim.api.nvim_create_autocmd("BufEnter", {
            desc = "Format Moonlander koyo keymap",
            group = group,
            pattern = "*nikbrunner/koyo-oryx-qmk/EM5en/keymap.c",
            callback = function()
                setup({
                    name = "LAYOUT_moonlander",
                    layout = {
                        "x x x x x x x _ x x x x x x x",
                        "x x x x x x x _ x x x x x x x",
                        "x x x x x x x _ x x x x x x x",
                        "x x x x x x _ _ _ x x x x x x",
                        "x x x x x x _ _ _ x x x x x x",
                        "_ _ _ _ x x x _ x x x _ _ _ _",
                    },
                })
            end,
        })
    end,
}

return M.spec
