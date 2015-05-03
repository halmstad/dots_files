"==========================================
" Author:  Changzhi Zhou
" Version: 6
" Email: chazho10@163.com
" Last_modify: 2015-01-30
" Sections:
"     ->General 基础设置
"     ->Show 展示/排班等界面格式设置
"     ->file encode, 文件编码,格式
"     ->others 其它基础配置
"     ->hot key  自定义快捷键
"     ->bundle 插件管理和配置项
"     ->colortheme 主题,及一些展示上颜色的修改
"==========================================

"==========================================
" General 基础设置
"==========================================

"set guifont=Monaco:h20          " 字体 && 字号

" history存储长度。
set history=2000

"检测文件类型
filetype on
"针对不同的文件类型采用不同的缩进格式
filetype indent on
"允许插件
filetype plugin on
"启动自动补全
filetype plugin indent on

set shell=bash\ -i
"非兼容vi模式。去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set nocompatible
set autoread          " 文件修改之后自动载入。
"set shortmess=atI       " 启动的时候不显示那个援助索马里儿童的提示

" 备份,到另一个位置. 防止误删, 目前是取消备份
"set backup
"set backupext=.bak
"set backupdir=~/bak/vimbk/

" 取消备份。 视情况自己改
set nobackup
set noswapfile

" 突出显示当前行等 不喜欢这种定位可注解
set cursorline              " 突出显示当前行


" No annoying sound on errors
" 去掉输入错误的提示声音
set title                " change the terminal's title
set novisualbell           " don't beep
set noerrorbells         " don't beep
set t_vb=
set tm=500

"==========================================
" Show 展示/版本等界面格式设置
"==========================================

"显示行号：
set number
set nowrap                    " 取消换行。

"括号配对情况
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

"设置文内智能搜索提示
" 高亮search命中的文本。
set hlsearch
" 搜索时忽略大小写
set ignorecase
" 随着键入即时搜索
set incsearch
" 有一个或以上大写字母时仍大小写敏感
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise

" 代码折叠
"set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
"set foldmethod=indent
"set foldlevel=99

"Smart indent
set autoindent    " always set autoindenting on
" never add copyindent, case error   " copy the previous indentation on autoindenting
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'

" A buffer becomes hidden when it is abandoned
set hidden
set wildmode=list:longest
set ttyfast


set wildignore=*.swp,*.bak,*.pyc,*.class

"显示当前的行号列号：
set ruler
""在状态栏显示正在输入的命令
set showcmd
" Show current mode
set showmode

" Set 7 lines to the cursor - when moving vertically using j/k 上下滚动,始终在中间
set scrolloff=7

" 命令行（在状态行下）的高度，默认为1，这里是2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" Always show the status line
set laststatus=2

"==========================================
" file encode, 文件编码,格式
"==========================================
" 设置新文件的编码为 UTF-8
"set fileencodings=ucs-bom,utf-8,gb2312,big5,latin1

set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
"language message zh_CN.UTF-8
"set langmenu=zh_CN.UTF-8
"set enc=2byte-gb18030
" 下面这句只影响普通模式 (非图形界面) 下的 Vim。
set termencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" 如遇Unicode值大于255的文本，不必等到空格再折行。
set formatoptions+=m
" 合并两行中文时，不在中间加空格：
set formatoptions+=B

""===========================================================
" FileType specific changes
" ============================================================
" Mako/HTML
autocmd BufNewFile,BufRead *.mako,*.mak,*.jinja2 setlocal ft=html
autocmd FileType html,xhtml,xml,css setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

" Python
"au BufRead *.py compiler nose
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 cinwords=if,elif,else,for,while,try,except,finally,def,class,
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\]%\\@=%m
" Go




" Don't let pyflakes use the quickfix window
let g:pyflakes_use_quickfix=0
"==========================================
" others 其它配置
"==========================================

""让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set completeopt=longest,menuone

" 增强模式中的命令行自动完成操作
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.class

" if this not work ,make sure .viminfo is writable for you
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"删除多余空格
" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

" Remember info about open buffers on close"
set viminfo^=%

" For regular expressions turn magic on
set magic

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

command! W :w
command! WQ :wq
"==========================================
"hot key  自定义快捷键
"==========================================
let mapleader = ','
let g:mapleader = ','

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"翻页
map <C-o> <C-b>
map <C-p> <C-f>

"Treat long lines as break lines (useful when moving around in them)
"se swap之后，同物理行上线直接跳
map j gj
map k gk

"Smart way to move between windows 分屏窗口移动
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"Short for vertical split
map <leader>v :vs<CR>
map <leader>V :vs<CR>


" Go to home and end using capitalized directions
noremap <C-a> 0
noremap <C-e> $

" Remap VIM 0 to first non-blank character
map 0 ^

nnoremap <F1> :set paste! paste?<CR>
nnoremap <F2> :set nu! nu?<CR>
nnoremap <F3> :set list! list?<CR>
nnoremap <F4> :set wrap! wrap?<CR>
nnoremap <F5> :nohls<CR>
nnoremap <F6> :set clipboard=unnamed<CR>


" Map <Space> to fold
set foldmethod=indent
set foldlevel=99
set foldignore=
nnoremap <space> za
vnoremap <space> zf

map Y y$
"cmap w!! %!sudo tee > /dev/null %
" w!! to sudo & write a file
cmap w!! w !sudo tee > /dev/null %


" ; can repeat fx/tx. so do not map it
nnoremap ; :

""Jump to start and end of line using the home row keys
""
nmap t o<ESC>k
nmap T O<ESC>j


" Quickly close the current window
nnoremap <leader>q :q<CR>

" Swap implementations of ` and ' jump to markers
" By default, ' jumps to the marked line, ` jumps to the marked line and
" column, so swap them
nnoremap ' `
nnoremap ` '

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" select all
map <Leader><C-a> ggVG"
map <Leader>d gd

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>t<left> :tabp<cr>
map <leader>t<right> :tabn<cr>

" tabnext  tabpreviouse

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

"==========================================
" bundle 插件管理和配置项
"package dependent:  ctags
"python dependent:  pep8, pyflake

filetype off " required! turn off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"################### 插件管理 ###################"
""

"使用Vundle来管理Vundle
Plugin 'gmarik/Vundle.vim'

"阅读hackernews
Plugin 'ryanss/vim-hackernews'

Plugin 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = '<C-n>'

" youcompleteme 来补全ultisnips
Plugin 'Valloric/YouCompleteMe'
"imap <Tab> <C-P>
" YCM 补全菜单配色
" 菜单
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 引入 C++ 标准库tags
set tags+=/data/misc/software/misc./vim/stdcpp.tags
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']


" ultisnips补全
Plugin 'SirVer/ultisnips'
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<leader><tab>"
let g:UltiSnipsJumpForwardTrigger = "<leader><leader><tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsListSnippets="<c-e>"
let g:UltiSnipsSnippetDirectories=["UltiSnips/snippets"]


"################### 导航 ###################"
"目录导航
Plugin 'scrooloose/nerdtree'
map <leader>n :NERDTreeToggle<CR>
map <F9> :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
let g:netrw_home='~/bak'
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMapMenu="<leader>m"
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end

"for minibufferexpl
Plugin 'fholgado/minibufexpl.vim'
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
"解决FileExplorer窗口变小问题
let g:miniBufExplForceSyntaxEnable = 1
let g:miniBufExplorerMoreThanOne=2
let g:miniBufExplCycleArround=1

" 默认方向键左右可以切换buffer
nnoremap <TAB> :MBEbn<CR>
noremap <TAB><Left> :MBEbp<CR>
noremap <TAB><Right> :MBEbn<CR>
noremap <Leader><C-w> :MBEbd<CR>

"标签导航
Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_show_linenumbers = 1

" 对齐分隔线
Plugin 'Yggdroot/indentLine'
let g:indentLine_char = '┆'
" let g:indentLine_char = '┊'

"书签设置
" Plugin 'kshenoy/vim-signature'
" let g:SignatureMap = {
" 	\'Leader'             :  "m",
"         \ 'DeleteMark'         :  "dm",
"         \ 'PurgeMarkers'       :  "m<BS>",
"         \ 'GotoNextSpotByPos'  :  "m,",
"         \ 'GotoPrevSpotByPos'  :  "m.",
"         \ 'ListLocalMarks'     :  "ms",
"         \ }

" emmet for web developer, which was named zen-coding
Plugin 'mattn/emmet-vim'
" let g:user_emmet_install_global = 0
" autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<Leader>'

"内容搜索
Plugin 'dyng/ctrlsf.vim'
"noremap <leader>bd :MBEbd<CR>
let g:ctrlsf_ackprg = 'ack'
let g:ctrlsf_position = 'bottom'
nmap <leader>f <Plug>CtrlSFPrompt
vmap <leader>f <Plug>CtrlSFVwordPath
nmap <leader>ff <Plug>CtrlSFCwordPath


"for file search ctrlp, 文件搜索
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <leader>/ :CtrlPMRU<CR>
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux"
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz)$',
    \ }
"\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

"################### 显示增强 ###################"

"状态栏增强展示
Plugin 'Lokaltog/vim-powerline'

"for show no user whitespaces
Plugin 'bronson/vim-trailing-whitespace'
map <leader><space> :FixWhitespace<cr>

Plugin 'Lokaltog/vim-easymotion'

"快速插入代码片段
" 快速加入修改环绕字符
Plugin 'tpope/vim-surround'
"for repeat -> enhance surround.vim, . to repeat command
let g:surround_{char2nr("d")} = "<div\1id: \r..*\r id=\"&\"\1>\r</tab>div>"

"自动补全单引号，双引号等
Plugin 'Raimondi/delimitMate'
" for python docstring ",优化输入
au FileType python let b:delimitMate_nesting_quotes = ['"']

"################# 语法检查 ###############
" Run pep8
"Plugin 'vim-scripts/pep8'
"let g:pep8_map='<leader>8'
Plugin 'nvie/vim-flake8'
let g:flake8_show_in_file=1
let g:flake8_show_quickfix=0
let g:flake8_max_line_length=72
highlight link Flake8_Error      Error
highlight link Flake8_Warning    WarningMsg
highlight link Flake8_Complexity WarningMsg
highlight link Flake8_Naming     WarningMsg
highlight link Flake8_PyFlake    WarningMsg

Plugin 'scrooloose/syntastic'
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_checker_args='--ignore=E501,E225'


"################# 具体语言语法高亮 ###############

" for python.vim syntax highlight
Plugin 'hdima/python-syntax'
let python_highlight_all = 1

" for docker file
Plugin 'ekalinin/Dockerfile.vim'

" for markdown
Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1


"for jquery
Plugin 'nono/jquery.vim'

"################### 其他 ###################"
" task list
Plugin 'vim-scripts/TaskList.vim'
map <leader>td <Plug>TaskList

call vundle#end()

"========================== config for plugins end ======================================

" 被动技能
"==========================================
" 主题,及一些展示上颜色的修改
"==========================================
"开启语法高亮
syntax enable
syntax on

" Set extra options when running in GUI mode
if has("gui_running")
    set guifont=Monaco:h14
    set guioptions-=T
    set guioptions+=e
    set guioptions-=r
    set guioptions-=L
    set guitablabel=%M\ %t
    set showtabline=1
    set linespace=2
    set noimd
    set t_Co=256
endif

" 修改主题和颜色展示
colorscheme slate

"colorscheme molokai
"colorscheme desert

"设置标记一列的背景颜色和数字一行颜色一致
hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange
hi Pmenu ctermfg=67 ctermbg=black
hi PmenuSel ctermfg=yellow ctermbg=black

"" for error highlight，防止错误整行标红导致看不清
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

" F10 to run python script
nnoremap <buffer> <F10> :exec '!python' shellescape(@%, 1)<cr>
