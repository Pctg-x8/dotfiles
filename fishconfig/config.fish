set -l ScriptPath (dirname (status -f))

set -x GPG_TTY (tty)
set -x EDITOR (which vim)

source $ScriptPath/prompt.fish
source $ScriptPath/local-aliases.fish
source $ScriptPath/local-path.fish

