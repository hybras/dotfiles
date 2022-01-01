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

path=(
	"/opt/homebrew/opt/ruby/bin"
	"/opt/homebrew/lib/ruby/gems/3.0.0/bin"
	"/opt/homebrew/opt/openjdk/bin"
	"$HOME/.cargo/bin"
	"$HOME/Library/Python/3.9/bin"
	$path
)

export PATH

# setopt CORRECT
# setopt CORRECT_ALL

export GPG_TTY=$(tty)

# zstyle :omz:plugins:ssh-agent identities id_rsa_github id_rsa_gitlab pijul_nest
# zstyle :omz:plugins:ssh-agent ssh-add-args -A
zstyle :omz:plugins:keychain options --quiet
zstyle :omz:plugins:keychain agents gpg,ssh
zstyle :omz:plugins:keychain identities 7C7ECFF562786CA6B4A8633B8AC89A889BFA44A8 CECCB3D5398F04652EF4A536109BC93C8B952313 id_rsa_github id_rsa_gitlab id_umd

# zstyle :plugin:zsh-completion-generator programs $program

# export GENCOMPL_FPATH=$XDG_CACHE_HOME/gencomp
# export GENCOMPL_PY=python3

eval "$(/opt/homebrew/bin/sheldon source)"

autoload -Uz compinit && compinit

export EDITOR='codium --wait'
export VISUAL='codium --wait'

# opam configuration
# [[ ! -r /Users/hybras/.opam/opam-init/init.zsh ]] || source /Users/hybras/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
