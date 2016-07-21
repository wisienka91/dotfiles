set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" VCS plugins
Bundle 'tpope/vim-fugitive'
Bundle 'mhinz/vim-signify'

" Python and Golang 
Bundle 'davidhalter/jedi-vim'
Bundle 'klen/python-mode'
Bundle 'vim-scripts/swap-parameters'
Bundle 'fatih/vim-go'
" Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'tpope/vim-surround'
Bundle 'ihacklog/HiCursorWords'
Bundle 'scrooloose/nerdcommenter'
Bundle 'ervandew/supertab'
Bundle 'marcindziedzic/vim-numbertoggle'

" HTML5 and JavaScript
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'mattn/emmet-vim'


" Navigation
Bundle 'scrooloose/nerdtree'
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'christoomey/vim-tmux-navigator'

" Other
Bundle 'schickling/vim-bufonly'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'flazz/vim-colorschemes'

set nofoldenable    " disable folding
set clipboard=unnamedplus 		" system clipboard

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

let mapleader=","

" search and line numbers 
set relativenumber
set number
set incsearch
set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" backup files disabled
set nobackup
set nowritebackup
set noswapfile
set history=700
set undolevels=700
set wildmenu " enable commands completition menu
set wildmode=list:longest,full
set showmatch
set diffopt+=vertical

set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/htmlcov/*

" clever paste followed by select and paste
xnoremap p pgvy

" Go related mappings ,docummentation  https://github.com/fatih/vim-go/blob/master/README.md
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>r <Plug>(go-run)
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>t <Plug>(go-test)
au FileType go nmap <Leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>d <Plug>(go-def)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)

" vim-jedi
let g:jedi#popup_select_first = 1
let g:jedi#completions_enabled = 1
let g:jedi#popup_on_dot=1

function! OmniPopup(action)
	if pumvisible()
		if a:action == 'j'
			return "\<C-N>"
		elseif a:action == 'k'
			return "\<C-P>"
		endif
	endif
	return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" klen/python-mode
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_folding = 0
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
let g:pymode_trim_whitespaces = 0
let g:pymode_syntax_all = 1

" force python-mode to ignore warnings:
" * W391 - empty line at the end of file
" * E702 - numtilple statements in one line (BREAKPOINTs)
" * E731 - do not assign a lambda expression, use a def
let g:pymode_lint_ignore = "E731,E702,W391"
let g:pymode_lint_on_fly = 0
let g:pymode_lint_on_write = 0

function! ExtractVariable()
	let name = inputdialog("name: ")
	if name != ""
		execute "normal O" . name . " = "
		normal p
		execute (line('.')+1) . ",$s/" . escape(getreg('"'), '/\') . "/" . name . "/" 
	endif
endfunction

noremap <Leader>e y:call ExtractVariable()<cr>

" alternative key mappings
" noremap <Leader>m :call pymode#motion#move("\v^(class|def)\s", "")<cr>

" go-def settings
let g:godef_split=2
let g:godef_same_file_in_same_window=1

" go-vim settings
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" ultisnips configuration 
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"

" Powerline setup
set guifont=Liberation\ Mono\ for\ Powerline\ 10 
set laststatus=2
let g:Powerline_symbols = 'fancy'

" NERDTree setup
nmap nt :NERDTree %<CR>
let NERDTreeIgnore = ['\.pyc$']

" remap move to the next and previous buffer
map gn :bn<cr>
map gp :bp<cr>
map gr :bd<cr>  

" remap copy current file relative path
nmap cp :let @" = expand("%")

" remap jump to last edited location
nmap gl '^
nnoremap gl '^

" Make cursour move fast like hell
set ttyfast
set vb
set t_vb=
set lazyredraw

" Fast write, quit, and edit
nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>wq :wq<CR>
inoremap <C-c> <Esc>:w<CR>

" EasyMotion configuration
nmap s <Plug>(easymotion-s2)

" Custom ignore for ctrl-p
let g:ctrlp_by_filename = 1
let g:ctrlp_custom_ignore = 'pyc\|mako\.py'

let g:ctrlp_prompt_mappings = {
  \ 'MarkToOpen()': ['<s-m>'],
  \ }

" Supertab compeltion order
let g:SuperTabDefaultCompletionType = "<c-n>"

" Pytest configuration
nnoremap <F5> :w \| ! clear; py.test -vs %<CR>
inoremap <F5> <ESC> :w \| ! clear ; py.test -vs %<CR>

nnoremap <Leader>t :w \| ! clear; py.test -vs %<CR>
inoremap <Leader>t <ESC> :w \| ! clear ; py.test -vs %<CR>

" Ack
noremap <Leader>a :Ack --ignore-file=match:test <cword><cr>
noremap <Leader>A :Ack <cword><cr>
noremap <Leader>c :Ack --ignore-file=match:test "class <cword>"<cr>
noremap <Leader>C :Ack "class <cword>"<cr>
noremap <Leader>m :Ack --ignore-file=match:test "def <cword>"<cr>
noremap <Leader>M :Ack "def <cword>"<cr>
" noremap <Leader>d :Ack "class <cword><cr>

" set spaces for html and javascript
autocmd Filetype html setlocal ts=4 sts=4 sw=4
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4

" syntax for vim compiled from source
syntax on
set background=dark
"if strftime("%H") < 15
  "colorscheme Monokai
"else
  "colorscheme default
"endif
set t_Co=256
let g:solarized_termcolors=256
colorscheme solarized

