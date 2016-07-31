#!/bin/sh

# Creates symlinks from $HOME into dotfiles.
# TODO: Maybe this should append source commands to existing files instead?

dotfiles_dir="$HOME/dotfiles"
dotfiles_home_dir="$dotfiles_dir/home"

toplevel_folders_link_without_dots=( "bin" )
toplevel_folders_link_with_dots=( "vim" "oh-my-zsh" "env" "shell" )
files_link_with_dots=`ls -1 $dotfiles_home_dir`

for folder in $toplevel_folders_link_without_dots; do
  # Back up the existing folder.
  if [ -d "$HOME/$folder" ]; then
    mv "$HOME/$folder" "$HOME/$folder.backup"
  fi

  ln -s "$dotfiles_dir/$folder" "$HOME/$folder"
done

for folder in $toplevel_folders_link_with_dots; do
  # Back up the existing dot-prefixed folder.
  if [ -d "$HOME/.$folder" ]; then
    mv "$HOME/.$folder" "$HOME/.$folder.backup"
  fi

  ln -s "$dotfiles_dir/$folder" "$HOME/.$folder"
done

for file in $files_link_with_dots; do
  # Back up the existing dotfile.
  if [ -e "$HOME/.$file" ]; then
    mv "$HOME/.$file" "$HOME/.$file.backup"
  fi

  ln -s "$dotfiles_home_dir/$file" "$HOME/.$file"
done


# Update the git submodules in the dotfiles folder.
# Ref: http://stackoverflow.com/questions/592620/check-if-a-program-exists-from-a-bash-script
if hash git 2>/dev/null; then
  cd $dotfiles_dir
  git submodule init
  git submodule update
  cd -
else
  echo "Install git to initialize the submodules. Then run:"
  echo "  git submodule init"
  echo "  git submodule update"
  echo "from the dotfiles directory"
fi

echo
echo "Bootstrap complete."
echo "Check .backup files for .zshrc, .bashrc, .profile, .bash_profile, to see if there"
echo "are config commands in those files that need to be loaded as well."
echo
