# a version of __git_ps1 that should show the current branch quickly without many git commands

function __git_ps1() {
  local path="$(git rev-parse --show-toplevel)/.git";
  local branch="$(cat ${P}HEAD | sed -re 's/.+\///g')";

  if [[ -d "$path/rebase-merge/" ]]; then
    if [[ -f "$path/rebase-merge/interactive" ]]; then
      B="$branch|MERGING-i";
    else
      B="$branch|MERGING-m";
    fi
  else
    if [ -d "$path/rebase-apply" ]; then
      if [ -f "$path/rebase-apply/rebasing" ]; then
        B="$branch|REBASE"
      elif [ -f "$path/rebase-apply/applying" ]; then
        B="$branch|AM"
      else
        B="$branch|AM/REBASE"
      fi
    elif [ -f "$path/MERGE_HEAD" ]; then
      B="$branch|MERGING"
    elif [ -f "$path/CHERRY_PICK_HEAD" ]; then
      B="$branch|CHERRY-PICKING"
    elif [ -f "$path/REVERT_HEAD" ]; then
      B="$branch|REVERTING"
    elif [ -f "$path/BISECT_LOG" ]; then
      B="$branch|BISECTING"
    fi
  fi
}