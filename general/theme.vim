" Source for keywords: https://pintovim.dev/

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

function! SetCodeDark()
  set background=dark
  colorscheme codedark
  let g:airline_theme='codedark'
  hi Normal                          guibg=NONE
  hi NonText                         guibg=NONE
  hi EndOfBuffer                     guibg=NONE
  hi TabLineFill                     guibg=NONE
  hi TabLine                         guibg=NONE
  hi VertSplit                       guibg=NONE
  hi SignColumn                      guibg=NONE
  hi LineNr                          guibg=NONE
  hi SignColumn                      guibg=NONE
  hi Comment                         gui=italic
  hi Conditional                     gui=italic
  hi Statement                       gui=italic,bold
  hi typescriptVariable              gui=italic,bold
  hi typescriptInterfaceName         gui=bold
  hi typescriptInterfaceKeyword      gui=italic,bold
  hi typescriptTypeReference         gui=italic,bold
  hi typescriptPredefinedType        gui=italic
  hi typescriptImport                gui=italic,bold
  hi typescriptExport                gui=italic,bold
endfunction

function! SetBase16()
  set background=dark
  colorscheme base16-default-dark
  let g:airline_theme='base16'
  hi Normal                          guibg=NONE
  hi NonText                         guibg=NONE
  hi EndOfBuffer                     guibg=NONE
  hi TabLineFill                     guibg=NONE
  hi TabLine                         guibg=NONE
  hi VertSplit                       guibg=NONE
  hi SignColumn                      guibg=NONE
  hi LineNr                          guibg=NONE
  hi SignColumn                      guibg=NONE
  hi Comment                         gui=italic
  hi Conditional                     gui=italic
  hi Statement                       gui=italic,bold
  hi typescriptVariable              gui=italic,bold guifg=#7cafc2
  hi typescriptImport                gui=italic,bold guifg=#ab4642
  hi typescriptExport                gui=italic,bold guifg=#a1b56c 
  hi typescriptTypeReference         gui=italic,bold guifg=#86c1b9
  hi typescriptInterfaceName         gui=bold        guifg=#86c1b9
  hi typescriptInterfaceKeyword      gui=italic,bold guifg=#86c1b9
  hi typescriptPredefinedType        gui=italic      guifg=#86c1b9
endfunction

map <F6>             :call SetCodeDark()<CR>
map <F7>             :call SetBase16()<CR>

" Initial Theme
call SetCodeDark()
