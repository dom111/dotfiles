# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

ORACLE_HOME=/home/oracle/product/11.2.0.1.0
export ORACLE_HOME

PATH=$HOME/bin:$PATH:/u01/perlgem_eng/tools/bin::$HOME/bin:/home/webop/perlgem_tools/bin:$HOME/perlgem/server/bin
export PATH

# User specific environment and startup programs
if [ -t 1 ]; then
    # don't automatically nest and only start tmux on njleng02 or intldevapp
    if [ -x $TMUX ] && [ "$HOSTNAME" = "njleng02" ] || [ "$HOSTNAME" = "intldevapp" ] || [ "$HOSTNAME" = "njljmphst01" ]; then
        start-tmux;
    fi
fi

