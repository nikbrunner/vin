# vin/

<a href="https://dotfyle.com/nikbrunner/vin"><img src="https://dotfyle.com/nikbrunner/vin/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/nikbrunner/vin"><img src="https://dotfyle.com/nikbrunner/vin/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/nikbrunner/vin"><img src="https://dotfyle.com/nikbrunner/vin/badges/plugin-manager?style=flat" /></a>

This is my personal Neovim configuration.

I tailored this config to my personal needs as a Frontend Engineer
mainly working with _React_, _TypeScript_ and _SCSS_.

- As fast as possible
- As simple as possible
- As few plugins as possible

## Install

> Install requires Neovim 0.9+.

Clone the repository and install the plugins:

```sh
git clone git@github.com:nikbrunner/vin ~/.config/vin
NVIM_APPNAME=vin nvim --headless +"Lazy! sync" +qa
```

Open Neovim with this config, without an alias:

```sh
NVIM_APPNAME="vin" nvim
```

If you want to start this config when running `nvim`, you can set an alias, in your `.bashrc` or `.zshrc`:

```sh
alias nvim="NVIM_APPNAME=vin nvim"
```

## Uninstall

To remove everything related to this config, run the following commands:

```sh
rm -rf ~/.config/vin
rm -rf ~/.local/share/vin
```

Make sure you have [a nerd font](https://github.com/ryanoasis/nerd-fonts) installed.

## Todo

- [ ] Debugging
- [ ] `obsidian.nvim` Plugin
- [ ] Spell Checking

## Origin of Name

[See here](https://brandon-sanderson.fandom.com/wiki/vin)

## Links

### General

- [EmmyLua Documentation - Formatting Annotations · sumneko/lua-language-server Wiki](https://github.com/sumneko/lua-language-server/wiki/Formatting-Annotations)
- [Help - Neovim docs](https://neovim.io/doc/user/index.html)

### Other Configs

- [0xsamrath/.dotfiles](https://github.com/0xsamrath/.dotfiles)
- [LunarVim/nvim-basic-ide](https://github.com/LunarVim/nvim-basic-ide)
- [dot/nvim · folke/dot](https://github.com/folke/dot/tree/master/nvim)
- [folke/LazyVim: Starter template for lazy Neovim users](https://github.com/folke/LazyVim)
- [cseickel/dotfiles](https://github.com/cseickel/dotfiles/blob/main/config/nvim/lua/status.lua)
- [ahmedelgabri/dotfiles](https://github.com/ahmedelgabri/dotfiles/blob/c2e2e3718e769020f1468048e33e60ad8a97edfc/config/.vim/lua/_/lsp.lua#L329-L378)
- [glepnir/nvim](https://github.com/glepnir/nvim)
- [craftzdog](https://github.com/craftzdog/dotfiles-public/tree/master/.config/nvim)
- [harrisoncramer/nvim: My personal Neovim configuration.](https://github.com/harrisoncramer/nvim/tree/main)
- [GitHub - alex35mil/dotfiles: My dotfiles](https://github.com/alex35mil/dotfiles)
- [loctvl842/nvim](https://github.com/loctvl842/nvim?search=1)

## Plugins

### ai

- [jackMort/ChatGPT.nvim](https://dotfyle.com/plugins/jackMort/ChatGPT.nvim)

### bars-and-lines

- [utilyre/barbecue.nvim](https://dotfyle.com/plugins/utilyre/barbecue.nvim)
- [SmiteshP/nvim-navic](https://dotfyle.com/plugins/SmiteshP/nvim-navic)
- [luukvbaal/statuscol.nvim](https://dotfyle.com/plugins/luukvbaal/statuscol.nvim)

### color

- [uga-rosa/ccc.nvim](https://dotfyle.com/plugins/uga-rosa/ccc.nvim)

### colorscheme

- [projekt0n/github-nvim-theme](https://dotfyle.com/plugins/projekt0n/github-nvim-theme)
- [folke/tokyonight.nvim](https://dotfyle.com/plugins/folke/tokyonight.nvim)
- [EdenEast/nightfox.nvim](https://dotfyle.com/plugins/EdenEast/nightfox.nvim)

### comment

- [numToStr/Comment.nvim](https://dotfyle.com/plugins/numToStr/Comment.nvim)
- [JoosepAlviste/nvim-ts-context-commentstring](https://dotfyle.com/plugins/JoosepAlviste/nvim-ts-context-commentstring)
- [folke/todo-comments.nvim](https://dotfyle.com/plugins/folke/todo-comments.nvim)

### completion

- [zbirenbaum/copilot.lua](https://dotfyle.com/plugins/zbirenbaum/copilot.lua)
- [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)

### cursorline

- [RRethy/vim-illuminate](https://dotfyle.com/plugins/RRethy/vim-illuminate)

### diagnostics

- [folke/trouble.nvim](https://dotfyle.com/plugins/folke/trouble.nvim)

### editing-support

- [echasnovski/mini.pairs](https://dotfyle.com/plugins/echasnovski/mini.pairs)
- [booperlv/nvim-gomove](https://dotfyle.com/plugins/booperlv/nvim-gomove)
- [nvim-treesitter/nvim-treesitter-context](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter-context)
- [windwp/nvim-autopairs](https://dotfyle.com/plugins/windwp/nvim-autopairs)
- [windwp/nvim-ts-autotag](https://dotfyle.com/plugins/windwp/nvim-ts-autotag)

### file-explorer

- [nvim-neo-tree/neo-tree.nvim](https://dotfyle.com/plugins/nvim-neo-tree/neo-tree.nvim)

### fuzzy-finder

- [ibhagwan/fzf-lua](https://dotfyle.com/plugins/ibhagwan/fzf-lua)
- [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)

### git

- [lewis6991/gitsigns.nvim](https://dotfyle.com/plugins/lewis6991/gitsigns.nvim)

### icon

- [ziontee113/icon-picker.nvim](https://dotfyle.com/plugins/ziontee113/icon-picker.nvim)

### indent

- [echasnovski/mini.indentscope](https://dotfyle.com/plugins/echasnovski/mini.indentscope)
- [lukas-reineke/indent-blankline.nvim](https://dotfyle.com/plugins/lukas-reineke/indent-blankline.nvim)

### keybinding

- [folke/which-key.nvim](https://dotfyle.com/plugins/folke/which-key.nvim)

### lsp

- [jose-elias-alvarez/null-ls.nvim](https://dotfyle.com/plugins/jose-elias-alvarez/null-ls.nvim)
- [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
- [SmiteshP/nvim-navbuddy](https://dotfyle.com/plugins/SmiteshP/nvim-navbuddy)
- [tamago324/nlsp-settings.nvim](https://dotfyle.com/plugins/tamago324/nlsp-settings.nvim)
- [nvimdev/lspsaga.nvim](https://dotfyle.com/plugins/nvimdev/lspsaga.nvim)
- [VonHeikemen/lsp-zero.nvim](https://dotfyle.com/plugins/VonHeikemen/lsp-zero.nvim)

### lsp-installer

- [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)

### markdown-and-latex

- [davidgranstrom/nvim-markdown-preview](https://dotfyle.com/plugins/davidgranstrom/nvim-markdown-preview)
- [toppair/peek.nvim](https://dotfyle.com/plugins/toppair/peek.nvim)

### marks

- [chentoast/marks.nvim](https://dotfyle.com/plugins/chentoast/marks.nvim)
- [ThePrimeagen/harpoon](https://dotfyle.com/plugins/ThePrimeagen/harpoon)

### motion

- [folke/flash.nvim](https://dotfyle.com/plugins/folke/flash.nvim)

### note-taking

- [epwalsh/obsidian.nvim](https://dotfyle.com/plugins/epwalsh/obsidian.nvim)

### nvim-dev

- [anuvyklack/animation.nvim](https://dotfyle.com/plugins/anuvyklack/animation.nvim)
- [folke/neodev.nvim](https://dotfyle.com/plugins/folke/neodev.nvim)
- [MunifTanjim/nui.nvim](https://dotfyle.com/plugins/MunifTanjim/nui.nvim)
- [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)

### plugin-manager

- [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)

### snippet

- [L3MON4D3/LuaSnip](https://dotfyle.com/plugins/L3MON4D3/LuaSnip)
- [rafamadriz/friendly-snippets](https://dotfyle.com/plugins/rafamadriz/friendly-snippets)

### split-and-window

- [folke/edgy.nvim](https://dotfyle.com/plugins/folke/edgy.nvim)
- [anuvyklack/windows.nvim](https://dotfyle.com/plugins/anuvyklack/windows.nvim)

### startup

- [nvimdev/dashboard-nvim](https://dotfyle.com/plugins/nvimdev/dashboard-nvim)

### statusline

- [nvim-lualine/lualine.nvim](https://dotfyle.com/plugins/nvim-lualine/lualine.nvim)

### syntax

- [echasnovski/mini.surround](https://dotfyle.com/plugins/echasnovski/mini.surround)
- [nvim-treesitter/nvim-treesitter-textobjects](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter-textobjects)
- [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)

### terminal-integration

- [numToStr/FTerm.nvim](https://dotfyle.com/plugins/numToStr/FTerm.nvim)

### utility

- [folke/noice.nvim](https://dotfyle.com/plugins/folke/noice.nvim)
- [rcarriga/nvim-notify](https://dotfyle.com/plugins/rcarriga/nvim-notify)
- [kazhala/close-buffers.nvim](https://dotfyle.com/plugins/kazhala/close-buffers.nvim)
- [LukasPietzschmann/telescope-tabs](https://dotfyle.com/plugins/LukasPietzschmann/telescope-tabs)
- [stevearc/dressing.nvim](https://dotfyle.com/plugins/stevearc/dressing.nvim)
- [kevinhwang91/nvim-ufo](https://dotfyle.com/plugins/kevinhwang91/nvim-ufo)

## Language Servers

- bashls
- cssls
- denols
- eslint
- gopls
- html
- jsonls
- lua_ls
- marksman
- rust_analyzer
- tsserver

This readme was generated by [Dotfyle](https://dotfyle.com)
