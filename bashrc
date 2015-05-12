set +h

echo "***********************************************************"
echo "Please modify your name & email of the gitconfig in dotfiles/overlay_setup.sh"
echo "dotfiles/overlay_setup.sh to setup a clean project"
echo "***********************************************************"

source ~/.git-completion
PS1="[\u@ \w]\$ "

alias ll='ls -lh --color=auto'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

unset CC CXX AR AS LD RANLIB READELF STRIP OBJDUMP OBJCOPY
export CC CXX AR AS LD RANLIB READELF STRIP OBJDUMP OBJCOPY
