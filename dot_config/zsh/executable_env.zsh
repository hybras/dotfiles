# $HOME/.zshenv should only be a one-liner that sources this file
# echo "source $HOME/.config/zsh/.zshenv" >| $HOME/.zshenv

# Set XDG dirs
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
# export XDG_RUNTIME_DIR="$HOME/.xdg"

if [[ "$OSTYPE" == darwin* ]]; then
  export XDG_DESKTOP_DIR="$HOME/Desktop"
  export XDG_DOCUMENTS_DIR="$HOME/Documents"
  export XDG_DOWNLOAD_DIR="$HOME/Downloads"
  export XDG_MUSIC_DIR="$HOME/Music"
  export XDG_PICTURES_DIR="$HOME/Pictures"
  export XDG_VIDEOS_DIR="$HOME/Videos"
fi

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export HOMEBREW_CASK_OPTS="--appdir=~/Applications"
export GPG_TTY=$(tty)
