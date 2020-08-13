# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/hybras/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

eval $(starship init zsh)

source ~/antigen.zsh
antigen use oh-my-zsh
zstyle :omz:plugins:ssh-agent identities id_rsa_github
# antigen theme hybras/Arity-Zsh-Theme

antigen bundles <<EOBUNDLES
	zsh-users/zsh-syntax-highlighting
	zsh-users/zsh-autosuggestions
	sudo
	git
#	python
#	gradle
	ssh-agent
#	nmap
	pip
	command-not-found
	zpm-zsh/clipboard
	DarrinTisdale/zsh-aliases-exa
	RobSis/zsh-completion-generator
	rummik/zsh-ing
	robertzk/send.zsh
EOBUNDLES

GENCOMPL_FPATH=$HOME/.config/gencomp

antigen apply

autoload -U compinit && compinit

manpath=(
	$manpath
)

export EDITOR='nano'
export VISUAL='nano'

export LSCOLORS=ExFxBxDxCxegedabagacad

# /Library/Apple/usr/bin:/Library/Apple/bin:/Library/TeX/texbin:/usr/local/go/bin:
path=(
	#Current Directory
	"."
	#Rust
	"$HOME/.cargo/bin"
	# homebrew openjdk
	"/home/linuxbrew/.linuxbrew/opt/openjdk/bin"
	$path
)


export PATH

if [[ -x "$HOME/aliases.zsh" ]]; then
	source "$HOME/aliases.zsh"
fi

eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
