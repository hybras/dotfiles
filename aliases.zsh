alias jsh='jshell'
alias python='python3'
alias py='python3'
alias pip='pip3'
alias nano='nano -a'
alias grep='grep --color=auto'
alias ytdl='youtube-dl'
#alias code='codium'
alias cat='bat'
alias notify='notify-send'
alias proton='sudo protonvpn'

#alias l='exa -lbF'
#alias ll='exa -labF'
#alias l1='exa -1'
#alias ls='exa'
#unalias la
#unalias lsa

exa() {
	command exa --group-directories-first "$@"
}

help() {
	command man -t "$@" | open -f -a Preview
}

songdl() {
	youtube-dl --extract-audio --add-metadata --output "~/Music/%(title)s.%(ext)s" --format bestaudio "$@"
}

viddl() {
	youtube-dl --add-metadata --format bestvideo+bestaudio "$@"
}

otp() {
	dir="$HOME/.otp"
	service="$1"
	k="${dir}/${service}"
	kg="${k}.asc"
	# Decrypt secret
	totp=$(gpg --quiet --decrypt --armor "$kg")
	# Generate 2FA totp
	code=$(oathtool -b --totp "$totp")
	## Copy to clipboard ##
	printf $code | clip
}
