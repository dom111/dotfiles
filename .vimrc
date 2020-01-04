set encoding=utf-8
scriptencoding utf-8

" This shouldn't be necessary
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" language/syntax specifics
Plugin 'beyondwords/vim-twig'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'crusoexia/vim-javascript-lib'
Plugin 'HerringtonDarkholme/yats.vim' " TypeScript
Plugin 'tobyS/vmustache'
Plugin 'StanAngeloff/php.vim'
Plugin 'phpactor/phpactor'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'adoy/vim-php-refactoring-toolbox'
Plugin 'phpactor/ncm2-phpactor'

" colour scheme
Plugin 'crusoexia/vim-monokai.git'

" functionality
Plugin 'scrooloose/nerdtree'
Plugin 'moll/vim-bbye'
Plugin 'itchyny/lightline.vim'
Plugin 'ncm2/ncm2'
Plugin 'junegunn/fzf.vim'
Plugin 'neomake/neomake'
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-signify'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'majutsushi/tagbar'
" Plugin 'joonty/vdebug'
Plugin 'tobyS/pdv'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'markonm/traces.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set backspace=2
syntax on           " syntax highlighting
set mouse=a         " mouse enabled
set tabstop=4       " tabstop 4 spaces
set shiftwidth=4    " shiftwidth 4 spaces
set number          " show line number
set expandtab       " expand tabs

if &term =~ "xterm"
  " set termguicolors
  set t_Co=256
  if has("terminfo")
    let &t_Sf=nr2char(27).'[3%p1%dm'
    let &t_Sb=nr2char(27).'[4%p1%dm'
  else
    let &t_Sf=nr2char(27).'[3%dm'
    let &t_Sb=nr2char(27).'[4%dm'
  endif
endif

silent! colorscheme monokai
au VimLeave * :!clear

set list listchars=eol:¶,tab:⁞\ ,trail:▓ ",nbsp:﹏
"if has('patch-7.4.710')
"    set list listchars+=space:·
"endif

" close buffer with Ctrl + W
map <C-w> :bd<CR>
map <C-PageUp> :bp<CR>
map <C-PageDown> :bn<CR>

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-o> :NERDTreeToggle<CR>

" lightline
set laststatus=2

" fzf
set rtp+=~/.fzf
map <C-p> :Buffers<CR>
map <C-A-R> :History:<CR>
map <C-A-O> :History<CR>

