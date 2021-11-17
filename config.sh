#!/bin/sh

# Sets the config variables needed for any of the scripts.

uname=$(uname)
platform='unknown'
if [[ $uname = 'Darwin' ]]
then
  platform='darwin'
elif [[ $uname = 'Linux' ]]
then
  platform='linux'
else
  platform='unknown'
fi

dotfiles_dir="$HOME/dotfiles"
