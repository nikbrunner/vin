#!/usr/bin/env bash

# This script copies the .vimrc file from my Neovim configuration to the two Obsidian vaults I have.

cp ~/.config/nvim/obsidian/.vimrc ~/repos/nikbrunner/notes/.obsidian.vimrc
cp ~/.config/nvim/obsidian/.vimrc ~/repos/nikbrunner/the-black-atom/.obsidian.vimrc
cp ~/.config/nvim/obsidian/.vimrc ~/repos/nikbrunner/dcd-notes/.obsidian.vimrc

echo "Synced Obsidian .vimrc to vaults."

# Copy key keybindings from the personal notes vault to all other vaults
cp ~/repos/nikbrunner/notes/.obsidian/hotkeys.json ~/repos/nikbrunner/the-black-atom/.obsidian/hotkeys.json
cp ~/repos/nikbrunner/notes/.obsidian/hotkeys.json ~/repos/nikbrunner/dcd-notes/.obsidian/hotkeys.json

echo "Synced Obsidian hotkeys to vaults."
