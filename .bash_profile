PATH=$PATH:$HOME/.local/bin
export PATH
export EDITOR="/usr/bin/nvim"

# ~/ Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export CARGO_HOME="$XDG_DATA_HOME/cargo"

export LESSHISTFILE=-



[[ -f ~/.bashrc ]] && . ~/.bashrc
