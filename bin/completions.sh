_replace_module_completions()
{
  matches="$(pwd|perl -pe 'm{^.+?civ-clone/[^/]+};$_=$&')/node_modules/@civ-clone/";
  modules=$(for d in $matches/*; do basename $d; done);
  indexes=("${!COMP_WORDS[@]}");

  COMPREPLY=($(compgen -W "$modules" "${COMP_WORDS[${indexes[-1]}]}"));
}

complete -F _replace_module_completions replace-module
