#!/bin/sh

alias showall="defaults write com.apple.finder AppleShowAllFiles TRUE"
alias hideall="defaults write com.apple.finder AppleShowAllFiles FALSE"

alias listports="sudo lsof -i -P | grep -i \"listen\""
