#!/bin/sh

if [ -s "/opt/homebrew/bin/brew" ]; then
  echo true
else
  echo false
fi
