" Source for keywords: https://pintovim.dev/

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

function! SetThemeCodeDark()
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

function! SetThemeBase16()
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
  hi typescriptInterfaceKeyword      gui=italic,bold guifg=#7cafc2
  hi typescriptPredefinedType        gui=italic      guifg=#86c1b9
endfunction

function! SetThemeGitHub()
  set background=light
  colorscheme github
  let g:airline_theme = "github"
  let g:github_colors_soft = 1
  hi Comment                         gui=italic
endfunction

function! SetThemePaper()
  set background=light
  colorscheme paper
  let g:airline_theme = "sol"
endfunction

map <F5>             :call SetThemeCodeDark()<CR>
map <F6>             :call SetThemeBase16()<CR>
map <F7>             :call SetThemeGitHub()<CR>
map <F8>             :call SetThemePaper()<CR>

" Initial Theme
call SetThemeBase16()
