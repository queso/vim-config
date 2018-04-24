set nocompatible               " be iMproved
filetype off                   " required!

" Vundle
set runtimepath+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'gmarik/vundle'
Plugin 'tpope/vim-rails'
Plugin 'surround.vim'
Plugin 'endwise.vim'
Plugin 'vim-coffee-script'
Plugin 'wincent/Command-T'
Plugin 'jQuery'
Plugin 'matchit.zip'
Plugin 'ack.vim'
Plugin 'ragtag.vim'
Plugin 'fugitive.vim'
Plugin 'https://github.com/jgdavey/vim-railscasts.git'
Plugin 'altercation/vim-colors-solarized'
Plugin 'eraserhd/vim-ios'
Plugin 'godlygeek/tabular'
Plugin 'kien/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'lunaru/vim-less'
Plugin 'noahfrederick/vim-noctu'
Plugin 'chriskempson/base16-vim'
Plugin 'goatslacker/mango.vim'
Plugin 'tpope/vim-vividchalk'
Plugin 'digitaltoad/vim-jade'
Plugin 'scrooloose/syntastic'
Plugin 'wakatime/vim-wakatime'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'jparise/vim-graphql'
Plugin 'udalov/kotlin-vim'
Plugin 'posva/vim-vue'
call vundle#end()

filetype plugin indent on
syntax on

set shortmess=I

set t_Co=256
set background=dark
colorscheme railscasts

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

" Remove the crutch of arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

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
match ErrorMsg '\s\+$'
nnoremap <silent> <leader>rw :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

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

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

autocmd FileType javascript set formatprg=prettier\ --stdin

let g:netrw_liststyle=3

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'


" can haz spell
iab inpsection inspection
iab Inpsection Inspection
