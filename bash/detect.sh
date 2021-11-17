#!/bin/sh

if [ -e "/bin/bash" ] && [ $SHELL = '/bin/bash' ]
then
  echo true
else
  echo false
fi
