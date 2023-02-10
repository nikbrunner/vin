---@type LazySpec
local spec = {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    enabled = false,
    opts = {
        options = {
            diagnostics = "nvim_lsp",
            always_show_bufferline = false,
            show_tab_indicators = false,
            separator_style = "slant",
            diagnostics_indicator = function(_, _, diag)
                local icons = Vin.icons.diagnostics
                local ret = (diag.error and icons.Error .. diag.error .. " " or "")
                    .. (diag.warning and icons.Warning .. diag.warning or "")
                return vim.trim(ret)
            end,
            offsets = {
                {
                    filetype = "neo-tree",
                    text = "File Explorer",
                    highlight = "NeoTreeFileIcon",
                    text_align = "left",
                    separator = "│", -- use a "true" to enable the default, or set your own character
                },
            },
        },
    },
}

return spec
