function bat_theme() {
  if defaults read -globalDomain AppleInterfaceStyle &> /dev/null; then
    unset  BAT_THEME
    unset  MCFLY_LIGHT
    ln -sfv ~/.config/alacritty/themes/default.toml ~/.config/alacritty/themes/autoswitch.toml
  else
    export MCFLY_LIGHT=TRUE
    export BAT_THEME="Monokai Extended Light"
    ln -sfv ~/.config/alacritty/themes/atom_one_light.toml ~/.config/alacritty/themes/autoswitch.toml
  fi
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd bat_theme
