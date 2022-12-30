-- Vim Options
vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.background = "dark"
vim.opt.backup = false -- creates a backup file
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 1
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.cursorline = true -- highlight the current line
vim.opt.encoding = "utf-8"
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.fileencoding = "utf-8"
vim.opt.foldlevel = 10
vim.opt.foldmethod = "indent"
vim.opt.guifont = "JetBrains Mono:h16" -- the font used in graphical neovim applications,
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.laststatus = 1 -- No status line
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.number = true -- set numbered lines
vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}
vim.opt.pumheight = 20 -- pop up menu height
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.ruler = false -- don't show the ruler
vim.opt.scrolloff = 8
vim.opt.sessionoptions = "blank,buffers,curdir,tabpages,winsize" -- overwrite default to "NOT" save folds
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.showcmd = false -- don't show the commands
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 1 -- always show tabs
vim.opt.sidescrolloff = 24
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.spelllang = "en,de"
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
vim.opt.tabstop = 4 -- insert 2 spaces for a tab
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 0 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 100 -- faster completion (4000ms default)
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.wildoptions = "pum"
vim.opt.wrap = false -- display lines as one long line
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

-- Window Options
vim.wo.fillchars = "eob: "

-- Neovide
vim.cmd([[
    " g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
    let g:neovide_transparency = 0.0
    let g:transparency = 0.8
    let g:neovide_background_color = '#0f1117'.printf('%x', float2nr(255 * g:transparency))
]])
