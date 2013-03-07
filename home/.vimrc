set nocompatible               " be iMproved
filetype off                   " required!

" Vundle
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'vim-ruby/vim-ruby'
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-rails'
Bundle 'surround.vim'
Bundle 'endwise.vim'
Bundle 'vim-coffee-script'
Bundle 'wincent/Command-T'
Bundle 'jQuery'
Bundle 'matchit.zip'
Bundle 'ack.vim'
Bundle 'ragtag.vim'
Bundle 'fugitive.vim'
Bundle 'https://github.com/jgdavey/vim-railscasts.git'
Bundle 'altercation/vim-colors-solarized'
Bundle 'eraserhd/vim-ios'
Bundle 'godlygeek/tabular'
Bundle 'kien/ctrlp.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'janx/vim-rubytest'


filetype plugin indent on
syntax on

set shortmess=I

set t_Co=256
set background=dark
colorscheme grb256

set nu

let mapleader="\\"
set timeoutlen=250
set history=256

set nowrap

" edit .vimrc
nmap <silent> <leader>ev :vsplit $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Backup
set nowritebackup
set nobackup
set directory=/tmp// " prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)

" Buffers
set autoread
set hidden

" Search
set hlsearch
set ignorecase
set smartcase
set incsearch
map <Space> :set hlsearch!<cr>

" Completion
set showmatch
set wildmenu

" Splits
set splitbelow
set splitright

" Indentation and Tab handling
set smarttab
set expandtab
set autoindent
set shiftwidth=2
set tabstop=2
set autoindent smartindent

" Ruby test mappings
map <unique> <Leader>r <Plug>RubyTestRun
map <unique> <Leader>T <Plug>RubyFileRun

" Backspace
set backspace=indent,eol,start

" Tab bar
set showtabline=2

" Status Line
set laststatus=2
set statusline=%m                            " Modified Flag
set statusline+=%r                           " Readonly Flag
set statusline+=\                            " Space
set statusline+=%<                           " Truncate on the left side of text if too long
set statusline+=%t                           " File name (Tail)
set statusline+=%=                           " Right Align
set statusline+=%{ShowSpell()}               " Show whether or not spell is currently on
set statusline+=%{ShowWrap()}                " Show whether or not wrap is currently on
set statusline+=%w                           " Preview window flag
set statusline+=%h                           " Help buffer flag
set statusline+=%y                           " Type of file
set statusline+=\                            " Space
set statusline+=(%l/%L,\ %c)                 " Current position and line count
set statusline+=\                            " Space
set statusline+=%P                           " Percent
set statusline+=\                            " Space for padding on right side

function! ShowWrap()
  if &wrap
    return "[wrap]"
  else
    return ""
endfunction

function! ShowSpell()
  if &spell
    return "[spell]"
  else
    return ""
endfunction

" colors
highlight CursorLine cterm=NONE ctermbg=0
highlight StatusLine term=reverse ctermfg=65 ctermbg=255 guifg=#FFFFFF guibg=#005f5f
highlight StatusLineNC cterm=NONE ctermfg=250 ctermbg=239
highlight TabLineFill ctermfg=239
highlight LineNr ctermfg=65
set cursorline!

" whitespace
set nolist listchars=tab:·\ ,eol:¶,trail:·,extends:»,precedes:«
nmap <silent> <leader>s :set nolist!<CR>
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

" command-t settings
let g:CommandTMaxHeight=20
let g:CommandTMatchWindowReverse=1
let g:CommandTAcceptSelectionSplitMap=['<C-s>', '<C-CR>']
let g:CommandTCancelMap=['<C-c>', '<Esc>']
noremap <leader>f :CommandTFlush<CR>

if has("autocmd")
  " jQuery settings
  au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

  " handlebars
  au BufNewFile,BufRead *.handlebars.* set filetype=handlebars

  " Jimfile
  au BufNewFile,BufRead Jimfile set filetype=javascript

  " ruby. why.
  au BufNewFile,BufRead Vagrantfile,Podfile set filetype=ruby
endif

" Source a local configuration file if available.
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

set mouse=a

let g:netrw_liststyle=3


" can haz spell
iab inpsection inspection
iab Inpsection Inspection
