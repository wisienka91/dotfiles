#!/bin/bash

#zsh install
echo 'Installing zsh...'
sudo apt-get install zsh

echo 'Installing git-core...'
sudo apt-get install git-core

echo 'Installing oh-my-zsh...'
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

echo '.Zshrc cleanup...'
rm -rf ~/.zshrc

