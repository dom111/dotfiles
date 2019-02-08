" This shouldn't be necessary
set nocompatible
set backspace=2
"set term=xterm-256color
syntax on           " syntax highlighting
set mouse=a         " mouse enabled
set tabstop=4       " tabstop 4 spaces
set shiftwidth=4    " shiftwidth 4 spaces
set number          " show line number
set expandtab       " expand tabs

au BufNewFile,BufRead *.logic set filetype=perlgem
au BufNewFile,BufRead *.tmpl set filetype=perlgem

if &term =~ "xterm"
 set t_Co=256
 if has("terminfo")
   let &t_Sf=nr2char(27).'[3%p1%dm'
   let &t_Sb=nr2char(27).'[4%p1%dm'
 else
   let &t_Sf=nr2char(27).'[3%dm'
   let &t_Sb=nr2char(27).'[4%dm'
 endif
endif

colorscheme monokai
au VimLeave * :!clear

set list listchars=tab:――
	" test tab <--

"function! ConcealNonText()
"    set conceallevel=2
"    set concealcursor=nvic
"    syntax match NonText / / conceal cchar=•
"endfunction
"
"augroup ConcealNonText
"    autocmd!
"    autocmd VimEnter * call ConcealNonText()
"augroup END
"

setlocal wrap linebreak nolist
set virtualedit=
setlocal display+=lastline
noremap  <buffer> <silent> <Up>   gk
noremap  <buffer> <silent> <Down> gj
noremap  <buffer> <silent> <Home> g<Home>
noremap  <buffer> <silent> <End>  g<End>
inoremap <buffer> <silent> <Up>   <C-o>gk
inoremap <buffer> <silent> <Down> <C-o>gj
inoremap <buffer> <silent> <Home> <C-o>g<Home>
inoremap <buffer> <silent> <End>  <C-o>g<End>

map <C-o> :Ex<CR>
map <C-x> :x<CR>
map <C-PageDown> :bn<CR>
map <C-PageUp> :bp<CR>

