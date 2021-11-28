#!/bin/sh

if [ -s /opt/homebrew/bin/gpg ] || [ -s /usr/local/bin/gpg ] || [ -s /usr/bin/gpg ]
then
  echo true
else
  echo false
fi
