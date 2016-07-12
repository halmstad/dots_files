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

" set guifont=Monaco:h20          " 字体 && 字号

" history存储长度。
" set history=2000

"检测文件类型

filetype on
"针对不同的文件类型采用不同的缩进格式
filetype indent on
"允许插件
filetype plugin on

set shell=bash\ -i
"非兼容vi模式。去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set nocompatible
set autoread          " 文件修改之后自动载入。
"set shortmess=atI       " 启动的时候不显示那个援助索马里儿童的提示

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
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
set foldlevel=99
" 代码折叠自定义快捷键 <leader>zz
let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun

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
"set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
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

set lisp

" http://stackoverflow.com/questions/13194428/is-better-way-to-zoom-windows-in-vim-than-zoomwin
" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <Leader>z :ZoomToggle<CR>

""===========================================================
" FileType specific changes
" ============================================================
" Mako/HTML
autocmd BufNewFile,BufRead *.mako,*.mak,*.jinja2, setlocal ft=html
autocmd FileType ruby,javascript,yaml,htmldjango,html,xhtml,xml,css,stylus setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown set filetype=markdown
autocmd BufRead,BufNewFile *.part set filetype=html
" disable showmatch when use > in php
au BufWinEnter *.php set mps-=<:>

" Python
"au BufRead *.py compiler nose
au BufRead,BufNewFile *.py set filetype=python
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 cinwords=if,elif,else,for,while,try,except,finally,def,class,
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\]%\\@=%m

" 保存python文件时删除多余空格
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()


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
let g:mapleader = ','

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
map <leader>s :sp<CR>

" Map ZZ and ZQ
map zz ZZ
map zq ZQ
" Go to home and end using capitalized directions
noremap <C-a> 0
noremap <C-e> $

" Remap VIM 0 to first non-blank character
map 0 ^

nnoremap <F1> :set paste! paste?<CR>
imap <F1> <ESC>:set paste! paste?<CR>
nnoremap <F2> :set nu! nu?<CR>
nnoremap <F3> :set list! list?<CR>
nnoremap <F4> :set wrap! wrap?<CR>
nnoremap <F5> :nohls<CR>
nnoremap <F6> :set clipboard=unnamed<CR>


" Map <Space> to fold
set foldmethod=indent
set foldlevel=99
set foldignore=

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
nnoremap <leader>qq :q!<CR>

" Quickly Save
nnoremap <leader>w :w<CR>

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

Plugin 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = '<C-n>'

" youcompleteme 来补全ultisnips
Plugin 'Valloric/YouCompleteMe'
"imap <Tab> <C-P>
" YCM 补全菜单配色
" 菜单
highlight Pmenu ctermfg=1 ctermbg=15 guifg=#005f87 guibg=#EEE8D5
" 选中项
highlight PmenuSel ctermfg=15 ctermbg=1 guifg=#AFD700 guibg=#106900
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
"" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
"let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
"" 禁止缓存匹配项，每次都重新生成匹配项
"let g:ycm_cache_omnifunc=0
"" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
" 跳转到定义 "
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jc :YcmCompleter GetDoc<CR>
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"
let g:ycm_python_binary_path = '/usr/bin/python'


" ultisnips补全
Plugin 'SirVer/ultisnips'
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<leader><tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsSnippetDirectories=["UltiSnips/snippets"]


"################### 导航 ###################"
"目录导航
Plugin 'scrooloose/nerdtree'
map <leader>n :NERDTreeToggle<CR>
map <F8> :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
let netrw_home='~/bak'

let NERDTreeWinSize=32  " 设置NERDTree子窗口宽度
let NERDTreeShowHidden=1  " 显示隐藏文件
let NERDTreeMinimalUI=1  " NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeAutoDeleteBuffer=1 " 删除文件时自动删除文件对应 buffer
let NERDTreeMapMenu="<leader>m"
let NERDTreeChDirMode = 1
let NERDTreeHijackNetrw = 1 " 当输入 [:e filename]不再显示netrw,而是显示 nerdtree"

"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end

"for minibufferexpl
Plugin 'fholgado/minibufexpl.vim'
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
" "解决FileExplorer窗口变小问题
let g:miniBufExplorerMoreThanOne=2
let g:miniBufExplCycleArround=1
hi MBEVisibleActive guifg=#A6DB29 guibg=fg
hi MBEVisibleChangedActive guifg=#F1266F guibg=fg
hi MBEVisibleChanged guifg=#F1266F guibg=fg
hi MBEVisibleNormal guifg=#5DC2D6 guibg=fg
hi MBEChanged guifg=#CD5907 guibg=fg
hi MBENormal guifg=#808080 guibg=fg


" 默认方向键左右可以切换buffer
nnoremap <TAB> :MBEbn<CR>
noremap <TAB>[ :MBEbp<CR>
noremap <TAB>] :MBEbn<CR>
noremap <Leader><C-w> :MBEbd<CR>
map <space> :b<Space>

"标签导航
Plugin 'majutsushi/tagbar'
nmap <F9> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_show_linenumbers = 1
let g:tagbar_vertical = 1

" 对齐分隔线
Plugin 'Yggdroot/indentLine'
let g:indentLine_char = '┆'

Plugin 'mattn/emmet-vim'
"let g:user_emmet_leader_key='<Leader>'
let g:user_emmet_install_global = 0
autocmd FileType htmldjango,html,css EmmetInstall

"内容搜索
Plugin 'dyng/ctrlsf.vim'
let g:ctrlsf_ackprg = 'ag'
let g:ctrlsf_position = 'bottom'
nmap <leader>ff <Plug>CtrlSFCwordPath


"for file search ctrlp, 文件搜索
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'rw'
map <leader><leader>p :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.?(git|hg|svn|rvm|venv|node_modules)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|jpg|png|log|swp|pyc)$',
    \ }
"let g:ctrlp_working_path_mode=2
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

"################### 显示增强 ###################"

"状态栏增强展示
"Plugin 'Lokaltog/vim-powerline'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
let g:airline#extensions#branch#enabled=1
"set rtp+=/usr/local/lib/python3.5/site-packages/powerline/bindings/vim

"for show no user whitespaces
Plugin 'bronson/vim-trailing-whitespace'
map <leader><space> :FixWhitespace<cr>

"easy motion
Plugin 'Lokaltog/vim-easymotion'
let g:EasyMotion_do_mapping = 0 " Disable default mappings"
let g:EasyMotion_smartcase = 1
map <Leader><Leader> <Plug>(easymotion-w)
map <Leader><Leader><Leader> <Plug>(easymotion-jumptoanywhere)
map  <Leader>f <Plug>(easymotion-bd-w)
nmap <Leader>f <Plug>(easymotion-overwin-w)

"git wrapper
Plugin 'tpope/vim-fugitive'


"vim multiple cursors
Plugin 'terryma/vim-multiple-cursors'

" 快速加入修改环绕字符
Plugin 'tpope/vim-surround'
"for repeat -> enhance surround.vim, . to repeat command

" 自动补全单引号，双引号等
Plugin 'Raimondi/delimitMate'
" for python docstring ",优化输入
au FileType python let b:delimitMate_nesting_quotes = ['"']

"################# 语法检查 ###############
Plugin 'scrooloose/syntastic'
let g:syntastic_python_checkers=['flake8']
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_vue_checkers=['eslint']
let g:syntastic_vue_eslint_args = "--no-eslintrc --config /Users/kobras/.vueeslintrc"
let g:syntastic_html_checkers = ["jshint"]
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

" let g:syntastic_error_symbol = '❌'
" let g:syntastic_style_error_symbol = '❌'
" let g:syntastic_warning_symbol = '⚠️'
" let g:syntastic_style_warning_symbol = '💩'
" highlight link SyntasticErrorSign SignColumn
" highlight link SyntasticWarningSign SignColumn
" highlight link SyntasticStyleErrorSign SignColumn
" highlight link SyntasticStyleWarningSign SignColumn

function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction

nnoremap <silent> <C-e> :<C-u>call ToggleErrors()<CR>
"################# 具体语言语法高亮 ###############

" for python.vim syntax highlight
Plugin 'hdima/python-syntax'
let python_highlight_all = 1

" for go-lang
Plugin 'fatih/vim-go'
autocmd FileType go setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

"for jade
Plugin 'digitaltoad/vim-pug'

"for javascript
Plugin 'pangloss/vim-javascript'
let g:javascript_enable_domhtmlcss = 1

" tern
Plugin 'ternjs/tern_for_vim'

"：for es6
Plugin 'isRuslan/vim-es6'

"for less
Plugin 'groenewege/vim-less'

"enhance javascript syntax
Plugin 'jelera/vim-javascript-syntax'

Plugin 'mxw/vim-jsx'
" jsx语法

Plugin 'wavded/vim-stylus'
" stylus 语法

"for vue
Plugin 'posva/vim-vue'
autocmd FileType vue setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd BufRead,BufNewFile *.we set filetype=vue
nnoremap <leader>css :set ft=css<cr>
nnoremap <leader>js :set ft=js<cr>
nnoremap <leader>html :set ft=html<cr>
nnoremap <leader>stylus :set ft=stylus<cr>
nnoremap <leader>vue :set ft=vue<cr>


" Plugin 'othree/javascript-libraries-syntax.vim'
" let g:used_javascript_libs = 'jquery,underscore,react'

"################### 其他 ###################"
" task list
Plugin 'vim-scripts/TaskList.vim'
map <leader>td <Plug>TaskList

" 配置 vim-livedown
Plugin 'shime/vim-livedown'
"
let g:livedown_autorun = 0

let g:livedown_open = 1

let g:livedown_port = 13377
nmap <leader>l :LivedownPreview<CR>
nmap <leader>lk :LivedownKill<CR>

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
"colorscheme slate
"colorscheme github
"colorscheme molokai
"colorscheme eva01
"colorscheme desert
"colorscheme codeschool
"colorscheme rainbow
"colorscheme solarized
"colorscheme gotham


"设置标记一列的背景颜色和数字一行颜色一致
" hi! link SignColumn   LineNr
" hi! link ShowMarksHLl DiffAdd
" hi! link ShowMarksHLu DiffChange
" hi Pmenu ctermfg=67 ctermbg=black
" hi PmenuSel ctermfg=yellow ctermbg=black

"" for error highlight，防止错误整行标红导致看不清
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

" json type
autocmd FileType json autocmd BufWritePre <buffer> %!python -m json.tool
