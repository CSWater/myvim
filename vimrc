""encoding detection
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
""
"""enable syntax highlight and completion
syntax on
filetype on
filetype plugin on
filetype indent on
autocmd FileType python setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
"augroup extra_filetypes
"  autocmd!
"  au BufNewFile,BufRead *.cu           set      ft=cuda
"  au BufNewFile,BufRead *.cuh          set      ft=cuda
"augroup END
"Plugin 'SirVer/ultisnips'
"
"
"Default Indentation
"set visualbell
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
set backspace=indent,eol,start
set expandtab   "replace tab with space
set nobackup        "close backup
set showmode        "show the mode
set showmatch
set matchtime=1
set hlsearch        "hight light search
set incsearch       "increase search
set smartcase
set noswapfile
set smartcase ignorecase
set rtp+=~/.fzf
set background=dark
set colorcolumn=80
let mapleader=","
colorscheme gruvbox
"set mouse=a

"if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
"  set t_ut=
"endif


"key map
map Y y$
map <leader>e :NERDTreeToggle<CR>
map <F8> :TagbarToggle<CR>
map <F7> :AsyncRun! grep -rn <cword> .
map <leader>f :LeaderfFunction<CR>
nmap T <C-w>gF




"plugins configure
"nerdtree"
let NERDTreeWinSize=20

"tagbar"
let g:tagbar_width=20  

"ycm
let g:ycm_add_preview_to_completeopt=1
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_global_ycm_extra_conf="~/.vim/.ycm_extra_conf.py"

"ultisnips
"let g:UltiSnipsExpandTrigger="<c-e>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"let g:UltiSnipsEditSplit="horizontal"

"nnoremap ga :YcmCompleter GoToDeclaration<CR>
"nnoremap gs :YcmCompleter GoToDefinition <CR>
"nnoremap gd :YcmCompleter GetType<CR>

"asyncrun_open
let g:asyncrun_open=8

"set cscopetag " 使用 cscope 作为 tags 命令
"set cscopeprg='gtags-cscope' " 使用 gtags-cscope 代替 cscope

"gutentags
" 禁用 gutentags 自动加载 gtags 数据库的行为
"let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'
let $GTAGSLABEL = 'native-pygments'
"let $GTAGSCONF = '/usr/share/doc/global/examples/gtags.conf'
let $GTAGSCONF = '/home/scy/.vim/gtags.conf'

let g:gutentags_modules = []
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_cache_dir = expand('~/.cache/tags')
let g:gutentags_auto_add_gtags_cscope = 0
let g:gutentags_define_advanced_commands = 1
let g:gutentags_trace=0

if executable('gtags') && executable('gtags-cscope')
    let g:gutentags_modules += ['gtags_cscope']
endif

"leaderf
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_Ctags = "/home/scy/software/universal-ctags/bin/ctags"
"let g:Lf_CacheDirectory = expand('~/LfCache')
"let g:Lf_CtagsFuncOpts = {
"            \ 'cpp': '--c-kinds=fp,--langmap=c++:+.cu',
"            \ 'rust': '--rust-kinds=f',
"            \ }
"let g:Lf_CtagsFuncOpts = {'--langmap=c++:+.cu'}
"let g:Lf_Gtagsconf =  '/usr/share/doc/global/examples/gtags.conf'
"let g:Lf_Gtagslabel = 'native-pygments'


""""""""""""""""""""" vim标签配置 begin """"""""""""""""""""""
" 显示标签页顺序，便于切换标签页，如需要切换到编号为3的标签页，按 3gt 即可
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let s .= i . ')'
            let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#' )
            let file = bufname(buflist[winnr - 1])
            let file = fnamemodify(file, ':p:t')
            if file == ''
                let file = '[NEW]'
            else
                let m = 0       " &modified counter
                let bc = len(tabpagebuflist(i))     "counter to avoid last ' '
                " loop through each buffer in a tab
                for b in tabpagebuflist(i)
                    " check and ++ tab's &modified count
                    if getbufvar( b, "&modified" )
                        let m += 1
                        break
                    endif
                endfor
                " add modified label + where n pages in tab are modified
                if m > 0
                    let file = '+ '.file
                endif
            endif
            let s .= ' '.file.' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
endif
"""""""""""""""""""""" vim标签配置 end """"""""""""""""""""""
