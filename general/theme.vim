" Source for keywords: https://pintovim.dev/

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

" Remove backgrounds
hi Normal                         guibg=NONE
hi NonText                        guibg=NONE
hi EndOfBuffer                    guibg=NONE
hi TabLineFill                    guibg=NONE
hi TabLine                        guibg=NONE
hi VertSplit                      guibg=NONE
hi SignColumn                     guibg=NONE
hi LineNr                         guibg=NONE

" Typograpic adjustments
function! SetCodeDark()
  set background=dark
  colorscheme codedark
  let g:airline_theme='codedark'
  hi Comment                         gui=italic
  hi Conditional                     gui=italic
  hi Statement                       gui=italic,bold
  hi typescriptVariable              gui=italic,bold
  hi typescriptImport                gui=italic,bold
  hi typescriptExport                gui=italic,bold
  hi typescriptTypeReference         gui=italic,bold
  hi typescriptInterfaceName         gui=italic,bold
  hi typescriptPredefinedType        gui=italic
endfunction

function! SetBase16()
  set background=dark
  colorscheme base16-default-dark
  let g:airline_theme='base16'
  hi Comment                         gui=italic
  hi Conditional                     gui=italic
  hi Statement                       gui=italic,bold
  hi typescriptVariable              gui=italic,bold
  hi typescriptImport                gui=italic,bold guifg=#f7ca88
  hi typescriptExport                gui=italic,bold
  hi typescriptTypeReference         gui=italic,bold
  hi typescriptInterfaceName         gui=italic,bold
  hi typescriptPredefinedType        gui=italic
endfunction

call SetCodeDark()

map <F6>             :call SetCodeDark()<CR>
map <F7>             :call SetBase16()<CR>
