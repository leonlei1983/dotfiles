set +h

echo "dotfiles/fuse_setup.sh to setup a clean project"
echo "\"git st\" to replace \"git status\" if you feel the slow respond"

source ~/.git-completion
PS1="[\u@ \w]\$ "

TARGET_TRIPLET=arm-linux-gnueabi
export PATH=/root/CT/${TARGET_TRIPLET}/cross-tools/bin:${PATH}

alias ll='ls -lh --color=auto'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

export CC="${TARGET_TRIPLET}-gcc"
export CXX="${TARGET_TRIPLET}-g++"
export AR="${TARGET_TRIPLET}-ar"
export AS="${TARGET_TRIPLET}-as"
export LD="${TARGET_TRIPLET}-ld"
export RANLIB="${TARGET_TRIPLET}-ranlib"
export READELF="${TARGET_TRIPLET}-readelf"
export STRIP="${TARGET_TRIPLET}-strip"
