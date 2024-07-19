#!/bin/sh

if [ -s $HOME/.cargo/bin ]
then
  echo true
else
  echo false
fi
