# zshrc

local use_tmux=false

autoload -U colors && colors
autoload -U compinit && compinit

# vcs_info
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' max-exports 4
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:*' formats '%b' '%c' '%u'
zstyle ':vcs_info:*' actionformats '%b (%F{red}%a%f)'
zstyle ':vcs_info:*' enable git
rprompt_hooker() {
	local color

	vcs_info
	if   [[ -n "$vcs_info_msg_1_" ]]; then color=${fg[red]} # staged chg
	elif [[ -n "$vcs_info_msg_2_" ]]; then color=${fg[red]} # unstaged chg
	else color=${fg[green]}                                 # clean
	fi
	if [ -n "$vcs_info_msg_0_" ]; then
		echo "[%{$color%}$vcs_info_msg_0_%{$reset_color%}]"
	fi
}

zstyle ':completion:*' menu select

# Platform depending settings
[ -f $HOME/.zshrc_`uname` ] && source $HOME/.zshrc_`uname`
alias subl=subl3
alias vscode=visual-studio-code
alias idea=$HOME/Downloads/idea-IC-145.258.11/bin/idea.sh

# OpenJDK Exports
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export IDEA_JDK=$JAVA_HOME

local succ_face="%{$fg_no_bold[green]%}=*'-'="
local fail_face="%{$fg_no_bold[blue]%}=*;-;="

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
PROMPT="
%{$fg_no_bold[cyan]%}[%n@%M] %{$fg_bold[yellow]%}%~%{$reset_color%}
 %(?.${succ_face}.${fail_face})%{$reset_color%} < "
RPROMPT=$'$(rprompt_hooker)'

# powerline enable
# powerline-daemon -q
# . /usr/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh

# autostart tmux
if $use_tmux; then
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
fi
