# default editor
export VISUAL=vim
export EDITOR="$VISUAL"

# bash prompt
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]'

# Add git status
if [ -f ~/opt/scripts/git-prompt.sh ]; then
    . ~/opt/scripts/git-prompt.sh
    export GIT_PS1_SHOWDIRTYSTATE=1
    export PS1=$PS1'$(__git_ps1 " (%s)") '
fi

# bash prompt symbol
export PS1=$PS1'\$ '
