require("vin.core.colorscheme.github")
require("vin.core.colorscheme.onedark")
require("vin.core.colorscheme.onenord")
require("vin.core.colorscheme.vscode")
require("vin.core.colorscheme.kanagawa")

vim.cmd([[
try
  colorscheme github_dimmed
  catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])

vim.cmd([[
  hi StatusLine gui=NONE guifg=NONE guibg=NonText guisp=NonText
  hi StatusLineNc gui=NONE guifg=NONE guibg=NonText guisp=NonText
  hi WinSeparator gui=NONE guifg=NONE guibg=NonText guisp=NonText
]])

-- Hide Vertical SplitLines
vim.cmd([[
  hi VertSplit gui=NONE guifg=NONE guibg=NonText guisp=NonText
]])
