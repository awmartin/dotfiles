#!/bin/sh

if [ -s /usr/bin/git ] || [ -s /usr/local/bin/git ] || [ -s /opt/homebrew/bin/git ]
then
  echo true
else
  echo false
fi
