local present, windows = pcall(require, "windows")
if not present then
    return
end

vim.o.winwidth = 10
vim.o.winminwidth = 10
vim.o.equalalways = false

require("windows").setup()
