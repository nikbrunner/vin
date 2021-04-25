```
       _ _                  _       
  _ _ (_) |__ _ _ _  _ __ _(_)_ __  
 | ' \| | '_ \ '_| || |\ V / | '  \ 
 |_||_|_|_.__/_|  \_,_(_)_/|_|_|_|_|
```

# nibru.vim

This is my personal **Neovim** config on which I am working on from time to time, while learning about the whole universe of **VIM**.

The config is based on Neovim Nightly (Version: >0.5xx) and Treesitter for improved Syntax Highlighting.

## Links

- [Awesome NeoVim](https://github.com/rockerBOO/awesome-neovim)

## Todo

### Mappings

- [ ] Figure out piping/escaping in Neovim with Lua

#### n/p

I want to agregate all mappings regarding `next` and `previous`.

- qn/qp for Quickfix Entries
- ln/lp for LocList Entries
- gn/gp for git hunks

- [ ] Convert `quickfix.vim` to lua

### Plugins

- [x] Put PlugIn mappings in corresponding `plug-config` folder
- [ ] [Git Signs](https://github.com/lewis6991/gitsigns.nvim)
  - [ ] Fix Git Symbols ( This works not really atm.)

### Todo Today

- [x] GitHub Dark Theme
  - Adjust TS Highlights
- [x] Remove `vim-` from plug-config files
- [x] Better Tab/BufferLine 
- [x] Convert general bindings to lua
- [x] [Git Signs](https://github.com/lewis6991/gitsigns.nvim)
- [x] Check Window Commands
  - Maximize/Restore(Equalize)
  - Restore Equlize after new Buffer
- [x] [NeoVim Native LSP](https://www.chrisatmachine.com/Neovim/27-native-lsp/)
- [x] Research Scss auto-completion/LSP
- [ ] Fix Minimap
- [ ] [LSP Trouble](https://github.com/folke/lsp-trouble.nvim)
- [ ] [LSP Saga](https://github.com/glepnir/lspsaga.nvim)
