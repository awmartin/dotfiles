#!/bin/sh

echo
echo "Starting bootstrap process..."
echo

dotfiles_dir="$HOME/dotfiles"

# First, append all the bash scripts to existing bash scripts if found.
dotfiles_bash_dir="$dotfiles_dir/bash"

bash_files=( "bash_profile" "bashrc" "profile" )
for file in $bash_files; do
  if [ -f "$HOME/.$file" ]; then
    # If the file exists, source the dotfiles file at the end.
    echo "Appending: source \"dotfiles/bash/$file\" to ~/.$file"
    echo -e "\nsource \"$dotfiles_bash_dir/$file\"" >> "$HOME/.$file"
  else
    # Otherwise, copy it from dotfiles/bash.
    echo "~/.$file didn't exist. Copying from dotfiles/bash/$file"
    cp "$dotfiles_bash_dir/$file" "$HOME/.$file"
  fi
done

echo


# Zshell is similar, but include a template .zshrc if it doesn't already exist.
dotfiles_zsh_dir="$HOME/dotfiles/zsh"

if [ ! -f "$HOME/.zshrc" ]; then
  echo "~/.zshrc not found. Getting template from github.com/robbyrussell/oh-my-zsh"
  curl -s "https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/templates/zshrc.zsh-template" > $HOME/.zshrc
fi

# And append sourcing the contents of the customizations.
echo "Appending: source \"dotfiles/zsh/zshrc\" to .zshrc"
echo -e "\nsource \"$dotfiles_zsh_dir/zshrc\"" >> $HOME/.zshrc
echo


# Links a subset of folders to $HOME.
toplevel_folders_link_without_dots=( "bin" )

for folder in $toplevel_folders_link_without_dots; do
  # Back up the existing folder.
  if [ -d "$HOME/$folder" ]; then
    echo "Backing up ~/$folder"
    mv "$HOME/$folder" "$HOME/$folder.bak"
  fi

  echo "Symlinking ~/$folder to dotfiles/$folder"
  ln -s "$dotfiles_dir/$folder" "$HOME/$folder"
done

echo


# Links a subset of folders to their dot equivalents in $HOME.
toplevel_folders_link_with_dots=( "vim" "oh-my-zsh" "env" "shell" "bash-it" )

for folder in $toplevel_folders_link_with_dots; do
  # Back up the existing dot-prefixed folder.
  if [ -d "$HOME/.$folder" ]; then
    echo "Backing up ~/.$folder"
    mv "$HOME/.$folder" "$HOME/.$folder.bak"
  fi

  echo "Symlinking ~/.$folder to dotfiles/$folder"
  ln -s "$dotfiles_dir/$folder" "$HOME/.$folder"
done

echo


# Creates dot-symlinks from $HOME to all files in the dotfiles/home folder.
dotfiles_home_dir="$dotfiles_dir/home"
files_link_with_dots=`ls -1 $dotfiles_home_dir`

for file in $files_link_with_dots; do
  # Back up the existing dotfile.
  if [ -e "$HOME/.$file" ]; then
    echo "Backing up ~/.$file"
    mv "$HOME/.$file" "$HOME/.$file.bak"
  fi

  echo "Symlinking ~/.$file to dotfiles/home/$file"
  ln -s "$dotfiles_home_dir/$file" "$HOME/.$file"
done


# Update the git submodules in the dotfiles folder.
# Ref: http://stackoverflow.com/questions/592620/check-if-a-program-exists-from-a-bash-script
if hash git 2>/dev/null; then
  echo
  echo "Initializing all the git submodules."
  echo

  cd $dotfiles_dir
  git submodule init
  git submodule update
  cd -
else
  echo
  echo "Install git to initialize the submodules. Then run:"
  echo "  git submodule init"
  echo "  git submodule update"
  echo "from the dotfiles directory"
fi

echo
echo "Bootstrap complete."
echo "Check .bak files to see if there are any commands there that need to be copied."
ls .*.bak
echo
