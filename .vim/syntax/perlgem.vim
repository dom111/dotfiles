" Vim syntax file
" Language: Perlgem (HTML + [perl][/perl] highlighting)
" Maintainer: Dom Hastings <dhastings@estee-lauder.co.uk>
" Last Change: 2013-09-17

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded

" Shamelessly stolen from:
"   http://stackoverflow.com/questions/5176972/trouble-using-vims-syn-include-and-syn-region-to-embed-syntax-highlighting

let b:current_syntax = ''
unlet b:current_syntax
runtime! syntax/html.vim

let b:current_syntax = ''
unlet b:current_syntax
syntax include @HTML syntax/html.vim

let b:current_syntax = ''
unlet b:current_syntax
syntax include @Perl syntax/perl.vim
syntax region perlCode matchgroup=Snip start="\[perl\]" end="\[/perl\]" containedin=@HTML contains=@Perl

hi link Snip NONE
let b:current_syntax = 'perlgem'
