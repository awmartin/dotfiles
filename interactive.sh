#!/bin/sh

# Get all the config variables needed.
source $HOME/dotfiles/config.sh

tools=( $dotfiles_dir/* )
for tool_dir in $tools; do
  detect_sh="$tool_dir/detect.sh"

  tool_exists=false
  if [ -s $detect_sh ]; then
    tool_exists=$(source $detect_sh)
  fi

  if $tool_exists; then
    interactive_sh="$tool_dir/interactive.sh"
    if [ -s $interactive_sh ]; then
      source $interactive_sh
    fi

    interactive_platform_sh="$tool_dir/interactive.$platform.sh"
    if [ -s $interactive_platform_sh ]; then
      source $interactive_platform_sh
    fi
  fi
done
