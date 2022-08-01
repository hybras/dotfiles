
# alias bat="bat --theme=\$(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo default || echo GitHub)"

function bat_theme() {
  export BAT_THEME=$(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo default || echo GitHub)
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd bat_theme
