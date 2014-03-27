#!/bin/bash

default_shell=`echo $SHELL | sed -e "s/.*\///"`

case $default_shell in
    "zsh" )
        echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
        echo 'eval "$(rbenv init -)"' >> ~/.zshrc
        source ~/.zshrc ;;
    "bash" )
        echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
        echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
        source ~/.bash_profile ;;
esac
