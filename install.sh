#!/bin/bash

function install_vim() {
  # vim 8.2
  git clone https://github.com/vim/vim.git
  cd vim/src
  make
  sudo make install
}

function install_vimrc_mac() {
  ln mac.vimrc ~/.vimrc
  ln tmux.conf ~/tmux.conf
}

function install_plugin_manager() {
  sudo rm -rf ~/.vim/bundle
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
}

function install_plugins() {
  vim +PluginInstall +qall
}

# You can find coc packages here
# https://github.com/neoclide
function install_coc_packages() {
  cd ~/.vim/bundle/coc.nvim && npm i
  vim -c ':CocInstall coc-json coc-tsserver coc-python coc-css coc-yaml coc-prettier coc-git coc-html coc.nvim coc-jedi'
}

function reload_envs() {
  source ~/.bash_profile
  tmux source-file ~/.tmux.conf
}

function install_mac() {
  install_vim
  install_vimrc_mac
  install_plugin_manager
  install_plugins
  install_coc_packages
  reload_envs
}

# Debian

function install_vimrc_debian() {
  ln debian.vimrc ~/.vimrc
  ln tmux.conf ~/tmux.conf
}

function install_debian() {
  install_vim
  install_vimrc_debian
  install_plugin_manager
  install_plugins
  reload_envs
}

"$@"