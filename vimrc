" vim exits with non-zero sometimes, thanks to pathogen.
filetype on
call pathogen#infect()

if has("syntax")
  syntax on
endif

let mapleader=","
set mouse=a

if has("autocmd")
        filetype plugin indent on
		autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
		autocmd InsertLeave * if pumvisible() == 0|pclose|endif
endif

" When I want to change thing
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" SLIME
let g:slime_target = "tmux"

au BufNewFile,BufRead *.pt,*.cpt,*.zpt set filetype=zpt syntax=xml

" read our profile for $PATH and other environment vairables
silent !source ~/.profile

set encoding=utf-8

" folding
set foldmethod=indent
nnoremap <Leader><Space> za
vnoremap <Leader><Space> zf

" Spelling (useful for documentation/commits)
nnoremap <Leader>s :setlocal spell! spell?<cr>

set wildmenu
set wildmode=list:longest,full
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set incsearch           " Incremental search
set nu
set copyindent                  " Preserve vertical alignment when indenting
set autoindent tabstop=4 shiftwidth=4
set colorcolumn=81              " Highlight long lines
set hlsearch
set hidden
set title

nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" per-project .vimrc
set exrc

" "fix" regex
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase

" "fix" backspace
set backspace=2
set nocompatible

" MacVIM and gVIM options
if has("unix")
	let s:uname = system("uname")
	if s:uname == "Darwin\n"
		set guifont=Monaco:h12
		if has("gui_macvim")
			let macvim_hig_shift_movement = 1
			set guioptions-=T
		endif
	endif
endif

" Helpers
nnoremap <leader>a :Ack 
nmap <leader>wt :tabclose<cr>

let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 

let NERDTreeIgnore = ['\.pyc$', '^__pycache__$']

let g:neocomplcache_enable_at_startup = 1

let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

" NERDTree can be a little annoying
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_open_on_new_tab = 0

map <F10> :NERDTreeToggle<cr>
imap <F10> :NERDTreeToggle<cr>
vmap <F10> :NERDTreeToggle<cr>

map <S-F10> :NERDTreeMirror<cr>
imap <S-F10> :NERDTreeMirror<cr>
vmap <S-F10> :NERDTreeMirror<cr>

nmap <F8> :TagbarToggle<CR>
imap <F8> :TagbarToggle<CR>
vmap <F8> :TagbarToggle<CR>

nnoremap <F5> :GundoToggle<CR>
inoremap <F5> :GundoToggle<CR>
vnoremap <F5> :GundoToggle<CR>
colorscheme jellybeans
"colorscheme molokai
"colorscheme distinguished
set noerrorbells
set vb
