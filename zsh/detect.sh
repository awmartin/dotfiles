#!/bin/sh

if [ -e "/bin/zsh" ] && [ $SHELL = '/bin/zsh' ]
then
  echo true
else
  echo false
fi
