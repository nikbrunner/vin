# TODO

<!--toc:start-->

- [TODO](#todo)
  - [General](#general)
  - [Maps](#maps)
  - [LSP](#lsp)
  - [0.9](#09)
  - [Ideas](#ideas)
  - [Plugins](#plugins)
  - [Window Navigation](#window-navigation)
  - [Editor Navigation](#editor-navigation)
  - [Session](#session)
  - [Other](#other)
  <!--toc:end-->

## General

- [ ] **LunarVim** - Align Mappings and (most) plugins

## Maps

- [ ] Unify Mappings with Wrapper Function with opt. description which falls back to `which_key_ignore`
  - `map("s", "ZenMode")`
  - `map("s", "ZenMode", "Distraction Free Mode")`
  - `map("n", "norm nzzzv", "Distraction Free Mode")`
- [ ] Map for `TSHighlightGroupsUnderCursor`

## LSP

- [x] Separate `ensure_installed` list from automatically set up LSP servers

## 0.9

- [ ] Replace `vim.cmd("Command")` with `vim.cmd.Command()`

## Ideas

- [ ] Generative TODO Comments with an dynamic issue number and lang detection
  - Example: `// TODO:3232 - Outsource function`
  - Number or String could be stored on Vin Table during runtime
  - Run `:TodoTelescope default_text=3232`

## Plugins

Checkout, evaluate, implement

### Window Navigation

- [aserowy/tmux.nvim](https://github.com/aserowy/tmux.nvim)
- [winshift.nvim](https://github.com/sindrets/winshift.nvim)

### Editor Navigation

- [navigator.lua](https://github.com/ray-x/navigator.lua)
- [nvim-navic](https://github.com/SmiteshP/nvim-navic)
- [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo)

### Session

- [folke/persistence.nvim: 💾 Simple session management for Neovim](https://github.com/folke/persistence.nvim)

### Other

- [nvim-spectre](https://github.com/nvim-pack/nvim-spectre)
- [nvim-orgmode](https://github.com/nvim-orgmode/orgmode)
- [octo.nvim](https://github.com/pwntester/octo.nvim)
- [lab.nvim](https://github.com/0x100101/lab.nvim)
