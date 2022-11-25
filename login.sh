#!/bin/sh

# Get all the config variables needed.
source $HOME/dotfiles/config.sh

function run_login_scripts {
  for tool_dir in $dotfiles_dir/*
  do
    detect_sh="$tool_dir/detect.sh"

    tool_exists=false
    if [ -s $detect_sh ]; then
      tool_exists=$(source $detect_sh)
    fi

    if $tool_exists; then
      login_sh="$tool_dir/login.sh"
      if [ -s $login_sh ]; then
        source $login_sh
      fi

      login_platform_sh="$tool_dir/login.$platform.sh"
      if [ -s $login_platform_sh ]; then
        source $login_platform_sh
      fi
    fi
  done
}

if $is_login_shell
then
  run_login_scripts
fi
