#!/bin/sh

dotfiles_dir="$HOME/dotfiles"
dotfiles_home_dir="$dotfiles_dir/home"

# These files will be linked without a leading dot.
toplevel_folders_link_without_dots=( "bin" )
toplevel_folders_link_with_dots=( "vim" )
files_link_with_dots=`ls -1 $dotfiles_home_dir`

for folder in $toplevel_folders_link_without_dots; do
  # Back up the existing folder.
  if [ -d "$HOME/$folder" ]; then
    mv "$HOME/$folder" "$HOME/$folder.backup"
  fi

  ln -s "$dotfiles_dir/$folder" "$HOME/$folder"
done

for folder in $toplevel_folders_link_with_dots; do
  # Back up the existing folder.
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
cd $dotfiles_dir
git submodule init
git submodule update
cd -
