set expandtab		" use spaces not tab characters
set wildmenu
set ts=2
set sw=2
set textwidth=0
set guioptions=
set gfn=Inconsolata\ 12
set autoindent

au BufNewFile,BufRead *.rkt set filetype=scheme
au BufNewFile,BufRead *.als set filetype=alloy4
au BufRead,BufNewFile *.go set filetype=go
au BufRead,BufNewFile *.arr set filetype=pyret

syntax on
" This makes ocaml not look ridiculous
hi Constant ctermfg=darkgreen

map <C-l> <C-w>w


if has('gui_running')
  set background=dark
  colorscheme distinguished
endif

digraph bt 8869 pv 8870 sk 9760
set ambiwidth=double

set runtimepath^=~/.vim/bundle/ctrlp.vim
:let g:ctrlp_match_window_bottom = 0
:let g:ctrlp_match_window_reversed = 0
:let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])(node_modules|\.(hg|git|bzr))($|[/\\])|__init__\.py'
:let g:ctrlp_dotfiles = 0
:let g:ctrlp_switch_buffer = 0

