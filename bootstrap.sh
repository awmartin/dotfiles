
dotfiles_dir=$HOME/dotfiles

# These files will be linked without a leading dot.
non_dot_files=( "bin" )

# These files will not be linked at all.
ignore_files=( "bootstrap.sh" "README.md" )

# Gather the names of all the top-level files and folders in this directory.
files=`ls -1 ${dotfiles_dir}`

# Write a single symlink.
write() {
    non_dot=0

    for name in $non_dot_files; do
        if [ "$1" = "$name" ]; then

            # If this file exists, rename it to file.old.
            if [ -e "$HOME/$1" ]; then
                mv "$HOME/$1" "$HOME/$1.old"
            fi

            ln -s "$dotfiles_dir/$1" "$HOME/$1"
            non_dot=1
        fi
    done

    # This file is a hidden file, so the symlink should have a dot.
    if [ $non_dot -eq 0 ]; then

        # If .file exists, rename it to .file.old.
        if [ -e "$HOME/.$1" ]; then
            mv "$HOME/.$1" "$HOME/.$1.old"
        fi

        ln -s "$dotfiles_dir/$1" "$HOME/.$1"
    fi
}

for file in $files; do
    should_ignore=0

    for name in $ignore_files; do
        if [ "$file" = "$name" ]; then
            should_ignore=1
        fi
    done

    if [ $should_ignore -eq 0 ]; then
        write $file
    fi
done

