# a version of __git_ps1 that should show the current branch quickly without many git commands

function __git_ps1() {
  local path="$(git rev-parse --show-toplevel 2>/dev/null)";

  if [[ -n $path ]]; then
    local branch="$(cat "$path/.git/HEAD" | sed -re 's/.+\///g')";
    local format="$@";

    if [[ -z $format ]]; then
      format=" (%s)";
    fi

    if [[ -d "$path/rebase-merge/" ]]; then
      if [[ -f "$path/rebase-merge/interactive" ]]; then
	branch="$branch|MERGING-i";
      else
	branch="$branch|MERGING-m";
      fi
    else
      if [ -d "$path/rebase-apply" ]; then
	if [ -f "$path/rebase-apply/rebasing" ]; then
	  branch="$branch|REBASE"
	elif [ -f "$path/rebase-apply/applying" ]; then
	  branch="$branch|AM"
	else
	  branch="$branch|AM/REBASE"
	fi
      elif [ -f "$path/MERGE_HEAD" ]; then
	branch="$branch|MERGING"
      elif [ -f "$path/CHERRY_PICK_HEAD" ]; then
	branch="$branch|CHERRY-PICKING"
      elif [ -f "$path/REVERT_HEAD" ]; then
	branch="$branch|REVERTING"
      elif [ -f "$path/BISECT_LOG" ]; then
	branch="$branch|BISECTING"
      fi
    fi

    printf "$format" "$branch";
  fi
}
