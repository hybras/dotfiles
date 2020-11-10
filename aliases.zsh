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

#alias l='exa -lbF'
#alias ll='exa -labF'
#alias l1='exa -1'
#alias ls='exa'
#unalias la
#unalias lsa

exa() {
	command exa --group-directories-first "$@"
}

songdl() {
	youtube-dl --extract-audio --add-metadata --output "~/Music/%(title)s.%(ext)s" --format bestaudio "$@"
}

viddl() {
	youtube-dl --add-metadata --format bestvideo+bestaudio "$@"
}

notify() {
	powershell.exe "New-BurntToastNotification -Text \"$1\""
}
