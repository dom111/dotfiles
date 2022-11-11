#!/bin/bash

source bin/.utils.sh;

[ ! -d ./backup ] && mkdir -p ./backup;

has_yum=;
has_apt=;

if which yum > /dev/null; then
    has_yum=1;
fi

if which apt > /dev/null; then
    has_apt=1;
fi

# link files
for file in .bash{rc,_profile} .{vim,input}rc .dir_colors .gitconfig .tmux{.conf,} .lessfilter bin .gitidentities; do
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
if [[ -n $has_yum ]]; then
    warn $(info 'Adding GhettoForce repo...');
    if which rpm > /dev/null; then
        sudo rpm -Uvh http://mirror.ghettoforge.org/distributions/gf/gf-release-latest.gf.el7.noarch.rpm;
        sudo rpm --import http://mirror.ghettoforge.org/distributions/gf/RPM-GPG-KEY-gf.el7;

        if which yum-config-manager > /dev/null; then
            sudo yum-config-manager --enable gf-plus;
        fi
    else
        warn $(error 'Unable to add GhettoForge repo: rpm not found.');
    fi

    warn $(info 'Installing pygments, tmux and vim...');
    sudo yum install python36-pygments tmux vim-enhanced -y;

    if which git > /dev/null; then
        warn $(info 'Installing git...');
        sudo yum install git;
    fi
fi

if [[ -n $has_apt ]]; then
#    sudo apt install 
    warn $(error 'TODO...');
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

