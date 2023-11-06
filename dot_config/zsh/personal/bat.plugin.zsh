function bat_theme() {
  if defaults read -globalDomain AppleInterfaceStyle &> /dev/null; then
    unset BAT_THEME
  else
    export BAT_THEME=GitHub
  fi
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd bat_theme
