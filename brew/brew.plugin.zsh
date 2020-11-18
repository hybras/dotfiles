brew bundle

source ./aliases.zsh

fpath+= ( "${0:h}/functions" )

autoload -Uz exa viddl songdl notify