#!/bin/sh

if [ -s /opt/homebrew/bin/conda ]
then
  echo true
else
  echo false
fi
