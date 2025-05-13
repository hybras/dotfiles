default:
  just --list

brew:
    # cask_args appdir: "~/Applications", require_sha: true
    brew bundle dump -f
    brewfile-format Brewfile > Brewfile.rb
    mv Brewfile.rb Brewfile

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

cache:
    starship init zsh > dot_config/zsh/personal/starship.plugin.zsh
    mcfly init zsh > dot_config/zsh/personal/mcfly.plugin.zsh
    direnv hook zsh > dot_config/zsh/personal/direnv.plugin.zsh