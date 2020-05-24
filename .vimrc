" Jack Novotny - https://github.com/jackno
set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Installed plugins
" https://github.com/junegunn/vim-plug - Plugin manager
call plug#begin('~/.vim/plugged')
Plug 'janko/vim-test'                   " Run tests in Vim
Plug 'preservim/nerdtree'               " File navigation
" Plug 'Xuyuanp/nerdtree-git-plugin'      " Git for nerdtree
Plug 'tpope/vim-commentary'             " Easy comments
Plug 'ycm-core/YouCompleteMe'           " Autocompletion
Plug 'dense-analysis/ale'               " Syntax checker
Plug 'mattn/emmet-vim'                  " HTML snippets
Plug 'cespare/vim-toml'                 " TOML syntax
Plug 'itchyny/lightline.vim'            " Status bar
Plug 'jeffkreeftmeijer/vim-dim'         " 4-bit color scheme
Plug 'chrisbra/Colorizer'               " Colorize HEX codes
Plug 'terryma/vim-smooth-scroll'        " Smooth scrolling
Plug 'SirVer/ultisnips'                 " Snippets engine
Plug 'honza/vim-snippets'               " Actual snippets
Plug 'junegunn/goyo.vim'                " Zen mode
call plug#end()

" Enable default VIM plugins
filetype plugin on
filetype indent on

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Close preview window after completion is made
let g:ycm_autoclose_preview_window_after_completion = 1

" Disable preview in autocompletions
set completeopt-=preview

" Remap go to definition
map <C-g>  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Disable on HTML files
let g:ycm_filetype_blacklist = { 'html': 1 }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-test
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Configure the vim-test strategy
let test#python#runner = 'pytest'

" Change the command that's run for testing
" let test#python#djangotest#executable = 'python manage.py test'

" Map vim-test plugin to t
nmap <silent> tn :TestNearest<CR>
nmap <silent> tf :TestFile<CR>
nmap <silent> ts :TestSuite<CR>
nmap <silent> tl :TestLast<CR>
nmap <silent> tg :TestVisit<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Open NERDtree with ,n
map <leader>n :NERDTreeToggle<CR>

" Don't show helptext in NERDtree menu
let NERDTreeMinimalUI=1

" Resize NERDtree window
let NERDTreeWinSize = 25

" Show hidden files in NERDtree
let NERDTreeShowHidden=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ALE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Code formatters
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['isort', 'black'],
\   'rust': ['rustfmt'],
\}

" Format code on save
let g:ale_fix_on_save = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => SmoothScroll
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 7, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 7, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 7, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 7, 4)<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sets how many lines of history VIM has to remember
set history=500

" Set to auto read when a file is changed from the outside
set autoread

" Remember last position in a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"")
        \ <= line("$") | exe "normal! g`\"" | endif
endif


" Toggle paste mode
set pastetoggle=<leader>p

" Easily edit and reload vimrc
nnoremap <leader>ev :edit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set 7 lines to the cursor - when moving vertically using j/k
set so=6

" Show whitespace characters when enabled
set listchars=tab:--,space:·
" set list

" Allow wildcards in command line
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Ignore version control files
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" Ignore asset files
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd

" Ignore libraries and environments
set wildignore+=*/env/*,*/venv/*
set wildignore+=*/node_modules/*,*/bower_components/*

" Let me use backspace in insert mode
set backspace=indent,eol,start

" Go to next or previous line when reaching the end of a line
set whichwrap+=<,>,h,l

" Highlight search matches
set hls

" Remap esc-esc to clear highlighted searches
nnoremap <silent> <esc><esc> :nohls<cr>

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (better performance)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink on matching brackets
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

" Show line number only on current line
set number

" Use relative numbers on sidebar
set relativenumber

" Toggle zen mode
nnoremap <leader>z :Goyo<cr>


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
let g:lightline = { 'colorscheme': 'one', }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off and favor version control
set nobackup
set nowb
set noswapfile

" Set UTF8 as standard encoding
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab = 4 spaces
set shiftwidth=4
set tabstop=4

set ai          "Auto indent
set si          "Smart indent
set wrap        "Wrap lines

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

" Automatically enter Paste mode when pasting text
" https://rb.gy/pdvxlc
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Terminal mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automaticall enter Insert mode in a new terminal
if has('nvim')
    autocmd TermOpen term://* startinsert
endif

" Disable line numbers in Terminal
autocmd TermOpen * setlocal nonumber norelativenumber

" Open a terminal anywhere with ,t
map <leader>t :terminal<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Snippets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" HTML Snippet
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>4jwf>a

" Django Snippets
nnoremap ,% :-1read $HOME/.vim/.skeleton.django.tag<CR>j2hi
nnoremap ,{ :-1read $HOME/.vim/.skeleton.django.var<CR>j2hi
nnoremap ,block :-1read $HOME/.vim/.skeleton.django.block<CR>j15hi
nnoremap ,if :-1read $HOME/.vim/.skeleton.django.if<CR>j14hi
nnoremap ,csrf :-1read $HOME/.vim/.skeleton.django.csrf<CR>j

" UltiSnips shortcuts
let g:UltiSnipsExpandTrigger="<c-o>"
let g:UltiSnipsJumpForwardTrigger="<c-p>"
let g:UltiSnipsJumpBackwardTrigger="<c-i>"
let g:UltiSnipsListSnippets = "<c-k>"


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

" Automatically enters Paste mode when pasting text
function! XTermPasteBegin()
    let &t_SI .= WrapForTmux("\<Esc>[?2004h")
    let &t_EI .= WrapForTmux("\<Esc>[?2004l")
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction

" If using Paste in tmux, double escape the codes
function! WrapForTmux(s)
    if !exists('$TMUX')
        return a:s
    endif
    let tmux_start = "\<Esc>Ptmux;"
    let tmux_end = "\<Esc>\\"
    return tmux_start .
        \ substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction
