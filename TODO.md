# TODO

## General

- [ ] Define Comment Doc for all functions
- [ ] Clock in Status line
- [ ] Make Custom Select/Yank/Delete Block Commands work with Treesitter
  - These currently work only with languages where a block starts and ends with paired brackets
- [ ] Save Issue ID on Runtime and add a 
  - If no issue id present, show input field
  - If existent open todo searcher with issue id already present
  - folke/todo: filter with issue id?
- [ ] Rework / Refactor lsp config
  - [neovim from scratch](https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/user/lsp/configs.lua)

## Research

- [ ] `Lazygit`: Does `Lazygit` work with Git Worktrees?
- [ ] `packer.nvim`: Checkout lazy Loading for some Plugins
- [ ] Clipboard / Registry Manager

### Videos

Videos which contain valuable Information which I want to check out

- [ ] [Chris@Machine: Creating an unbreakable nvim config](https://www.youtube.com/watch?v=Vghglz2oR0c)
- [ ] [Primeagean: Your VimRC2022](https://www.youtube.com/watch?v=x2QJYq4IX6M)

## Languages

- [ ] Markdown [mkdx](https://github.com/SidOfc/mkdx)
  - [ ] Checkboxes 
  - [ ] Auto Spell Checking
  - [ ] Formatter
  - [ ] Preview

## Plugins

Checkout, evaluate, implement

### Checkout

- [ ] [nvim-navic](https://github.com/SmiteshP/nvim-navic)
- [ ] [stabilize.nvim](https://github.com/luukvbaal/stabilize.nvim)
- [ ] [nvim-pasta](https://github.com/hrsh7th/nvim-pasta)
- [ ] [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo)
- [ ] [feline](https://github.com/feline-nvim/feline.nvim)
- [ ] [nvim-surround](https://github.com/kylechui/nvim-surround)
- [ ] [nvim-spectre](https://github.com/nvim-pack/nvim-spectre)
- [ ] [nvim-orgmode](https://github.com/nvim-orgmode/orgmode)
- [ ] [navigator.lua](https://github.com/ray-x/navigator.lua)
- [ ] [hop.nvim](https://github.com/phaazon/hop.nvim)
- [ ] [octo.nvim](https://github.com/pwntester/octo.nvim)
- [ ] [nvim-docker](https://github.com/dgrbrady/nvim-docker)

### Implement

- [ ] [lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim)
- [ ] [mason.nvim](#mason.nvim)
- [ ] [neo-tree + diagnostics](https://this-week-in-neovim.org/2022/Aug/1#new-neo-tree.nvim)
  - Could replace Trouble?

### Adjust

- [ ] `nvim-cmp`: Format cmp Menu to omit the Entry Name
- [ ] `mark.nvim`: Setup Bindings

## mason.nvim

Move from `nvim-lsp-installer` to `mason.nvim`.

- [ ] [mason.nvim](https://github.com/williamboman/mason.nvim)
- [ ] [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
- [ ] Optional: [lsp-zero](https://github.com/VonHeikemen/lsp-zero.nvim)

## Session Management

I like sessions, but i still don't have a workflow that suits me fully.

Either the sessions are to be managed via Neovim or I can also do that via TMUX.

**Requirements**

- Save, Load and Delete sessions
- Respects Git Branch
- Hooks 

## Links

- [Here](https://www.reddit.com/r/neovim/comments/vvaw1x/which_in_your_opinion_is_the_best_session) is a reddit discussion about neovim session managers.
- [Informative Article about Sessions](https://alpha2phi.medium.com/neovim-for-beginners-session-c287a431389e)

### Plugins

- [auto-session](https://github.com/rmagatti/auto-session)
  - [session-lens](https://github.com/rmagatti/session-lens)
- [neovim-session-manager](https://github.com/Shatur/neovim-session-manager)
  - used in the past
  - Working really great so far except there is a problem with [scope.nvim](https://github.com/tiagovla/scope.nvim/issues/1) for which I also opened an issue
- [workspaces.nvim](https://github.com/natecraddock/workspaces.nvim)
  - Haven't checked out
- [possession.nvim](https://github.com/jedrzejboczar/possession.nvim)
  - Tried, made trouble
