# dotfiles

Some configuration files for macOS and Linux intended to be intuitively extensible and support an easy choose-your-own-adventure experience.

## Structure

Top level folders are tools with their own configurations. The following folders and files are optional but carry various purposes:

- `tool/bin/` - Folder of scripts placed into the PATH.
- `tool/home/` - Folder of files symlinked into $HOME.
- `tool/interactive.sh` - File included with all interactive shells, namely `.zshrc` and `.bashrc`.
- `tool/env.sh` - File included to set the environment for all shells, e.g. `.zshenv`.
- `tool/login.sh` - File included in all login shells, e.g. `.zprofile` and `.profile` or `.bash_profile`. This is not executed with `.zlogin`.
- `tool/detect.sh` - Returns `true` or `false` to return whether the given tool is installed. `false` is assumed if this file is missing.
- `tool/install.sh` - Script that installs the given tool, taken from the tool's latest-ish instructions.

All of these files can be qualified with `.darwin.sh` or `.linux.sh` to only execute them on the respective operating systems. E.g. `interactive.darwin.sh`. 

## Installing

Clone the repo into your home directory.

    cd ~
    git clone https://github.com/awmartin/dotfiles.git dotfiles

Then run the bootstrap script from the dotfiles directory:

    cd ~/dotfiles
    ./bootstrap.sh

The script looks at your current shell and backs up any relevant scripts first. For example, for zsh, it looks for .zshenv, .zprofile, .zshrc, .zlogin, and .zlogout. It then adds a source command to load the relevant script in the repo.

## Initialization

For `zsh`, the scripts in the base directory are loaded in the following order:

- `.zshenv` - Loads `dotfiles/env.sh` (environment for all shells, then subsequently, `env.darwin.sh` or `env.linux.sh`)
- `.zprofile` - Loads `dotfiles/login.sh` (for login shells)
- `.zshrc` - Loads `dotfiles/interactive.sh` (for interactive shells)
- `.zlogin` - Ignored for now.
- `.zlogout` - Ignored for now.

On macOS, `zsh` initializes in this order:

    /etc/zshrc > ~/.zshrc > /etc/zprofile > ~/.zprofile > ~/.zlogin

There is no `/etc/zlogin` by default on macOS Monterey. The interesting part is macOS loads the default `PATH` and `MANPATH` variables in `/etc/zprofile`, which means any paths set in the `zshrc` files won't get precedence. This means `zprofile` (and in this repo, `login.sh` files) is needed for setting paths for precedence. One would need to specify `--login` to create a new login shell if executing `zsh` within another shell to load `zprofile`.

Bash notes TBD.
