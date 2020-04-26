" Jack Novotny - https://github.com/jackno
set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Installed plugins
" https://github.com/junegunn/vim-plug - Plugin manager
call plug#begin('~/.vim/plugged')
Plug 'janko/vim-test'                   " Easily run tests from Vim
Plug 'preservim/nerdtree'               " Better file navigation
Plug 'Xuyuanp/nerdtree-git-plugin'      " Git flags for nerdtree
Plug 'tpope/vim-commentary'             " Easy comments in Vim
Plug 'nvie/vim-flake8'                  " Flake8 linting
Plug 'vim-scripts/indentpython.vim'     " Better python indentation
Plug 'ycm-core/YouCompleteMe'           " Better autocomplete
Plug 'vim-syntastic/syntastic'          " Better syntax highlighting
Plug 'mattn/emmet-vim'                  " Emmet html expansions
Plug 'cespare/vim-toml'                 " TOML syntax
Plug 'itchyny/lightline.vim'            " Status bar
Plug 'jeffkreeftmeijer/vim-dim'         " 4-bit color scheme
Plug 'chrisbra/Colorizer'               " Colorize HEX codes
call plug#end()

" Enable default VIM plugins
filetype plugin on
filetype indent on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Close preview window after completion is made
let g:ycm_autoclose_preview_window_after_completion = 1

" Disable preview in autocompletions
set completeopt-=preview


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-test
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Configure the vim-test strategy
let test#python#runner = 'djangotest'

" Change the command that's run for testing
let test#python#djangotest#executable = 'docker-compose run --rm api python manage.py test'

" Map vim-test plugin to t
nmap <silent> tn :TestNearest<CR>
nmap <silent> tf :TestFile<CR>
nmap <silent> ts :TestSuite<CR>
nmap <silent> tl :TestLast<CR>
nmap <silent> tg :TestVisit<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Open NERDtree with C-n
map <C-n> :NERDTreeToggle<CR>

" Don't show helptext in NERDtree menu
let NERDTreeMinimalUI=1

" Resize NERDtree window
let NERDTreeWinSize = 25


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sets how many lines of history VIM has to remember
set history=500

" Set to auto read when a file is changed from the outside
set autoread

" Remember last position in a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Show whitespace
set listchars=tab:--,space:·
" set list

" Allow wildcards in command line
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Ignore asset files
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd

" Ignore libraries and environments
set wildignore+=*/env/*,*/venv/*
set wildignore+=*/node_modules/*,*/bower_components/*

"Always show current position
set ruler

" Always show the status line
set laststatus=2

" Format the status line
set statusline=Line:\ %l\ \ Column:\ %c%=\ %{HasPaste()}%F%m%r%h\ %w

" Let me use backspace in insert mode
set backspace=indent,eol,start

" Go to next or previous line when reaching the end of a line
set whichwrap+=<,>,h,l

" Highlight search matches
set hls

" Remap esc-esc to clear highlighted searches
nnoremap <esc><esc> :silent! nohls<cr>

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set belloff=all
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Delete trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Search recursively in directory
set path+=**

" Remap go to definition
map <C-]>  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Make navigating splits easier
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Make current pane more obvious by highlighting the line
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set notermguicolors
    autocmd WinLeave * set termguicolors
augroup END

" We don't need the vertical split line
set fillchars+=vert:\ "

" Make JS pretty
autocmd FileType javascript setlocal equalprg=js-beautify\ --stdin

" Toggle paste mode
set pastetoggle=<leader>p


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn on all python highlighting
let python_highlight_all=1

" Enable syntax highlighting
syntax enable

" Dim is a 4-bit color scheme that uses default Terminal colors
colorscheme dim
set background=dark

" Make list characters darker
hi SpecialKey ctermfg=DarkGray

" 80 character column should be gray
highlight ColorColumn ctermbg=8 guibg=DarkGray

" Highlight the 80 column
set colorcolumn=80

" Status bar color scheme
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" PEP 8 options
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix

" Web file options
au BufNewFile,BufRead *.js,*.html,*.css,*.scss,*.pug,*.sass
    \ setlocal tabstop=2
    \ softtabstop=2
    \ shiftwidth=2

" Disable continuation of comment on next line
au FileType * set fo-=c fo-=r fo-=o


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" HTML Snippet
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>4jwf>a


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

