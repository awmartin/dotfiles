#!/bin/sh

# Sets the config variables needed for any of the scripts.

uname=$(uname)
PLATFORM='unknown'
if [[ $uname = 'Darwin' ]]
then
  PLATFORM='darwin'
elif [[ $uname = 'Linux' ]]
then
  PLATFORM='linux'
else
  PLATFORM='unknown'
fi

export PLATFORM
