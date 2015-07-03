#!/bin/bash

######################################################
# This script creates symlinks from the 
# home directory to any desired dotfiles in ~/dotfiles
#####################################################

# dotfiles directory
dir=dotfiles

# list of files/folders to symlink in homedir
files="screenrc bashrc git-completion"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Creating symlink to $file in container's home directory."
    ln -sf $dir/$file .$file
done

# for screen openning shell
ln -sf .bashrc .bash_profile
