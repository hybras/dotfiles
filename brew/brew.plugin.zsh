#brew bundle --file "${0:h}/Brewfile" 1> /dev/null

fpath+=( "${0:h}/functions" )
autoload -Uz exa viddl songdl notify

alias jsh='jshell'
alias python='python3'
alias py='python3'
alias pip='pip3'
alias nano='nano -a'
alias ytdl='youtube-dl'
alias cat='bat'
#alias notify='notify-send'
alias proton='sudo protonvpn'
alias ps='procs'
alias vi='nvim'

alias l1='exa -1'