#!/usr/bin/env bash

# Check if Xcode Command Line Tools are installed
if ! [[ -e "/Library/Developer/CommandLineTools/usr/bin/git" ]]; then
  echo "Xcode Command Line Tools not found. Installing..."
  xcode-select --install
  # Wait until the installation is complete
  until [[ -e "/Library/Developer/CommandLineTools/usr/bin/git" ]]; do
    sleep 5
  done
  echo "Xcode Command Line Tools installed."
else
  echo "Xcode Command Line Tools already installed."
fi