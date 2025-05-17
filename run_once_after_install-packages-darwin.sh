#!/usr/bin/env bash

install_brew() {
    local brew_version='4.5.2'
    curl -fsSL "https://github.com/Homebrew/brew/releases/download/$brew_version/Homebrew-$brew_version.pkg" -o "$HOME/Downloads/Homebrew-$brew_version.pkg"
    sudo installer -pkg "$HOME/Downloads/Homebrew-$brew_version.pkg" -target /
}

install_brew

brew bundle install --quiet --file --global
