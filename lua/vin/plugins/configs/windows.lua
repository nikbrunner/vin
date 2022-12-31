local present, windows = pcall(require, "windows")
if not present then
    return
end

vim.o.winwidth = 10
vim.o.winminwidth = 10
vim.o.equalalways = false

windows.setup({
    autowidth = {
        enable = false,
        winwidth = 30,
        filetype = {
            help = 2,
        },
    },
    ignore = {
        buftype = { "quickfix" },
        filetype = { "NvimTree", "neo-tree", "undotree", "gundo" },
    },
    animation = {
        enable = true,
        duration = 300,
        fps = 30,
        easing = "in_out_sine",
    },
})
