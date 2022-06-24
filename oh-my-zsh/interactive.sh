# Make git file completion faster.
# http://talkings.org/post/5236392664/zsh-and-slow-git-completion
__git_files () {
    _wanted files expl 'local files' _files
}

# Fixes a problem with hat notation in git from zsh, e.g. git reset HEAD^
# This passes the bad match onto the command.
# http://github.com/robbyrussell/oh-my-zsh/issues/449
unsetopt nomatch

# Don't share history. It's a security risk.
unsetopt share_history

export ZSH="$HOME/util/oh-my-zsh"

# Options for the interactive zsh experience.
ZSH_THEME="smt"
HIST_STAMPS="yyyy-mm-dd"
DISABLE_AUTO_UPDATE="true"

# Load plugins.
plugins=(git)

source $ZSH/oh-my-zsh.sh
