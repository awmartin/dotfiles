# dotfiles

Configuration files for macOS and Linux.

Contains config files intended to work with zshell, bash, and vim.

## Installing

Clone the repo into your home directory.

    cd ~
    git clone https://github.com/awmartin/dotfiles.git dotfiles

Then run the bootstrap script from the dotfiles directory:

    cd ~/dotfiles
    ./bootstrap.sh

## Bootstrap Details

The script assumes that you may have .bashrc, .bash_profile, .profile, and .zshrc files. In the case they exist, the files will have a line appended to them to source the dotfiles config. For example:

    source /Users/username/dotfiles/bash/bash_profile

Other files and folders are backed up, including bin, .vim, .vimrc, etc.

## oh-my-zsh and bash-it

These repos are first both symlinked into the home folder, as per their instructions.

* For oh-my-zsh, a .zshrc template is automatically downloaded if you don't already have one.
* For bash-it, its install.sh script is run automatically.
