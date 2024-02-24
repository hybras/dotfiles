#!/usr/bin/env zsh

# cask_args appdir: "~/Applications", require_sha: true
brew bundle dump -f
brewfile-format Brewfile > Brewfile.rb
mv Brewfile.rb Brewfile
