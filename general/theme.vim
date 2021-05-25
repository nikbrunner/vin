" Source for keywords: https://pintovim.dev/

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

function! SetThemeDarkPlus()
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

function! SetThemeDarcula()
  set background=dark
  colorscheme darcula-solid
  hi Normal                          guibg=#22272e
  hi NonText                         guibg=#22272e
  hi EndOfBuffer                     guibg=#22272e
  hi SignColumn                      guibg=NONE
  hi VertSplit                       guibg=NONE
  " hi TabLineFill                     guibg=NONE
  " hi TabLine                         guibg=NONE
  " hi TabLine                         guibg=NONE
  hi Comment                         gui=italic
  hi Conditional                     gui=italic
  hi Statement                       gui=italic,bold
  hi typescriptVariable              gui=italic,bold guifg=#CD7832
  hi typescriptVariableDeclaration   gui=italic,bold guifg=#569cd6
  hi typescriptInterfaceName         gui=bold        guifg=#6E4A82
  hi typescriptInterfaceKeyword      gui=italic,bold guifg=#CD7832
  hi typescriptTypeReference         gui=italic,bold guifg=#6E4A82
  hi typescriptPredefinedType        gui=italic      guifg=#6E4A82
  hi typescriptImport                gui=italic,bold guifg=#CD7832
  hi typescriptExport                gui=italic,bold guifg=#CD7832
  hi typescriptBlock                                 guifg=#FFC66B
endfunction

function! SetThemeGitHubLight()
  set background=light
  colorscheme github
  hi Comment                         gui=italic
endfunction

function! SetThemeGitHubDark()
  set background=dark
  colorscheme github
  hi Normal                          guibg=NONE
  hi EndOfBuffer                     guibg=NONE
  hi VertSplit                       guibg=NONE
  hi TabLineFill                     guibg=#0d1117
  hi BufferCurrent                                 guifg=#8DDB8C
  hi BufferInactive                  guibg=#2D333B
  hi BufferInactiveMod               guibg=#2D333B
  hi BufferInactiveSign              guibg=#2D333B
  hi BufferInactiveTarget            guibg=#2D333B
  hi BufferTabpageFill               guibg=#0d1117
  hi BufferTabpages                  guibg=#0d1117
  hi Comment                         gui=italic
  hi Conditional                     gui=italic
  hi Statement                       gui=italic,bold
endfunction

function! SetThemeDefault()
  set background=dark
  colorscheme default
endfunction


command! SetThemeDarkPlus        :call SetThemeDarkPlus()
command! SetThemeDarcula         :call SetThemeDarcula()
command! SetThemeGitHubLight     :call SetThemeGitHubLight()
command! SetThemeGitHubDark      :call SetThemeGitHubDark()

" Initial Theme
" call SetThemeDarkPlus()
call SetThemeGitHubDark()
" call SetThemeDarcula()
" call SetThemeDefault()
