# Todo

##   Bugs
- [ ] Fix `1 more file to edit`

## 📄 Readme
- [ ] Update Screenshots

## 🗝  Bindings
- [x] Refactor Bindings
- [x] Bring all Binds into WhichKey
- [x] Bring all Binds into WhichKey
- [x] Improve Folder Structure for Bindings
- [ ] Resolve init KeyMaps bindings (Call `wk.register` on each group and single)
- [ ] Add base command for ":tabnext<CR>" etc
- [ ] Resource config

### Sketch: Maps Folder Structure
```
maps/
  functions.lua    // Merge commands.lua and utils.lua
  maps.lua         // wk.register(search) etc..
  opts.lua
```

or

```
lua/
functions.lua    // Merge commands.lua and utils.lua
maps.lua
  - options
  - wk.register(noLeader.normal)
  - wk.register(withLeader.normal)
  - wk.register(..)
```

## 📦 Plugins
- [x] Clean up `plugins.lua`
  - Remove redundant entries, which get required from others
  - Bring into semantic order

### Problems for which I seek a Solution
- Bookmarks via Telescope
- Markdown checkboxes
- Snippets
- Check commits for one file (Like timeline in VSCode)
- Quicker Format

### PlugIns to Check Out 
- [x] [nvim-bqf](https://github.com/kevinhwang91/nvim-bqf)
- [x] [git-worktree](https://github.com/ThePrimeagen/git-worktree.nvim)
  - This is nice and switching works, but creation does not
  - Also LazyGit doesnt work with it
- [ ] [telescope-vim-bookmarks](https://github.com/tom-anders/telescope-vim-bookmarks.nvim)
- [ ] [format.nvim](https://github.com/lukas-reineke/format.nvim)
- [ ] [tabnine](https://github.com/tzachar/cmp-tabnine#install)

### 🔭 Telescope 
- [x] Search .files
- [x] Fix open in split <kbd>C-x</kbd> is broken
- [x] Sort `last_used`
- [ ] Select items from the list and add only the selected to the quickfix list
- [ ] Search for selected text

### Barbar
- [ ] Ignore QuickFix Buffer

