#!/bin/bash

source bin/.utils.sh;

[ ! -d ./backup/.ssh ] && mkdir -p ./backup/.ssh;

# link files
for file in .bash{rc,_profile} .vim{rc,} .dir_colors .gitconfig .inputrc .tmux.conf .lessfilter; do
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
    warn $(error -n "Couldn't·automatically·update '")$(info -n '~/.ssh')$(error -n "'. Please update this file manually.");
fi

# install fzf
warn $(info "Installing fzf...");
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf;
~/.fzf/install --all;

# add in necessary packages
# if CentOS:
warn $(info "Installing pygments...");
sudo yum install python3-pygments -y;

# set up vim
vim +PluginInstall +qall;

source ~/.bash_profile;
