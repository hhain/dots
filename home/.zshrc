# Created by newuser for 5.7.1

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

alias icat="kitty +kitten icat"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
