# ------------------------- paths --------------------------
set -x GOPATH $HOME/go

set PATH \
	$HOME/.cargo/bin \
	/usr/local/opt/make/libexec/gnubin \
	/usr/local/opt/go/libexec/bin \
	$GOPATH/bin \
	/usr/local/opt/gettext/bin \
	$HOME/.rbenv/bin \
	$HOME/.nodebrew/current/bin \
	$HOME/Library/Python/*/bin \
	$PATH

# ------------------- env -----------------------------------
set -x EDITOR nvim
set -x VISUAL nvim
set -x HOMEBREW_EDITOR $EDITOR
set -x BREW_EDITOR $EDITOR
set -x XDG_CONFIG_HOME $HOME/.config
set -x TERM xterm-256color
set -x fish_term24bit 1
set -x GO15VENDOREXPERIMENT 1
set -x LC_ALL ja_JP.UTF-8

# ------------------------------ aliases ------------------------
alias .. 'cd ../'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias chrome 'open -a "google chrome"'

# ------------------ other settings -----------------------------
set -U theme_display_user on
bind \cr 'peco_select_history (commandline -b)'

# ruby init
eval (rbenv init - | source)

