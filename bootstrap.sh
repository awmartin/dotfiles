#!/bin/bash

dotfiles_dir="$HOME/dotfiles"

echo
echo "Starting bootstrap process..."
echo

# TODO Decide whether to continue using submodules or support installing separately instead.

# Update the git submodules in the dotfiles folder.
# Ref: http://stackoverflow.com/questions/592620/check-if-a-program-exists-from-a-bash-script
# if hash git 2>/dev/null; then
#   echo "Initializing all the git submodules."
#   echo

#   cd $dotfiles_dir
#   git submodule init
#   git submodule update
#   cd -
# else
#   echo "Install git to initialize the submodules. Then run:"
#   echo "  git submodule init"
#   echo "  git submodule update"
#   echo "from the dotfiles directory."
#   echo
#   echo "Then run the ~/bash-it/install.sh script if you want to install bash-it."
# fi
# echo

echo "Bootstrap complete."
echo "Check .bak files to see if there are any commands there that need to be copied."
ls *.bak 2>/dev/null
echo
