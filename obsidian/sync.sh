#!/usr/bin/env bash

# This script copies the .vimrc file from my Neovim configuration to the two Obsidian vaults I have.

cp ~/.config/nvim/obsidian/.vimrc ~/repos/nikbrunner/notes/.obsidian.vimrc
cp ~/.config/nvim/obsidian/.vimrc ~/repos/nikbrunner/pangea-proxima/.obsidian.vimrc
cp ~/.config/nvim/obsidian/.vimrc ~/repos/nikbrunner/dcd-notes/.obsidian.vimrc

echo "Synced Obsidian .vimrc to vaults."
