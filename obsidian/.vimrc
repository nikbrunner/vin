set clipboard=unnamed

" Editor
nmap j gj
nmap k gk

" Quickly remove search highlights
" Note: This does not remove the highlight when jumping to a link header.
nmap <Esc> :nohl

" App
exmap back obcommand app:go-back
nmap <C-o> :back

exmap forward obcommand app:go-forward
nmap <C-i> :forward

exmap reload obcommand app:reload
exmap changelog obcommand app:show-release-notes

" Split
exmap vs obcommand workspace:split-vertical
exmap sp obcommand workspace:split-horizontal

" Save
exmap w obcommand editor:save-file
exmap wa obcommand editor:save-file
nmap <CR> :wa

" Close and Quit
exmap q obcommand workspace:close
exmap qg obcommand workspace:close-tab-group
exmap qw obcommand workspace:close-window
exmap only obcommand workspace:close-others

" Theme
exmap theme obcommand theme-picker:open-theme-picker
exmap light obcommand theme:use-light
exmap dark obcommand theme:use-dark

" Folding
exmap togglefold obcommand editor:toggle-fold
nmap zo :togglefold
nmap zc :togglefold
nmap za :togglefold

exmap foldall obcommand editor:fold-all
nmap zM :foldall

exmap foldmore obcommand creases:decrease-fold-level
nmap zm :foldmore

exmap unfoldall obcommand editor:unfold-all
nmap zR :unfoldall

exmap foldless obcommand creases:increase-fold-level
nmap zr :foldless

" Files
unmap <Space> " We need this, otherwise the following mappings will not work.

exmap searchCommands obcommand obsidian-better-command-palette:open-better-commmand-palette
nmap <Space>: :searchCommands

exmap findFiles obcommand obsidian-better-command-palette:open-better-commmand-palette-file-search
nmap <Space><Space> :findFiles

exmap fileExplorer obcommand quick-explorer:browse-current
nmap <Space>e :fileExplorer

" Go
exmap followlink obcommand editor:follow-link
nmap gd :followlink
exmap followlinkinnewpane obcommand editor:open-link-in-new-leaf
nmap gD :followlinkinnewpane

exmap goToSymbol obcommand darlal-switcher-plus:switcher-plus:open-symbols
nmap gs :goToSymbol

" Actions
exmap renameHeading obcommand editor:rename-heading
nmap <Space>cn :renameHeading

exmap moveFile obcommand file-explorer:move-file
nmap <Space>cm :moveFile

" Daily Notes
exmap dd obcommand daily-notes
exmap dp obcommand daily-notes:goto-prev
exmap dn obcommand daily-notes:goto-next
exmap dc obcommand obsidian-jump-to-date-plugin:open-JumpToDate-calendar

exmap surround_wiki surround [[ ]]
exmap surround_double_quotes surround " "
exmap surround_single_quotes surround ' '
exmap surround_backticks surround ` `
exmap surround_brackets surround ( )
exmap surround_square_brackets surround [ ]
exmap surround_curly_brackets surround { }

" NOTE: must use 'map' and not 'nmap'
map [[ :surround_wiki
nunmap s
vunmap s
map s" :surround_double_quotes
map s' :surround_single_quotes
map s` :surround_backticks
map sb :surround_brackets
map s( :surround_brackets
map s) :surround_brackets
map s[ :surround_square_brackets
map s[ :surround_square_brackets
map s{ :surround_curly_brackets
map s} :surround_curly_brackets

exmap jumpToLink obcommand mrj-jump-to-link:activate-jump-to-link
exmap jumpAnywhere obcommand mrj-jump-to-link:activate-jump-to-anywhere

" nmap s :jumpToLink
nmap s :jumpAnywhere
