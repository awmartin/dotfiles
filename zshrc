# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="smt"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want disable red dots displayed while waiting for completion
# DISABLE_COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

# Make git file completion faster.
# http://talkings.org/post/5236392664/zsh-and-slow-git-completion
__git_files () { 
    _wanted files expl 'local files' _files 
}


export RUBYOPT="rubygems"

export LC_CTYPE="en_US.UTF-8"

export WREN="$HOME/projects/wren"
export FORA="$HOME/projects/fora/src"

export PYTHONPATH="$FORA:$PYTHONPATH"
export FORAPATH="$FORA/../fora_playground"

for dir in "$HOME/bin" /usr/local/bin /usr/texbin "$HOME/local/godi/bin" "$HOME/local/godi/sbin"; do
    if [ -d "$dir" ]; then
        #case "$PATH" in
        #    *"$dir"*) ;;
        #    *) PATH="$dir:$PATH" ;;
        #esac
        PATH="$dir:$PATH"
    fi
done

# Lower priority PATH
for dir in "$HOME/.rvm/bin" "$WREN/bin" "$FORA/bsa/scripts" "/usr/lib/llvm-2.7/bin" "$HOME/packages/depot_tools"; do
    if [ -d "$dir" ]; then
        case "$PATH" in
            *:"$dir":*|*:"$dir"|"$dir":*|"$dir") ;;
            *) PATH="$PATH:$dir" ;;
        esac
    fi
done

MANPATH="$HOME/local/godi/man:$MANPATH"

export PATH MANPATH

# Put all super-secret stuff in .localrc
for file in "$ZSH/oh-my-zsh.sh" "$HOME/.rvm/scripts/rvm" "$HOME/.localrc"; do
    if [ -e "$file" ]; then
        source ${file}
    fi
done


# Handle platform-specific configurations.

if [ -e "/Users" ]; then
    # We're likely on Mac OS.
    source $HOME/.osx
fi

if [[ ! -e "/Users" && -e "/home" ]]; then
    # We're likely on Linux
    source $HOME/.ubuntu
fi

# Put these last to override the oh-my-zsh defaults. "tree" doesn't exist on OSX.
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias listports="sudo lsof -i -P | grep -i \"listen\""

# Heroku shortcuts
alias heroc="ruby $HOME/bin/heroku-credentials.rb"
alias heros="ruby $HOME/bin/heroku-switcher.rb"

# Fixes a problem with hat notation in git from zsh, e.g. git reset HEAD^
# This passes the bad match onto the command.
# http://github.com/robbyrussell/oh-my-zsh/issues/449
unsetopt nomatch

# HACK: Keeps a strange error from appearing when launching gvim.
# https://bugs.launchpad.net/ubuntu/+source/vim/+bug/776499
export UBUNTU_MENUPROXY=0

