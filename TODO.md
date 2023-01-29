# TODO

## General

- [x] arch: Rework PlugIn Structure with LazyVim Plugin Specs
- [ ] arch: Resolve Vin object and convert to module requires
- [ ] arch: Rethink Config
- [ ] plugs: Better color tool (Replace ccc)
- [ ] chore: Replace `vim.cmd("Command")` with `vim.cmd.Command()`
- [ ] util: Populatate QuickFix List with Issue Number from Input
- [ ] util: Populatate QuickFix List with Issue Number from Input
- [x] lsp: Ensure Setup of non-lsp tools
- [ ] lsp: Improve Lua Nvim Workspace Settings
- [ ] lsp: Improve Lsp Structure (Try to get from LazyVim)
- [ ] config: Move Icons to Config
- [ ] plugs: UFO fold
- [ ] plugs: navic
- [ ] plugs: context

## Maps

- [ ] maps: Convert to native mappings. These should get recognized via WhichKey
- [ ] maps: Map for `TSHighlightGroupsUnderCursor`

**Unify Mappings with Wrapper Function with opt. description which falls back to `which_key_ignore`**

```lua
map("s", "ZenMode")
map("s", "ZenMode", "Distraction Free Mode")
map("n", "norm nzzzv", "Distraction Free Mode")
```

## Plugins

### Colorschemes

- [JoosepAlviste/palenightfall.nvim: 🌑 Neovim theme inspired by material palenight.](https://github.com/JoosepAlviste/palenightfall.nvim)

### Test

- [aaronhallaert/continuous-testing.nvim](https://github.com/aaronhallaert/continuous-testing.nvim)

### Window Navigation

- [aserowy/tmux.nvim](https://github.com/aserowy/tmux.nvim)
- [winshift.nvim](https://github.com/sindrets/winshift.nvim)

### Editor Navigation

- [navigator.lua](https://github.com/ray-x/navigator.lua)
- [nvim-navic](https://github.com/SmiteshP/nvim-navic)
- [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo)


### Other

- [nvim-spectre](https://github.com/nvim-pack/nvim-spectre)
- [nvim-orgmode](https://github.com/nvim-orgmode/orgmode)
- [octo.nvim](https://github.com/pwntester/octo.nvim)
- [lab.nvim](https://github.com/0x100101/lab.nvim)
