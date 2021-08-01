```
       _ _                  _       
  _ _ (_) |__ _ _ _  _ __ _(_)_ __  
 | ' \| | '_ \ '_| || |\ V / | '  \ 
 |_||_|_|_.__/_|  \_,_(_)_/|_|_|_|_|
```

# nibru.vim

This is my personal **Neovim** config on which I am working on from time to time, while learning about the whole universe of **VIM**.

The config is based on Neovim Nightly (Version: >0.5xx) and Treesitter for improved Syntax Highlighting.

## Research
### Lua
- [ ] Study [nvim-lua-guide](https://github.com/nanotee/nvim-lua-guide)
- [ ] Study [neovim-init](https://oroques.dev/notes/neovim-init/)

## Todo
### Keybinds
- [ ] Shift Lines in all modes

### Lua
- [ ] Convert to **Lua**
  - [x] `highlightedyank`
  - [x] `markdown-preview`
  - [x] `gitignore`
  - [x] `lazygit`
  - [x] `ultisnips`
  - [x] `general/sets`
  - [x] `general/quickfix`
    - Replace with [nvim-bqf](https://github.com/kevinhwang91/nvim-bqf) 
  - [x] `general/spellcheck`
  - [ ] `general/plugins`
    - Only possible with a lua package manager
    - Setup [packer.nvim](https://jdhao.github.io/2021/07/11/from_vim_plug_to_packer/)

### Plugins
#### Installed
- [ ] Purge everything redundant
- [ ] Make completion more intuitive or train more

#### New
- [ ] Lua LSP
- [ ] Install [LuaPad](https://github.com/rafcamlet/nvim-luapad)

### Appearence
- [ ] Improve Highlighting for JSX/TSX tags

#### Syntax Highlights
These worked in the past
```viml
hi typescriptVariable              gui=italic,bold guifg=#CD7832
hi typescriptVariableDeclaration   gui=italic,bold guifg=#569cd6
hi typescriptInterfaceName         gui=bold        guifg=#6E4A82
hi typescriptInterfaceKeyword      gui=italic,bold guifg=#CD7832
hi typescriptTypeReference         gui=italic,bold guifg=#6E4A82
hi typescriptPredefinedType        gui=italic      guifg=#6E4A82
hi typescriptImport                gui=italic,bold guifg=#CD7832
hi typescriptExport                gui=italic,bold guifg=#CD7832
hi typescriptBlock                                 guifg=#FFC66B
```

### Done
- [x] [[Visual Studio Code]] Vim Setup aufräumen
- [x] Linux [[Vim]] Setup aufräumen und testen
- [x] [[OniVim]] updaten
- [x] Install [GitHub Nvim Theme](https://github.com/projekt0n/github-nvim-theme) 
- [x] Fix Prettier/Formating
  - https://github.com/mhartington/formatter.nvim
  - https://github.com/fsouza/prettierd
- [x] Setup [vim-react-snippets](https://github.com/mlaursen/vim-react-snippets#usestate)
- [x] Implement `https://github.com/glepnir/dashboard-nvim`
- [x] Convert `nvim-tree` config to lua
- [x] Move all keybinds to `mappings.lua`
- [x] Zen
- [x] Try out [Telescope UltiSnips](https://github.com/fhill2/telescope-ultisnips.nvim)
- [x] Setup mappings for trouble
