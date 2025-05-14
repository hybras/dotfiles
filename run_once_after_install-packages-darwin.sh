#!/usr/bin/env bash

curl -fsSL https://github.com/Homebrew/brew/releases/download/4.5.2/Homebrew-4.5.2.pkg -o ~/Downloads/Homebrew-4.5.2.pkg
sudo installer -pkg ~/Downloads/Homebrew-4.5.2.pkg -target /
eval `/opt/homebrew/bin/brew shellenv`

brew bundle install --quiet --file ~/.config/homebrew/Brewfile

