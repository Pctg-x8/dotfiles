set -l ScriptPath (dirname (status -f))

set -x GPG_TTY (tty)
set -x EDITOR (which vim)

if status is-interactive; and [ (uname) = "Darwin" ]
	eval (/opt/homebrew/bin/brew shellenv)
end

if not functions -q fundle
	eval (curl -sfL https://git.io/fundle-install)
end

fundle plugin "edc/bass"

source $ScriptPath/prompt.fish
source $ScriptPath/local-aliases.fish
source $ScriptPath/local-path.fish

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# pnpm
set -gx PNPM_HOME "/Users/pctgx8/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /Users/pctgx8/.ghcup/bin $PATH # ghcup-env
