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

" gruvbox-material
let g:gruvbox_contrast_dark="medium"
let g:gruvbox_material_background = 'medium'

" nord
let g:nord_bold = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1

" let g:airline_theme='base16'
" colorscheme gruvbox-material

" let g:airline_theme='codedark'
" colorscheme codedark

let g:airline_theme='sol'
 colorscheme darcula
"
" let g:airline_theme='sol'
"  colorscheme morning

hi Normal            guibg=NONE                  ctermbg=NONE
hi TabLineFill       guibg=NONE                  ctermfg=NONE  ctermbg=NONE      cterm=NONE
hi TabLine           guibg=NONE                  ctermfg=NONE  ctermbg=NONE      cterm=NONE
hi TabLineSel        guibg=Yellow guifg=#8fbcbb  ctermfg=Black ctermbg=NONE    cterm=NONE
hi SignColumn        guibg=NONE
" hi Comment                                                      cterm=italic
" hi Conditional                                                  cterm=italic,bold
hi VertSplit         guibg=NONE guifg=#8fbcbb
hi Pmenu             ctermfg=0 ctermbg=13 guibg=NONE

augroup nord-theme-overrides
  autocmd!
  " Use 'nord7' as foreground color for Vim comment titles.
  autocmd ColorScheme nord highlight vimCommentTitle ctermfg=14 guifg=#8FBCBB
augroup END

" Switching themes
map <F6>             :colorscheme darcula <bar> let g:airline_theme='sol' <bar> set background=dark<CR>
map <F7>             :colorscheme morning <bar> let g:airline_theme='sol' <bar> set background=dark<CR>
