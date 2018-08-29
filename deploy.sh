#!/usr/bin/env bash

# check git and npm
(command -v git >/dev/null 2>&1) || {
  echo >&2 "You first need to have git installed. Aborting.";
  exit 1;
}

vundle=~/.vim/bundle/Vundle.vim

# Download "VundleVim/Vundle.vim" Vim Plugin Manager
if [ ! -d "$vundle" ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git "$vundle"
fi

cp .vimrc ~/

# PluginInstall: "VundleVim/Vundle.vim" plugin's install command.
vim +PluginInstall +qall

cp -rf colors ~/.vim/

