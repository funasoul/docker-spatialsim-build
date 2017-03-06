" ----------------------------------------------
" Last modified: Mon, 06 Mar 2017 23:07:59 +0900
" ----------------------------------------------

set nocompatible
filetype off

filetype on
filetype plugin on
filetype indent on
syntax on

" Here we go.
source $HOME/.exrc

"" set my vim variables
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartcase
set laststatus=2
"set statusline=%y%{GetStatusEx()}%F%m%r%=[%3l:%3c]--%3p%%--
set term=screen
set notitle
set cursorline
set history=1000
set paste
set paste!
set splitbelow
set splitright
set backspace=start,eol,indent
set mouse= "disable mouse function on vim
" no backup for file in /tmp (for crontab -e)
set backupskip=/tmp/*,/private/tmp/*
set ambiwidth=double
" set my background as dark
set background=dark
" set encoding=euc-jp
" set termencoding=euc-jp
" set fileencoding=euc-jp
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileformats=unix,dos,mac

map <C-U> :nohlsearch<CR>
