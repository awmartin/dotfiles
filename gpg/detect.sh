#!/bin/sh

if [ -s /opt/homebrew/bin/gpg ] || [ -s /usr/local/bin/gpg ]
then
  true
else
  false
fi
