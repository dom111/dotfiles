# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc;
fi

if [[ -e ~/bin/git-prompt-basic.sh ]]; then
    source ~/bin/git-prompt-basic.sh;
fi

if [[ -e ~/bin/brand-completion.bash ]]; then
    source ~/bin/brand-completion.bash;
fi

bind -f ~/.inputrc;

# monokai colours
BLUE="\[\e[38;5;81m\]";
PURPLE="\[\e[38;5;141m\]";
GREEN="\[\e[38;5;154m\]";
YELLOW="\[\e[38;5;186m\]";
RED="\[\e[38;5;197m\]";
RESET="\[\e[0m\]";

EDITOR="vim";
PS1="$BLUE\u$PURPLE@$GREEN\h$YELLOW\$(__git_ps1 ' [%s]') $RED\w $PURPLE\\\$$RESET";
# PS1="\[\e[49;38;5;209m\]\u\[\e[49;38;5;229m\]@\[\e[49;38;5;81m\]\h\[\e[49;38;5;149m\]\$(__git_ps1 ' [%s]') \[\e[49;38;5;209m\]\w \[\e[49;38;5;229m\]\$\[\e[0m\]";
SERVER_ROOT=/home/dhastings/perlgem/server/apache2;
SERVER_PREFIX=dhastings;
ENVIRONMENT=eng;
EDITOR=vim;
INPUTRC=~/.inputrc; # custom keymaps (fix home/end, and force case-insensitivity)
LESS='-RNF'; # R - raw control codes (colours), N - line numbers, F - auto quit if one screen
LESSOPEN='|~/.lessfilter %s'; # adds syntax highlighting to less

# Add DEV/STAGE servers in here...
if [[ `hostname` =~ 'njlemea0[123]|njldevdrp02' ]]; then
    DATACENTER=;
elif [[ `hostname` =~ 'drp' ]]; then
    DATACENTER=drupal;
else
    DATACENTER=secaucus;
fi

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
    TERM='xterm-256color';
else
    TERM='xterm-color';
fi

GREP_COLORS="sl=38;5;255;48;5;237:cv=38;5;255;48;5;237:mt=30;48;5;186:fn=38;5;197:ln=38;5;154:bn=38;5;154:se=38;5;81";

export EDITOR PS1 SERVER_ROOT SERVER_PREFIX ENVIRONMENT EDITOR;
export INPUTRC LESS LESSOPEN DATACENTER TERM GREP_COLORS;

# use newer version of vim
if [[ -e /usr/local/bin/vim ]]; then
    alias vim='/usr/local/bin/vim';
fi

alias cd='pwd >> ~/.dir_history; echo "$(tail -5000 ~/.dir_history)" > ~/.dir_history; builtin cd';
alias d='command-palette ~/bin/cd-helper-save "$(sort ~/.dir_history | uniq -c | sort -k1,1nr -k2 | sed "s/^ *[0-9]* //")" && cd "$(cat ~/.cd)"';
alias h='command-palette "" "$(history | cut -c 8- | sort | uniq -c | sort -k1,1nr -k2 | sed "s/^ *[0-9]* //")"';
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

if [[ $(hostname) = *"drp"* ]] && [[ -t 1 ]]; then
    nvm use 7.7.1;
fi

