#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=dotfiles                    # dotfiles directory
files="screenrc bashrc gitconfig git-completion"    # list of files/folders to symlink in homedir

##########

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Creating symlink to $file in container's home directory."
    ln -sf $dir/$file .$file
done

echo
echo "Please modify /home/$USER/working/.gitconfig RIGHT NOW before using the containers."
echo
