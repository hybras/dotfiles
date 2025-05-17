#!/usr/bin/env bash

curl -fsSL https://github.com/Homebrew/brew/releases/download/4.5.2/Homebrew-4.5.2.pkg -o ~/Downloads/Homebrew-4.5.2.pkg
sudo installer -pkg ~/Downloads/Homebrew-4.5.2.pkg -target /

brew bundle install --quiet --file --global

