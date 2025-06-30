default:
  just --list

brew:
    brew bundle dump --force
    brewfile-format Brewfile > Brewfile.rb
    rm Brewfile
    mv Brewfile.rb dot_Brewfile
    sd -f m '\n\n(cask "font)' '\n\ncask_args appdir: "~/Applications"\n\n$1' dot_brewfile

fin:
    chezmoi apply ~/.config/finicky.ts

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
