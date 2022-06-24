#!/bin/sh

# Get all the config variables needed.
source $HOME/dotfiles/config.sh

tools=( "$dotfiles_dir/*" )
for tool_dir in $tools; do
  if [ -d "$tool_dir" ]; then
    detect_sh="$tool_dir/detect.sh"

    tool_exists=false
    if [ -s $detect_sh ]; then
      tool_exists=$(source $detect_sh)
    fi

    if $tool_exists; then
      env_sh="$tool_dir/env.sh"
      if [ -s $env_sh ]; then
        source $env_sh
      fi

      env_platform_sh="$tool_dir/env.$platform.sh"
      if [ -s $env_platform_sh ]; then
        source $env_platform_sh
      fi

      tool_bin_dir="$tool_dir/bin"
      if [ -d $tool_bin_dir ]; then
        PATH="$tool_bin_dir:$PATH"
      fi
    fi
  fi
done

export PATH
