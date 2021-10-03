HISTFILE=${ZDOTDIR:-$HOME}/history
HISTSIZE=1000
SAVEHIST=1000
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt autocd
bindkey -e

# setopt CORRECT
# setopt CORRECT_ALL

eval "$(/opt/homebrew/bin/brew shellenv)"
eval $(starship init zsh)
eval "$(mcfly init zsh)"
eval "$(zoxide init zsh)"

export GPG_TTY=$(tty)

fpath=(
	$(brew --prefix)/share/zsh/site-functions
	$fpath
)

zstyle :omz:plugins:ssh-agent identities id_rsa_github id_rsa_gitlab pijul_nest

zstyle :plugin:zsh-completion-generator programs youtube-dl dprint mkcert

export GENCOMPL_FPATH=$XDG_CACHE_HOME/gencomp
export GENCOMPL_PY=python3

# The git plugin needs compdef
autoload -Uz compinit && compinit

eval "$(sheldon source)"

autoload -Uz compinit && compinit

export EDITOR='codium --wait'
export VISUAL='codium --wait'

# opam configuration
[[ ! -r /Users/hybras/.opam/opam-init/init.zsh ]] || source /Users/hybras/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
