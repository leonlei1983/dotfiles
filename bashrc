set +h

. /etc/profile
. ~/.git-completion.sh
. ~/.git-prompt.sh

PS1='\u@$PNAME [\[\e[1;31m\]$(__git_ps1)\[\e[0m\] \[\e[32m\]$PWD\[\e[0m\] ]\n$ '

alias ll='ls -lh --color=auto'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

FQDN_DISABLED=$(sed -n '/!fqdn/p' /etc/sudoers | wc -l)
GIT_PS1_SHOWUPSTREAM="auto"

if [ $FQDN_DISABLED -eq 0 ]; then
    echo
    echo "----------------------------------------"
    echo " visudo to add !fqdn to Default options"
    echo " Otherwise, you cannot build properly"
    echo "----------------------------------------"
    echo
fi
