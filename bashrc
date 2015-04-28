set +h

echo "***********************************************************"
echo "dotfiles/fuse_setup.sh to setup a clean project"
echo "\"git st\" to replace \"git status\" if you got slow response"
echo "***********************************************************"

source ~/.git-completion
PS1="[\u@ \w]\$ "

alias ll='ls -lh --color=auto'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

unset CC CXX AR AS LD RANLIB READELF STRIP OBJDUMP OBJCOPY
export CC CXX AR AS LD RANLIB READELF STRIP OBJDUMP OBJCOPY
