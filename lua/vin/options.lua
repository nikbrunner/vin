WhichKeyIgnoreLabel = "which_key_ignore"

vim.g.mapleader = ","
vim.g.maplocalleader = ","

vim.opt.mouse = "a"

vim.opt.clipboard = "unnamedplus"

vim.opt.spelllang = "en_us,de_de"

vim.opt.cursorline = true
vim.opt.cursorcolumn = false

-- preview for substitution
vim.opt.inccommand = "split"

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true

vim.opt.foldlevel = 99
vim.opt.foldmethod = "indent"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

vim.opt.wildmode = "longest:full,full"

vim.opt.jumpoptions = "stack"

vim.opt.fillchars = {
    foldopen = "",
    foldclose = "",
    fold = " ",
    foldsep = " ",
    diff = "╱",
}

--  See :help 'list' and :help 'listchars'
vim.opt.list = true
vim.opt.listchars = {
    tab = "» ",
    trail = "·",
    nbsp = "␣",
}

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.autoread = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.undofile = true

vim.opt.cmdheight = 1
vim.opt.pumheight = 30
vim.opt.pumblend = 10

vim.opt.showmode = false
vim.opt.laststatus = 3

vim.opt.conceallevel = 1
vim.opt.wrap = false

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.guifont = "JetBrains Mono:h16"

vim.opt.scrolloff = 4

vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.shortmess:append("I")

-- Abbreviations
vim.cmd("cabbrev Wqa wqa")
vim.cmd("cabbrev Wq wq")
vim.cmd("cabbrev Wa wa")

vim.filetype.add({
    -- I only needed this because barbecue vomits if i vist this file, because it thinks its lua
    filename = {
        [".luacheckrc"] = ".luacheckrc",
    },
})
