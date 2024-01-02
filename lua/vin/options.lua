WhichKeyIgnoreLabel = "which_key_ignore"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.mouse = "a" -- allow the mouse to be used in neovim

vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard

vim.opt.spelllang = "en_us,de_de"

vim.opt.cursorline = false

-- vim.opt.timeoutlen = 250 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.updatetime = 100 -- faster completion (4000ms default)

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.foldlevel = 99
vim.opt.foldmethod = "indent"

vim.opt.fillchars = {
    foldopen = "",
    foldclose = "",
    fold = " ",
    foldsep = " ",
    diff = "╱",
    eob = " ",
}

vim.opt.number = true -- set numbered lines
vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}
vim.opt.relativenumber = true -- set relative numbered lines

vim.opt.autoread = true
vim.opt.backup = false -- creates a backup file
vim.opt.swapfile = false -- creates a swapfile
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.undofile = true -- enable persistent undo

vim.opt.cmdheight = 1
vim.opt.pumheight = 20 -- pop up menu height
vim.opt.pumblend = 10 -- Popup blend

vim.opt.showtabline = 0 -- hide tabline
vim.opt.laststatus = 3 -- global statusline

vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.wrap = false -- display lines as one long line

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.guifont = "JetBrains Mono:h16" -- the font used in graphical neovim applications,

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 24

vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.smartcase = true -- smart case

vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time

vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
