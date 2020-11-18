brew bundle

source "${0:h}/aliases.zsh"

fpath+= ( "${0:h}/functions" )

autoload -Uz exa viddl songdl notify