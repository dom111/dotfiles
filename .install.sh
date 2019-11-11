#!/bin/bash

source bin/.utils.sh;

[ ! -d ./backup ] && mkdir -p ./backup;

# link files
for file in .bash{rc,_profile} .{vim,input}rc .dir_colors .gitconfig .tmux{.conf,} .lessfilter bin; do
    if [ -f ~/${file} ]; then
        warn "$(warning -n "Moving '")$(info -n "~/${file}")$(warning -n "' to '")$(info -n "./backup/${file}")$(warning -n "'...")";
        mv ~/${file} ./backup/${file};
    fi

    warn "$(warning -n "Linking '")$(info -n "~/${file}")$(warning -n "' to '")$(info -n "${pwd}/${file}")$(warning -n "'...")";
    ln -s $(pwd)/${file} ~/${file};
done

if [ ! -d ~/.ssh ]; then
    warn "$(warning -n "Copying '")$(info -n "./.ssh")$(warning -n "' to '")$(info -n "~/.ssh")$(warning -n "'...")";
    mkdir ~/.ssh;
    cp ./.ssh/config ~/.ssh/config;
elif [ ! -f ~/.ssh/config ]; then
    warn "$(warning -n "Copying '")$(info -n "./.ssh")$(warning -n "' to '")$(info -n "~/.ssh")$(warning -n "'...")";
    cp ./.ssh/config ~/.ssh/config;
else
    warn $(error -n "Couldn't automatically update '")$(info -n '~/.ssh')$(error -n "'. Please update this file manually.");
fi

# add in necessary packages
# if CentOS:
warn $(info 'Installing pygments, tmux and vim...');
if which yum > /dev/null; then
    sudo yum install python36-pygments tmux vim-enhanced -y;
else
    warn $(error 'Install Pygments, tmux and vim, then `exit` back to continue installation...');
fi

# install fzf
warn $(info 'Setting up fzf...');
git clone -q --depth 1 https://github.com/junegunn/fzf.git ~/.fzf;
~/.fzf/install --all;

# set up vim
warn $(info 'Setting up vim...');
mkdir -p ~/.vim/bundle;
git clone -q https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim;

vim +PluginInstall +qall;

exec bash;

