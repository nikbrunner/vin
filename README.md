# Vin

<!--toc:start-->

- [Vin](#vin)
  - [Description](#description)
  - [Install](#install)
    - [Install Neovim with Homebrew on Mac](#install-neovim-with-homebrew-on-mac)
    - [Clone Config](#clone-config)
  - [Fonts](#fonts)
  - [Origin of Name](#origin-of-name)
  - [Links](#links)
  - [Other Configs](#other-configs)
  <!--toc:end-->

## Description

This is my personal Neovim configuration on which I am working on from time to time,
while learning about the whole universe of Vim / Neovim.

I tailored this config to my personal needs as a Frontend Engineer
mainly working with React, TypeScript and SCSS.

## Install

### Install Neovim with Homebrew on Mac

**Stable** Version

```bash
brew install neovim
```

**Nightly** Version

```bash
brew install neovim --HEAD
```

If you use the `nightly` version, there exists a `nightly` branch on the repository.

### Clone Config

If you have an existing Neovim config, rename it to `nvim.old`, and clone this config.

```bash
git clone git@github.com:nikbrunner/vin.git ~/.config/nvim
```

Run `nvim` and wait for the plugins to be installed

Open `nvim` and enter the following:

```vim
:checkhealth
```

## Fonts

Make sure you have a nerd font installed.

- [A nerd font](https://github.com/ryanoasis/nerd-fonts)

## Origin of Name

[See here](https://brandon-sanderson.fandom.com/wiki/vin)

## Links

- [EmmyLua Documentation - Formatting Annotations · sumneko/lua-language-server Wiki](https://github.com/sumneko/lua-language-server/wiki/Formatting-Annotations)

## Other Configs

- [0xsamrath/.dotfiles](https://github.com/0xsamrath/.dotfiles)
- [LunarVim/nvim-basic-ide](https://github.com/LunarVim/nvim-basic-ide)
- [folke/dot/nvim](https://github.com/folke/dot/tree/master/config/nvim/lua)
- [cseickel/dotfiles](https://github.com/cseickel/dotfiles/blob/main/config/nvim/lua/status.lua)
- [ahmedelgabri/dotfiles](https://github.com/ahmedelgabri/dotfiles/blob/c2e2e3718e769020f1468048e33e60ad8a97edfc/config/.vim/lua/_/lsp.lua#L329-L378)
- [glepnir/nvim](https://github.com/glepnir/nvim)
- [craftzdog](https://github.com/craftzdog/dotfiles-public/tree/master/.config/nvim)
