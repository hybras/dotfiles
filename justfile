fin:
    chezmoi apply ~/.config/finicky.js

shel:
    chezmoi apply ~/.config/sheldon/plugins.toml

zsh:
    chezmoi apply ~/.config/zsh/.zshenv ~/.config/zsh/.zshrc ~/.config/zsh/.zprofile

ala:
    chezmoi apply ~/.config/alacritty.yml

diff:
    chezmoi diff > diff.diff