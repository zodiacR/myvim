"Basic settings------{{{

"Enable filetype plugin
filetype plugin on
filetype indent on

"1 tab = 4 spaces
set shiftwidth=4
set tabstop=4
"Be smart when using tabs
set smarttab

set number
filetype on
syntax on
set incsearch
set hlsearch
colorscheme grb256
set guifont=Monaco\ 15
set cursorline
"}}}
"Mappings-----------{{{
"Uppercase the current word
inoremap <c-u> <esc>vUa
nnoremap <c-u> vU
"Lowercase the current word
inoremap <c-l> <esc>vua
nnoremap <c-l> vu
"delete current line in insert mode
inoremap <c-d> <esc>ddi

"automatically insert \v whenever search
nnoremap / /\v

"Leader
let mapleader = ","
"highlight trailing whitespace as an error
nnoremap <leader>w :match Error / $/<cr>
nnoremap <leader>W :match none<cr>

nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

"Move to beginning or ending of the word
nnoremap <leader>h ^
nnoremap <leader>l $
inoremap <leader>h <esc>^i
inoremap <leader>l <esc>$a

"exit insert mode
inoremap jk <esc>
inoremap <nop> <esc>


nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
noremap <leader>p vi(
noremap <leader>cb vi{

"copy from clipboard
nnoremap <c-v> "+p
"copy to clipboard
vnoremap <c-c> "+y
nnoremap <c-t> :NERDTree<cr>
"}}}
"abbreviations{{{
iabbrev adn and
iabbrev waht what
iabbrev tehn then
iabbrev taht that
"}}}

"operator-pending mappings{{{
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>
"}}}

"author and email
iabbrev ssig "author:Zodiac email:eminemhe@163.com

"Vimscript file settings-----------{{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
"}}}
"Vundle settings----{{{
"For vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
"vim-scripts repos
Bundle 'bash-support.vim'
Bundle 'perl-support.vim'
Bundle 'Shougo/neocomplcache.git'
Bundle 'Shougo/neosnippet.git'
Bundle 'scrooloose/nerdtree'
Bundle 'matrix.vim--Yang'
Bundle 'Pydiction'
Bundle 'pythoncomplete'
Bundle 'xml.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdcommenter'
filetype plugin indent on
"}}}
"NeoComplCache-----{{{
"Disable AutoComplPop.Comment out this line if AutoComplPop is not installed
let g:acp_enableAtStartup = 0
"Lauched neocomplcache automatically on vim startup.
let g:neocomplcache_enable_at_startup = 1
"Use smartcase.
let g:neocomplcache_enable_smart_case = 1
"Use camel case completion
let g:neocomplcache_enable_camel_case_completion = 1
"Use underscore completion
let g:neocomplcache_enable_underbar_completion = 1
" Sets minimum char length of syntax keyword.
let g:neocomplcache_min_syntax_length = 3
" buffer file name pattern that locks neocomplcache. e.g. ku.vim or fuzzyfinder 
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define file-type dependent dictionaries.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
	\}

" Define keyword, for minor languages
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
"imap <C-k>     <Plug>(neocomplcache_snippets_expand)
"smap <C-k>     <Plug>(neocomplcache_snippets_expand)
imap <C-k>      <Plug>(neosnippet_expand_or_jump)
smap <C-k>      <Plug>(neosnippet_expand_or_jump)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible ? "\<C-n>" : "\<TAB>"
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

"For snippets_complete marker.
if has('conceal')
	set conceallevel=2 concealcursor=i
endif

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion, which require computational power and may stall the vim. 
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
"}}}
"Pydiction{{{
"pydiction 1.2 python auto complete
filetype plugin on
let g:pydiction_location = $HOME.'/.vim/bundle/Pydiction/complete-dict'
"default g:pydiction_menu_height == 15
"let g:pydiction_menu_height = 20
"}}}
"Poweline-----{{{
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
let t_Co=256
set nocompatible
set laststatus=2
set encoding=utf-8
let g:Powerline_symbols = 'fancy'
set fillchars+=stl:\ ,stlnc:\
"}}}
"Toggling-------{{{
"foldcolumn
nnoremap <leader>f :call FoldColumnToggle()<cr>

function! FoldColumnToggle()
    if &foldcolumn
        setlocal foldcolumn=0
    else
	setlocal foldcolumn=4
    endif
endfunction

"toggle quickfix
nnoremap <leader>q :call QuickfixToggle()<cr>

let g:quickfix_is_open = 0
function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
	let g:quickfix_is_open = 0
	execute g:quickfix_return_to_window . "wincmd w"
    else
	let g:quickfix_return_to_window = winnr()
	copen
	let g:quickfix_is_open = 1
    endif
endfunction

"Toggle Menu and Toobar
set guioptions-=m
set guioptions-=T
map <silent><F2> :call ToggleMenuBar()<cr>

function! ToggleMenuBar()
	if &guioptions =~# 'T' 
		set guioptions-=T
		set guioptions-=m
	else
 		set guioptions+=T
		set guioptions+=m
	endif
endfunction
"}}}
"Python_Folding---{{{
if exists("b:did_ftplugin")
finish
endif
let b:did_ftplugin = 1

map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>
map <buffer> gd /def <C-R><C-W><CR> 

set foldmethod=expr
set foldexpr=PythonFoldExpr(v:lnum)
set foldtext=PythonFoldText()

map <buffer> f za
map <buffer> F :call ToggleFold()<CR>
let b:folded = 1

function! ToggleFold()
    if( b:folded == 0 )
        exec "normal! zM"
        let b:folded = 1
    else
        exec "normal! zR"
        let b:folded = 0
    endif
endfunction

function! PythonFoldText()
    let size = 1 + v:foldend - v:foldstart
    if size < 10
        let size = " " . size
    endif
    if size < 100
        let size = " " . size
    endif
    if size < 1000
        let size = " " . size
    endif
    
    if match(getline(v:foldstart), '"""') >= 0
        let text = substitute(getline(v:foldstart), '"""', '', 'g' ) . ' '
    elseif match(getline(v:foldstart), "'''") >= 0
        let text = substitute(getline(v:foldstart), "'''", '', 'g' ) . ' '
    else
        let text = getline(v:foldstart)
    endif
    
    return size . ' lines:'. text . ' '
endfunction

function! PythonFoldExpr(lnum)
    if indent( nextnonblank(a:lnum) ) == 0
        return 0
    endif
    
    if getline(a:lnum-1) =~ '^\(class\|def\)\s'
        return 1
    endif
        
    if getline(a:lnum) =~ '^\s*$'
        return "="
    endif
    
    if indent(a:lnum) == 0
        return 0
    endif

    return '='
endfunction

" In case folding breaks down
function! ReFold()
    set foldmethod=expr
    set foldexpr=0
    set foldnestmax=1
    set foldmethod=expr
    set foldexpr=PythonFoldExpr(v:lnum)
    set foldtext=PythonFoldText()
    echo 
endfunction
"}}}
