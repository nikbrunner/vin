local options = {
  encoding = "UTF-8",
  clipboard = "unnamedplus",
  termguicolors = true,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  smarttab = true,
  ignorecase = true,
  smartcase = true,
  cindent = true,
  copyindent = true,
  expandtab = true,
  rnu = true,
  nu = true,
  wrap = false,
  hidden = true,
  swapfile = false,
  backup = false,
  lazyredraw = true,
  cursorline = true,
  incsearch = true,
  hlsearch = false,
  scrolloff = 32,
  sidescrolloff = 8,
  tags = "tags",
  compatible = false,
  mouse = "a",
  foldmethod = "indent",
  foldlevel = 10,
  cmdheight = 1,
  timeoutlen = 100,
  signcolumn = "yes",
  splitbelow = true,
  splitright = true,
  completeopt = { "menuone", "noselect" }
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd [[
if executable("rg") 
  set grepprg=rg\ --vimgrep 
endif
]]
