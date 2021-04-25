let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
let VM_mouse_mappings =  0 
let DevIconsEnableFoldersOpenClose =  0 
let WebDevIconsNerdTreeAfterGlyphPadding = " "
let WebDevIconsUnicodeByteOrderMarkerDefaultSymbol = ""
let DevIconsEnableFolderExtensionPatternMatching =  0 
let DevIconsEnableDistro =  1 
let Taboo_tabs = ""
let VM_use_first_cursor_in_line =  0 
let WebDevIconsUnicodeDecorateFileNodes =  1 
let DevIconsEnableFolderPatternMatching =  1 
let VM_default_mappings =  1 
let VM_persistent_registers =  0 
let WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ""
let WebDevIconsTabAirLineAfterGlyphPadding = ""
let DevIconsArtifactFixChar = " "
let VM_use_python =  0 
let VM_highlight_matches = "underline"
let WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = ""
let NERDTreeGitStatusUpdateOnCursorHold =  1 
let WebDevIconsUnicodeDecorateFolderNodesExactMatches =  1 
let VM_disable_syntax_in_imode =  0 
let WebDevIconsNerdTreeGitPluginForceVAlign =  1 
let DevIconsAppendArtifactFix =  0 
let WebDevIconsUnicodeDecorateFolderNodes =  1 
let VM_debug =  0 
let WebDevIconsNerdTreeBeforeGlyphPadding = " "
let WebDevIconsUnicodeGlyphDoubleWidth =  1 
let WebDevIconsUnicodeDecorateFolderNodesSymlinkSymbol = ""
let WebDevIconsTabAirLineBeforeGlyphPadding = " "
let VM_case_setting = ""
let VM_check_mappings =  1 
let NERDTreeUpdateOnCursorHold =  1 
let DevIconsDefaultFolderOpenSymbol = ""
let VM_live_editing =  1 
let VM_reselect_first =  0 
silent only
silent tabonly
cd ~/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 ~/.config/nvim
badd +1 ~/
badd +94 general/theme.vim
badd +33 init.vim
badd +46 README.md
badd +1 plugged/github_dark.nvim/colors/github_dark.vim
badd +62 plugged/github_dark.nvim/lua/github_dark.lua
badd +10 plug-config/treesitter.lua
badd +7 plug-config/pencil.vim
badd +62 general/plugins.vim
badd +12 general/maps/div.vim
badd +10 plug-config/gitignore.vim
badd +31 ~/.config/nvim/plug-config/coc.vim
badd +6 ~/.config/nvim/plug-config/fugitive.vim
badd +3 ~/.config/nvim/plug-config/gitgutter.vim
badd +5 ~/.config/nvim/plug-config/neoscroll.vim
badd +71 ~/.config/nvim/general/maps/quickfix.vim
badd +70 plug-config/telescope.lua
badd +34 ~/.config/nvim/general/mappings.lua
badd +3 ~/.config/nvim/general/spellcheck.vim
badd +1 ~/.config/nvim/plug-config/gitsigns.lua
argglobal
%argdel
$argadd ~/.config/nvim
$argadd ~/
tabnew
tabrewind
edit README.md
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
if bufexists("README.md") | buffer README.md | else | edit README.md | endif
if &buftype ==# 'terminal'
  silent file README.md
endif
balt init.vim
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=10
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 44 - ((34 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 44
normal! 0
tabnext
edit ~/.config/nvim/general/mappings.lua
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
if bufexists("~/.config/nvim/general/mappings.lua") | buffer ~/.config/nvim/general/mappings.lua | else | edit ~/.config/nvim/general/mappings.lua | endif
if &buftype ==# 'terminal'
  silent file ~/.config/nvim/general/mappings.lua
endif
balt init.vim
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=10
setlocal fml=1
setlocal fdn=20
setlocal nofen
let s:l = 4 - ((3 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4
normal! 0
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0&& getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOFIc
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
