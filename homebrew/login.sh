#!/bin/sh

# For homebrew binaries to have precedence, this needs to be loaded after /etc/zprofile,
# thus, in zlogin. However, this means non-login shells won't have homebrew binaries.
#
# In some cases, we can work around this. For example, if spawning a zsh from a zsh session,
# you can use use zsh --login to start a login shell.
eval "$(/opt/homebrew/bin/brew shellenv)"

