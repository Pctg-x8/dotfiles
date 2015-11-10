# zshrc

autoload -U colors && colors
autoload -U compinit && compinit

zstyle ':completion:*' menu select

alias ls='ls --color=auto'
alias subl=subl3

source ~/developing/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
PROMPT="
%{$fg_no_bold[cyan]%}[%n@%M] %{$fg_bold[yellow]%}%~%{$reset_color%}
%# "

# powerline enable
powerline-daemon -q
. /usr/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh

# autostart tmux
is_screen_running() {
	[ ! -z "$WINDOW" ]	
}
is_tmux_running() {
	[ ! -z "$TMUX" ]
}
is_screen_or_tmux_running() {
	is_screen_running || is_tmux_running
}
shell_has_started_interactively() {
	[ ! -z "$PS1" ]
}
resolve_alias() {
	cmd="$1"
	while
		whence "$cmd" >/dev/null 2>/dev/null && [ "$(whence "$cmd")" != "$cmd" ]
	do
		cmd=$(whence "$cmd")
	done
	echo "$cmd"
}
if ! is_screen_or_tmux_running && shell_has_started_interactively; then
	for cmd in tmux tscreen screen;do
		if whence $cmd >/dev/null 2>/dev/null; then
			$(resolve_alias "$cmd")
			break
		fi
	done
fi


