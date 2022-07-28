local options = {
	backup = false, -- creates a backup file
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	cmdheight = 1, -- more space in the neovim command line for displaying messages
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 0, -- so that `` is visible in markdown files
	fileencoding = "utf-8", -- the encoding written to a file
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	mouse = "a", -- allow the mouse to be used in neovim
	ruler = false, -- don't show the ruler
	showcmd = false, -- don't show the commands
	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 2, -- always show tabs
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	autoindent = true,
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	termguicolors = true, -- set term gui colors (most terminals support this)
	timeoutlen = 0, -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true, -- enable persistent undo
	updatetime = 100, -- faster completion (4000ms default)
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = true, -- convert tabs to spaces
	shiftwidth = 4, -- the number of spaces inserted for each indentation
	tabstop = 4, -- insert 2 spaces for a tab
	cursorline = true, -- highlight the current line
	number = true, -- set numbered lines
	relativenumber = true, -- set relative numbered lines
	numberwidth = 4, -- set number column width to 2 {default 4}
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	wrap = false, -- display lines as one long line
	scrolloff = 12, -- is one of my fav
	sidescrolloff = 8,
	guifont = "JetBrains Mono:h16", -- the font used in graphical neovim applications,
	laststatus = 3, -- Enable global status Line,
	-- spelllang={ "en" , "de"}
}

-- TODO: Set via opt?
vim.cmd([[set spelllang=en,de]])
vim.cmd([[set sessionoptions=blank,buffers,curdir,tabpages,winsize]])

vim.opt.shortmess:append("c")

-- vim.opt.winbar = "TODO: setup simple winbar which shows the current filename and remove incline"

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]]) -- TODO: this doesn't seem to work

-- hide vertical borders
-- TODO Set via vim.wo.fillchars="eob: "

-- vim.cmd([[set fillchars+=vert:\ ]])
-- vim.cmd([[ set fillchars+=vert:\▕]])

-- vim.cmd([[ set fillchars+=stl:\▕]])
-- vim.cmd([[ set fillchars+=stlnc:\▕]])

-- vim.cmd([[set fillchars+=stl:\ ]])
-- vim.cmd([[set fillchars+=stlnc:\ ]])

vim.cmd([[set fillchars=eob:\ ]])

vim.cmd([[set shortmess+=FI]])
vim.cmd([[set noshowcmd]])
