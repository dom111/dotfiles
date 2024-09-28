red='%{%F{204}%}' # ~#ff6188
orange='%{%F{209}%}' # ~#fc9867
yellow='%{%F{221}%}' # ~#ffd866
green='%{%F{113}%}' # ~#a9dc76
blue='%{%F{80}%}' # ~#78dce8
purple='%{%F{141}%}' # ~#ab9df2
redBg='%{%K{204}%F{255}%}' #
reset='%{%f%k%}' #

ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" "
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="${green}+" # staged changes
ZSH_THEME_GIT_PROMPT_MODIFIED="${orange}✭" # unstaged changes
ZSH_THEME_GIT_PROMPT_DELETED="" # staged - deleted
ZSH_THEME_GIT_PROMPT_RENAMED="" # staged - renamed
ZSH_THEME_GIT_PROMPT_UNMERGED="${redBg} UNMERGED " # unmerged state
ZSH_THEME_GIT_PROMPT_UNTRACKED="${blue}-" # untracked files
ZSH_THEME_GIT_PROMPT_AHEAD="${blue} --> " # git push required
ZSH_THEME_GIT_PROMPT_BEHIND="${red} <-- " # git pull required

RPROMPT='%(?..$redBg$?$reset)'
PROMPT="$blue%n$purple@$green%m$yellow\$(git_prompt_info)\$(git_prompt_status)$reset $red%~$reset"$'\n'"$purple%#$reset"
