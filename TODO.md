# TODO

## General

- [x] Move Commands to global `Vin` table
- [x] Resolve `core/` Folder - Unnecessary Nesting
- [ ] Launch `npm` scripts or custom command in [new kitty tab](https://sw.kovidgoyal.net/kitty/remote-control/#)
- [ ] Define Comment Doc for all functions
- [ ] Clock in Status line
- [ ] Make Custom Select/Yank/Delete Block Commands work with Treesitter
  - These currently work only with languages where a block starts and ends with paired brackets
- [ ] Save Issue ID on Runtime and add a 
  - If no issue id present, show input field
  - If existent open todo searcher with issue id already present
  - folke/todo: filter with issue id?
- [ ] Setup Winbar
  - [In combination with nvim_navic](https://www.reddit.com/r/neovim/comments/vv1jt3/comment/ifh49ti/?utm_source=share&utm_medium=web2x&context=3)
– [ ] Make `gx` work
  - I think that has something to do with `netwr`

## Research

- [ ] `nvim`: Handle Error Cases
- [ ] [Take Pointers from: Chris@Machine: Creating an unbreakable nvim config](https://www.youtube.com/watch?v=Vghglz2oR0c)
- [ ] Spell Checking

## Languages

- [ ] Markdown [mkdx](https://github.com/SidOfc/mkdx)
  - [ ] Checkboxes 
  - [ ] Auto Spell Checking
  - [ ] Formatter
  - [ ] Preview

## Plugins

- [x] [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
- [x] [mark.nvim](https://github.com/chentoast/marks.nvim)
  - [ ] Setup Bindings
- [x] [close-buffers.nvim](https://github.com/kazhala/close-buffers.nvim)
- [x] [treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context)
- [ ] [nvim-navic](https://github.com/SmiteshP/nvim-navic)
- [ ] [stabilize.nvim](https://github.com/luukvbaal/stabilize.nvim)
- [ ] [nvim-pasta](https://github.com/hrsh7th/nvim-pasta)
- [ ] [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo)
- [ ] [feline](https://github.com/feline-nvim/feline.nvim)
- [ ] [nvim-surround](https://github.com/kylechui/nvim-surround)
- [ ] [nvim-spectre](https://github.com/nvim-pack/nvim-spectre)
- [ ] [nvim-orgmode](https://github.com/nvim-orgmode/orgmode)
- [ ] `Lazygit`: Does `Lazygit` work with Git Worktrees?
- [ ] `cmp`: Format cmp Menu to omit the Entry Name
- [ ] Checkout lazy Loading for some Plugins

### Sessions

I like sessions, but i still don't have a workflow that suits me fully.

Either the sessions are to be managed via Neovim or I can also do that via TMUX.

**Requirements**

- Save, Load and Delete sessions
  - **Bonus** Depending on Git Branch
- Hooks 
  - Close all open Toggle Term processes on leave
- Changes `cwd`
  - But I am not sure who is responsible for these things..

#### Neovim

[Here](https://www.reddit.com/r/neovim/comments/vvaw1x/which_in_your_opinion_is_the_best_session) is a reddit discussion about neovim session managers.

- [neovim-session-manager](https://github.com/Shatur/neovim-session-manager)
  - What I am currently using
  - Working really great so far except there is a problem with [scope.nvim](https://github.com/tiagovla/scope.nvim/issues/1) for which I also opened an issue
- [workspaces.nvim](https://github.com/natecraddock/workspaces.nvim)
  - Haven't checked out
- [possession.nvim](https://github.com/jedrzejboczar/possession.nvim)
  - Haven't checked out
