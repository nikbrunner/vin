" Source for keywords: https://pintovim.dev/

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

function! SetThemeNvCode()
  set background=dark
  colorscheme nvcode
  hi Normal                          guibg=NONE     guifg=#c9d1d9
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
  hi typescriptVariable              gui=italic,bold guifg=#569cd6
  hi typescriptVariableDeclaration   gui=italic,bold guifg=#9cdcfe
  hi typescriptInterfaceName         gui=bold        guifg=#4ec9b0
  hi typescriptInterfaceKeyword      gui=italic,bold guifg=#569cd6
  hi typescriptTypeReference         gui=italic,bold guifg=#4ec9b0
  hi typescriptPredefinedType        gui=italic      guifg=#4ec9b0
  hi typescriptImport                gui=italic,bold guifg=#c586c0
  hi typescriptExport                gui=italic,bold guifg=#c586c0
  hi typescriptBlock                                 guifg=#f1c264
endfunction

function! SetThemeJellyBeans()
  set background=dark
  colorscheme jellybeans-nvim
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
  hi typescriptVariable              gui=italic,bold guifg=#c6b6ee
  hi typescriptInterfaceName         gui=bold        guifg=#f1c264
  hi typescriptInterfaceKeyword      gui=italic,bold guifg=#8197bf
  hi typescriptTypeReference         gui=italic,bold guifg=#c6b6ee
  hi typescriptPredefinedType        gui=italic      guifg=#ffb964
  hi typescriptImport                gui=italic,bold guifg=#799d6a
  hi typescriptExport                gui=italic,bold guifg=#799d6a
  hi typescriptBlock                                 guifg=#f1c264
endfunction

function! SetThemeGitHubLight()
  set background=light
  colorscheme github
  hi Comment                         gui=italic
  " I wanted to adjust CursorColor here, but I needed to set it from
  " kitty.conf
endfunction

function! SetThemeGitHubDark()
  set background=dark
  colorscheme github_dark
  hi TabLineFill                     guibg=NONE
  hi TabLine                         guibg=NONE
  hi VertSplit                       guibg=NONE
  hi SignColumn                      guibg=NONE
  hi LineNr                          guibg=NONE
  hi SignColumn                      guibg=NONE
  hi Comment                         gui=italic
  hi Conditional                     gui=italic
  hi Statement                       gui=italic,bold
  hi typescriptVariable              gui=italic,bold guifg=#ff7b72
  hi typescriptVariableDeclaration   gui=italic,bold guifg=#9cdcfe
  hi typescriptInterfaceName         gui=bold        guifg=#3fb950
  hi typescriptInterfaceKeyword      gui=italic,bold guifg=#ff7b72
  hi typescriptTypeReference         gui=italic,bold guifg=#3fb950
  hi typescriptPredefinedType        gui=italic      guifg=#3fb950
  hi typescriptImport                gui=italic,bold guifg=#ff7b72
  hi typescriptExport                gui=italic,bold guifg=#ff7b72
endfunction

command! SetThemeNvCode          :call SetThemeNvCode()
command! SetThemeJellyBeans      :call SetThemeJellyBeans()
command! SetThemeGitHubLight     :call SetThemeGitHubLight()
command! SetThemeGitHubDark     :call SetThemeGitHubDark()

" Initial Theme
" call SetThemeNvCode()
call SetThemeGitHubDark()
