# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc;
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -t 1 ] && [ -e ~/.inputrc ]; then
    bind -f ~/.inputrc;
fi

EDITOR="vim";
INPUTRC=~/.inputrc; # custom keymaps (fix home/end, and force case-insensitivity)
LESS='-XRNF'; # R - raw control codes (colours), N - line numbers, F - auto quit if one screen
LESSOPEN='|~/.lessfilter %s'; # adds syntax highlighting to less
HISTCONTROL=ignoredups;
HOST_IP=$(ip addr show dev wlo1 | grep 'inet ' | awk '{print $2}' | sed -e 's!/24!!')

export EDITOR INPUTRC LESS LESSOPEN HISTCONTROL HOST_IP;

if [ -e ~/bin/.utils.sh ]; then
    source ~/bin/.utils.sh;
fi

if [[ -e /usr/share/bash-completion/completions/git ]]; then
    source /usr/share/bash-completion/completions/git;
fi

source ~/bin/completions.sh;

if [[ -e /usr/lib/git-core/git-sh-prompt ]]; then
    source /usr/lib/git-core/git-sh-prompt;
fi

if [[ -f ~/bin/command-not-found ]]; then
    function command_not_found_handle {
        ~/bin/command-not-found $@;
    }
fi

lookForCustom() (
    while [ ! -f ./.customPS1 ]; do
        cd ..;

        if [ "/" = $(pwd) ]; then
            break;
        fi
    done

    if [ -f ./.customPS1 ]; then
        echo -e "$(bash ./.customPS1)";
    fi
)

buildPS1() {
    local reset="\[\e[0m\]";
    local blue="\[\e[38;5;81m\]";
    local purple="\[\e[38;5;141m\]";
    local green="\[\e[38;5;154m\]";
    local yellow="\[\e[38;5;186m\]";
    local red="\[\e[38;5;197m\]";
    local redBg="\[\e[48;5;197m\]";

    # look for custom
    local custom="$(lookForCustom)";

    if [ -n $custom ]; then
        custom+=$'\n';
    fi

    if [[ $1 -gt 0 ]]; then
        local error=" $redBg $1 $reset";
    fi

    local gitBranch='$(__git_ps1 "'$yellow' [%s]'$reset'")';

    echo -en "$custom$blue$2$purple@$green$3$reset$gitBranch $red$4$reset$error\n$purple$5$reset";
}

TERM=xterm-256color;
# PS1='\[\e[38;5;81m\]\u\[\e[0m\]\[\e[38;5;141m\]@\[\e[0m\]\[\e[38;5;154m\]\h\[\e[0m\]\[\e[38;5;186m\]$(__git_ps1 " [%s]")\[\e[0m\] \[\e[38;5;197m\]\w\[\e[0m\] \[\e[38;5;141m\]\$\[\e[0m\]';
#PS1='\[$(echo $?; prevStatus="$?")\]\[\e[38;5;81m\]\u\[\e[0m\]\[\e[38;5;141m\]@\[\e[0m\]\[\e[38;5;154m\]\h\[\e[0m\]\[\e[38;5;186m\]$(__git_ps1 " [%s]")\[\e[0m\] \[\e[38;5;197m\]\w\[\e[0m\] $(echo -n "status($prevStatus) "; [[ $prevStatus -gt 0 ]] && printf "\[\e[48;5;197m\] $? \[\e[0m\] ")\[\e[38;5;141m\]\$\[\e[0m\]';
PS1="$(buildPS1 "$?" "\u" "\h" "\w" "\$")";

export TERM PS1;

export GREP_COLOR="30;48;5;221";
export GREP_COLORS='sl=97;48;5;236:cx=37;40:mt=30;48;5;221:fn=38;5;204:ln=38;5;113:bn=38;5;141:se=38;5;80';

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

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/dominik.hastings/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
