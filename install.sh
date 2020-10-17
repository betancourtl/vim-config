#!/bin/bash

function install_vim_config() {
  ln .vimrc ~/.vimrc
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
  vim -c ':CocInstall coc-json coc-tsserver coc-python coc-css coc-yaml coc-prettier coc-git coc-html coc.nvim'
}

function reload_envs() {
  source ~/.bash_profile
  tmux source-file ~/.tmux.conf
}

install_vim_config
install_plugin_manager
install_plugins
install_coc_packages
reload_envs
