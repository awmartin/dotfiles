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

shell='unknown'
if [[ $SHELL = '/bin/bash' ]]
then
  shell='bash'
elif [[ $SHELL = '/bin/zsh' ]]
then
  shell='zsh'
else
  shell='unknown'
fi

is_interactive_shell=false
if [[ $shell = 'bash' ]]
then
  if [[ $- == *i* ]]
  then
    is_interactive_shell=true
  fi
elif [[ $shell = 'zsh' ]]
then
  if [[ -o interactive ]]
  then
    is_interactive_shell=true
  fi
fi

is_login_shell=false
if [[ $shell = 'bash' ]]
then
  if shopt -q login_shell
  then
    is_login_shell=true
  fi
elif [[ $shell = 'zsh' ]]
then
  if [[ -o login ]]
  then
    is_login_shell=true
  fi
fi
