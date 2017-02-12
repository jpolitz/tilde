set expandtab		" use spaces not tab characters
set wildmenu
set ts=2
set sw=2
set tw=0
set guioptions=
set gfn=Triplicate\ \T4c:h12
"set gfn=Menlo:h12
set autoindent
set ruler

au BufNewFile,BufRead *.rkt set filetype=scheme
au BufNewFile,BufRead *.scrbl set filetype=scrbl
au BufNewFile,BufRead *.als set filetype=alloy4
au BufRead,BufNewFile *.go set filetype=go
au BufRead,BufNewFile *.arr set filetype=pyret
au BufRead,BufNewFile *.jarr set filetype=javascript

syntax on
" This makes ocaml not look ridiculous
hi Constant ctermfg=darkgreen

map <C-l> <C-w>w


if has('gui_running')
  colorscheme pyte
endif

digraph bt 8869 pv 8870 sk 9760
set ambiwidth=double


set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(jarr|o|swp|pyc|png|wav|mp3|ogg|blend)$|(^|[/\\])(build|node_modules|\.(hg|git|bzr))($|[/\\])|__init__\.py'
let g:ctrlp_dotfiles = 0
let g:ctrlp_follow_symlinks = 1
