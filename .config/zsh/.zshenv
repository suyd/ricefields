PATH=$PATH:$HOME/.local/bin:$HOME/.config/emacs/bin/:$HOME/.cargo/bin
export PATH

export VISUAL=nvim
export EDITOR="$VISUAL"

# ~/ Clean-up:
export ZDOTDIR=${ZDOTDIR:-~/.config/zsh}
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export LESSHISTFILE=-
