# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc;
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
bind -f ~/.inputrc;

EDITOR="vim";
INPUTRC=~/.inputrc; # custom keymaps (fix home/end, and force case-insensitivity)
LESS='-RNF'; # R - raw control codes (colours), N - line numbers, F - auto quit if one screen
LESSOPEN='|~/.lessfilter %s'; # adds syntax highlighting to less

export EDITOR INPUTRC LESS LESSOPEN;

source ~/bin/git-prompt-basic.sh;
source ~/bin/.utils.sh;

if [[ -f ~/bin/command-not-found ]]; then
    function command_not_found_handle {
        ~/bin/command-not-found $@;
    }
fi

TERM=xterm-256color;
PS1='\[\e[38;5;81m\]\u\[\e[38;5;141m\]@\[\e[38;5;154m\]\h\[\e[38;5;186m\]$(__git_ps1 " [%s]") \[\e[38;5;197m\]\w \[\e[38;5;141m\]\$\[\e[0m\]';

export TERM PS1;

alias grep="grep --exclude=*{compressed,min}.{js,css} --colour -sIP";
alias ls='ls --color=auto';

if [ -t 1 ] ; then
    set -o emacs;

    if [[ `which dircolors 2>&1` ]] && [[ -e ~/.dir_colors ]]; then
        eval $(dircolors -b ~/.dir_colors);
    fi

    # make any key restart after ^S
    stty ixany;
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash;

