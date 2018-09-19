"encoding detection
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

"enable syntax highlight and completion
syntax on
filetype on

"Default Indentation
set visualbell
set autoindent
set smartindent   "indent when
set cindent
set nu			"set line no
set ts=2		"tab space
set ss=2		"backspace
set sw=2        "indent width
set ruler       "use ruler
set scrolloff=5
set showcmd     "show command
set nocompatible    "close compatiblity with vi
set expandtab   "replace tab with space
set nobackup        "close backup
set showmode        "show the mode
set showmatch
set matchtime=1
set hlsearch        "hight light search
set incsearch       "increase search
set smartcase
set noswapfile
set rtp+=~/.fzf
set background=dark
set foldmethod=indent
colorscheme gruvbox
"set mouse=a

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif



"key map
map Y y$
map bn :bn
map <C-e> :NERDTree<CR>


"plugins configure
"taglist
let Tlist_WinWidth = 40 
let Tlist_Sort_Type = 'name'
let Tlist_Show_One_File = 1
let Tlist_File_Fold_Auto_close = 1
let Tlist_GainFocus_On_ToggleOpne = 1
let Tlist_Exit_OnlyWindow = 1
let NERDTreeWinSize=20
let g:ycm_add_preview_to_completeopt=1
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_autoclose_preview_window_after_completion=1
"let g:ycm_global_ycm_extra_conf='/home/scy/.vim/pack/myplugins/opt/youcompleteme/third_party/ycmd/.ycm_extra_conf.py'

nnoremap ga :YcmCompleter GoToDeclaration<CR>
nnoremap gs :YcmCompleter GoToDefinition <CR>
"nnoremap gd :YcmCompleter GetType<CR>
"c.vim
filetype plugin on

"asyncrun_open
let g:asyncrun_open=8


