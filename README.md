# dotfiles

Some configuration files for macOS and Linux intended to be intuitively extensible and support an easy choose-your-own-adventure experience.

## Installing

Clone the repo into your home directory.

    cd ~
    git clone https://github.com/awmartin/dotfiles.git dotfiles

Then run the bootstrap script from the dotfiles directory:

    cd ~/dotfiles
    ./bootstrap.sh

## Bootstrap Details

The script looks at your current shell and backs up any relevant scripts first. For example, for zsh, it looks for .zshenv, .zprofile, .zshrc, .zlogin, and .zlogout.

It then adds a source command to load the relevant script in the repo.
