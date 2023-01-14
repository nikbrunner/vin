local present, bufferline = pcall(require, "bufferline")
if not present then
    return
end

bufferline.setup({
    options = {
        diagnostics = "nvim_lsp",
        mode = "buffers", -- set to "tabs" to only show tabpages instead
        always_show_bufferline = false,
        show_tab_indicators = false,
        diagnostics_indicator = function(_, _, diag)
            local icons = Vin.icons.diagnostics
            local ret = (diag.error and icons.Error .. diag.error .. " " or "")
                .. (diag.warning and icons.Warning .. diag.warning or "")
            return vim.trim(ret)
        end,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "NvimTreeFolderName",
                text_align = "left",
                separator = "│", -- use a "true" to enable the default, or set your own character
            },
            {
                filetype = "neo-tree",
                text = "File Explorer",
                highlight = "NeoTreeFileIcon",
                text_align = "left",
                separator = "│", -- use a "true" to enable the default, or set your own character
            },
        },
    },
})
