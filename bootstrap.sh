#!/bin/bash

dotfiles_dir="$HOME/dotfiles"

echo
echo "Starting bootstrap process..."
echo

if [ $SHELL = '/bin/zsh' ]
then
  echo "Found zsh is current shell. Installing relevant files."

  # Configure .zshenv to load env.sh.
  echo "  Installing env.sh into .zshenv"

  if [ ! -s "$HOME/.zshenv" ]
  then
    touch $HOME/.zshenv
    printf "# Created by awmartin/dotfiles" >> $HOME/.zshenv
  else
    echo "  Creating a backup of .zshenv as .zshenv.bak"
    cp $HOME/.zshenv $HOME/.zshenv.bak
  fi

  printf "\n\n# Added by awmartin/dotfiles\nsource \$HOME/dotfiles/env.sh\n" >> $HOME/.zshenv

  # Configure .zshrc to load interactive.sh.
  echo "  Installing interactive.sh into .zshrc"

  if [ ! -s "$HOME/.zshrc" ]
  then
    touch $HOME/.zshrc
    printf "# Created by awmartin/dotfiles" >> $HOME/.zshrc
  else
    echo "  Creating a backup of .zshrc as .zshrc.bak"
    cp $HOME/.zshrc $HOME/.zshrc.bak
  fi

  printf "\n\n# Added by awmartin/dotfiles\nsource \$HOME/dotfiles/interactive.sh\n" >> $HOME/.zshrc

  # Configure .zprofile to load login.sh.
  echo "  Installing login.sh into .zprofile"

  if [ ! -s "$HOME/.zprofile" ]
  then
    touch $HOME/.zprofile
    printf "# Created by awmartin/dotfiles" >> $HOME/.zprofile
  else
    echo "  Creating a backup of .zprofile as .zprofile.bak"
    cp $HOME/.zprofile $HOME/.zprofile.bak
  fi

  printf "\n\n# Added by awmartin/dotfiles\nsource \$HOME/dotfiles/login.sh\n" >> $HOME/.zprofile
fi

echo
echo "Bootstrap complete."
echo
