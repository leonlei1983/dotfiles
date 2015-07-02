set +h

. /etc/profile
. ~/.git-completion
PS1="[\u@$PNAME  \w]\$ "

alias ll='ls -lh --color=auto'
alias ls='ls --color=auto'
alias grep='grep --color=auto'