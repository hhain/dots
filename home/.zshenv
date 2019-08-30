#!/bin/zsh

export BACKEND=wayland

# test -f ${XDG_CONFIG_HOME:-~/.config}/user-dirs.dirs && source ${XDG_CONFIG_HOME:-~/.config}/user-dirs.dirs
# Manually set base user and system directories
#
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIG_DIRS=/etc/xdg


# Set default editor
if [[ -x $(which nvim 2> /dev/null) ]]; then
    export EDITOR="nvim"
    export USE_EDITOR=$EDITOR
    export VISUAL=$EDITOR
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"
export CFLAGS='-O2'

# 3D and HW Accelleration Support
export LIBVA_DRIVER_NAME="iHD"
export VDPAU_DRIVER="va_gl"

# Force GTK to use wayland
#export CLUTTER_BACKEND=wayland  # results in issues with electron apps mainly
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORM="$BACKEND-egl"
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export QT_WAYLAND_FORCE_DPI=physical
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export BEMENU_BACKEND=$BACKEND
#export GDK_BACKEND=$BACKEND  # problematic with chromium and other "x-something apps"
export CLUTTER_BACKEND=$BACKEND
export SDL_VIDEODRIVER=$BACKEND
export ECORE_EVAL_ENGINE=wayland_egl
export ELM_ENGINE=wayland_egl
export MOZ_ENABLE_WAYLAND=1
export XDG_CURRENT_DESKTOP=Unity

# General Aliase
alias "cat=bat"
alias "icat=kitty +kitten icat"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export GO_ROOT="$HOME/go"
export PATH="$GO_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

eval "$(fasd --init auto)"

export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
