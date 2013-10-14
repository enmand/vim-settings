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
au BufRead,BufNewFile todo.txt,done.txt set filetype=todo
" read our profile for $PATH and other environment vairables
silent !source ~/.profile
set rtp+=/Users/enmand/.vim/bundle/powerline/powerline/bindings/vim
filetype off
filetype plugin indent off
set rtp+=/usr/local/go/misc/vim/
filetype plugin indent on
syntax on

set encoding=utf-8
" folding
"set foldmethod=indent
"nnoremap <Leader><Space> za
"vnoremap <Leader><Space> zf

" Spelling (useful for documentation/commits)
nnoremap <Leader>s :setlocal spell! spell?<cr>
nnoremap <Leader>f :setlocal foldenable! foldenable?<cr>
nnoremap <Leader>qc :cclose <bar> :lclose<cr>

set wildmenu
set wildmode=list:longest,full
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ruler
set showmode
set laststatus=2
set statusline=%f\ %m%h%r%w\ %y\ %{fugitive#statusline()}%=\ B%3n\ ·\ L%5l/%5L\ ·\ C%7(%c%V%)\ ·\ %4(0x%B%)\ ·\ %P
set incsearch           " Incremental search
set nu
set copyindent                  " Preserve vertical alignment when indenting
set autoindent tabstop=4 shiftwidth=4
set colorcolumn=61,81              " Highlight long lines
set hlsearch
set hidden
set title

match ErrorMsg '\%>80v.\+'

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
		set guifont=Monaco\ for\ Powerline:h12
		if has("gui_macvim")
			let macvim_hig_shift_movement = 1
			set guioptions-=T
		endif
	endif
endif

" Enable omni completion. Not required if they are already set elsewhere in
" .vimrc
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion, which require computational power and may stall the vim.
"if !exists('g:neocomplcache_omni_patterns')
"  let g:neocomplcache_omni_patterns = {}
"endif
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
"let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" Helpers. Trailing space isn't a mistake
nnoremap <leader>a :Ack --ignore-dir=node_modules --ignore-dir=build --ignore-dir=vendor 
nmap <leader>wt :tabclose<cr>
nmap <leader>nt :tabnew<cr>
nmap <leader><left> :tabprevious<cr>
nmap <leader><right> :tabnext<cr>

let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

let NERDTreeIgnore = ['\.pyc$', '^__pycache__$']

let g:neocomplcache_enable_at_startup = 0

let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_java_javac_config_file_enabled=1

" Ignore node_modules in ctrlp
let g:ctrlp_custom_ignore = '\v[\/](node_modules|build|__pycache__|.git|.hg|.svn|.npm)$'

" NERDTree can be a little annoying
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_open_on_new_tab = 0

" YouCompleteMe

noremap <leader>jd YcmCompleter GoToDefinitionElseDeclaration

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

map <F10> :NERDTreeToggle<cr>
imap <F10> :NERDTreeToggle<cr>
vmap <F10> :NERDTreeToggle<cr>

map <S-F10> :NERDTreeMirror<cr>
imap <S-F10> :NERDTreeMirror<cr>
vmap <S-F10> :NERDTreeMirror<cr>

map <F11> :NERDTreeFind<cr>
imap <F11> :NERDTreeFind<cr>
vmap <F11> :NERDTreeFind<cr>

nmap <F8> :TagbarToggle<CR>
imap <F8> :TagbarToggle<CR>
vmap <F8> :TagbarToggle<CR>

nnoremap <F5> :GundoToggle<CR>
inoremap <F5> :GundoToggle<CR>
vnoremap <F5> :GundoToggle<CR>

colorscheme molokai
set noerrorbells
set vb

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

map <D-1> 1gt
imap <D-1> 1gt
map <D-2> 2gt
imap <D-2> 2gt
map <D-3> 3gt
imap <D-3> 3gt
map <D-4> 4gt
imap <D-4> 4gt
map <D-5> 5gt
imap <D-5> 5gt
map <D-6> 6gt
imap <D-6> 6gt
map <D-7> 7gt
imap <D-7> 7gt
map <D-8> 8gt
imap <D-8> 8gt
map <D-9> 9gt
imap <D-9> 9gt
map <D-0> 10gt
imap <D-0> 10gt
