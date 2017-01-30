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
autocmd FileType vim,ruby,javascript,yaml,htmldjango,html,xhtml,xml,css,stylus setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
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
nnoremap <F6> :call ToggleClipboard()<CR>

function! ToggleClipboard()
    if exists('t:savedInClipboard') && t:savedInClipboard
        set clipboard=
        let t:savedInClipboard = 0
    else
        set clipboard=unnamed
        let t:savedInClipboard = 1
    endif
endfunction


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

" ----------------------------------------------------------------------------
" 使用 vim-plug 管理插件
" vim plugin bundle control, command model
"
" "----------------------------------------------------------------------------

call plug#begin('~/.vim/bundle')

Plug 'junegunn/vim-plug'

Plug 'Valloric/YouCompleteMe'

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'scrooloose/nerdtree'

Plug 'scrooloose/nerdcommenter'

Plug 'fholgado/minibufexpl.vim'

Plug 'majutsushi/tagbar'

Plug 'Yggdroot/indentLine'

Plug 'mattn/emmet-vim'

Plug 'dyng/ctrlsf.vim'

Plug 'ctrlpvim/ctrlp.vim' | Plug 'tacahiroy/ctrlp-funky'

Plug 'szw/vim-ctrlspace'

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

Plug 'kien/rainbow_parentheses.vim'

Plug 'bronson/vim-trailing-whitespace'

Plug 'Lokaltog/vim-easymotion'

Plug 'terryma/vim-expand-region'

Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter'

Plug 'terryma/vim-multiple-cursors'

Plug 'tpope/vim-repeat' | Plug 'tpope/vim-surround'

Plug 'Raimondi/delimitMate'

Plug 'scrooloose/syntastic'

Plug 'hdima/python-syntax'

Plug 'fatih/vim-go'

Plug 'digitaltoad/vim-pug'

Plug 'pangloss/vim-javascript'

Plug 'ternjs/tern_for_vim'

Plug 'isRuslan/vim-es6'

Plug 'groenewege/vim-less'

Plug 'jelera/vim-javascript-syntax'

Plug 'mxw/vim-jsx'

Plug 'wavded/vim-stylus'

Plug 'posva/vim-vue'

Plug 'lilydjwg/colorizer'

" Plug 'othree/javascript-libraries-syntax.vim'

Plug 'vim-scripts/TaskList.vim'

Plug 'shime/vim-livedown'

" Plug 'ryanoasis/vim-devicons'

"################ 配置 ###################"
" YouCompleteMe {{{
        "imap <Tab> <C-P>
        " YCM 补全菜单配色
        " 菜单
        highlight Pmenu ctermfg=1 ctermbg=15 guifg=#005f87 guibg=#EEE8D5
        " 选中项
        highlight PmenuSel ctermfg=15 ctermbg=1 guifg=#AFD700 guibg=#106900

        let g:ycm_complete_in_comments=1  "补全功能在注释中同样有效
        let g:ycm_complete_in_strings=1   "在字符串输入中也能补全
        let g:ycm_use_ultisnips_completer = 1 "提示UltiSnips
        let g:ycm_collect_identifiers_from_tags_files=1 "补全内容不以分割子窗口形式出现，只显示补全列表
        let g:ycm_collect_identifiers_from_comments_and_strings=1   "注释和字符串中的文字也会被收入补全
        set completeopt-=preview
        let g:ycm_min_num_of_chars_for_completion=1 " 从第一个键入字符就开始罗列匹配项

        "" 语法关键字补全
        let g:ycm_seed_identifiers_with_syntax=1
        let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
        let g:ycm_key_list_previous_completion = ['<Up>']

        " 跳转到定义 "
        let g:ycm_goto_buffer_command = 'split'
        nnoremap <leader>jc :YcmCompleter GetDoc<CR>
        " nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
        nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
        let g:ycm_python_binary_path = '/usr/bin/python'


" }}}


" syntastic {{{
        " let g:syntastic_python_checkers=['flake8']
        let g:syntastic_python_checkers=['pyflakes', 'pep8']
        let g:syntastic_python_pep8_args="--ignore=E501,W601"
        let g:syntastic_javascript_checkers=['eslint']
        let g:syntastic_vue_checkers=['eslint']
        let g:syntastic_vue_eslint_args = "--no-eslintrc --config /Users/kobras/.vueeslintrc"
        let g:syntastic_html_checkers = ["tidy", "jshint"]
        let g:syntastic_always_populate_loc_list = 1

        let g:syntastic_auto_loc_list = 2
        let g:syntastic_check_on_open = 1
        let g:syntastic_check_on_wq = 0
        let g:syntastic_error_symbol='>>'
        let g:syntastic_warning_symbol='>'

        set statusline+=%#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%*


        function! ToggleErrors()
            let old_last_winnr = winnr('$')
            lclose
            if old_last_winnr == winnr('$')
                " Nothing was closed, open syntastic error location panel
                Errors
            endif
        endfunction

        nnoremap <Leader>e :call ToggleErrors()<CR>
        " ,en ,ep to jump between errors
        function! <SID>LocationPrevious()
        try
            lprev
        catch /^Vim\%((\a\+)\)\=:E553/
            llast
        endtry
        endfunction

        function! <SID>LocationNext()
        try
            lnext
        catch /^Vim\%((\a\+)\)\=:E553/
            lfirst
        endtry
        endfunction

        nnoremap <silent> <Plug>LocationPrevious    :<C-u>exe 'call <SID>LocationPrevious()'<CR>
        nnoremap <silent> <Plug>LocationNext        :<C-u>exe 'call <SID>LocationNext()'<CR>
        nmap <silent> <Leader>ep    <Plug>LocationPrevious
        nmap <silent> <Leader>en    <Plug>LocationNext
" }}}


" ultisnips {{{
        let g:UltiSnipsExpandTrigger = "<leader><tab>"
        let g:UltiSnipsJumpForwardTrigger = "<tab>"
            let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
        let g:UltiSnipsSnippetDirectories=["UltiSnips/snippets"]
        map <leader>us :UltiSnipsEdit<CR>
" }}}'



" vim-vue {{{
        autocmd FileType vue setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
        autocmd BufRead,BufNewFile *.we set filetype=vue
        nnoremap <leader>css :set ft=css<cr>
        nnoremap <leader>js :set ft=js<cr>
        nnoremap <leader>html :set ft=html<cr>
        nnoremap <leader>stylus :set ft=stylus<cr>
        nnoremap <leader>vue :set ft=vue<cr>
" }}}


" expandregion {{{
        " call expand_region#custom_text_objects('python', {
        "       \ 'af' :1,
        "       \ 'if' :1,
        "       \ 'ac' :1,
        "       \ 'ic' :1,
        "       \ })
        "vmap v <Plug>(expand_region_expand)
        "vmap V <Plug>(expand_region_shrink)
" }}}



" vim-livedown {{{
        let g:livedown_autorun = 0
        let g:livedown_open = 1
        let g:livedown_port = 13377
        nmap <leader>l :LivedownPreview<CR>
        nmap <leader>lk :LivedownKill<CR>
" }}}


" TaskList {{{
        map <leader>tl <Plug>TaskList
" }}}


" js syntax {{{
        let g:javascript_enable_domhtmlcss = 1
" }}}


" vimgo {{{
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1

    let g:go_fmt_fail_silently = 1
    autocmd FileType go setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
    " let g:go_fmt_command = "goimports"
    " let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
" }}}


" python-syntax {{{
        let python_highlight_all = 1
" }}}


" delimitMate {{{
    " for python docstring ",优化输入
    au FileType python let b:delimitMate_nesting_quotes = ['"']
" }}}

" airline {{{
    let g:airline_theme='violet'
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    let g:airline_left_sep = '▶'
    let g:airline_left_alt_sep = '❯'
    let g:airline_right_sep = '◀'
    let g:airline_right_alt_sep = '❮'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.branch = '⎇'
    function! AirlineInit()
      let g:airline_section_a = airline#section#create(['(づ｡◕‿‿◕｡)づ', ' ', 'mode'])
      let g:airline_section_x = airline#section#create(['tagbar'])
      let g:airline_section_y = airline#section#create([''])
    endfunction
    autocmd User AirlineAfterInit call AirlineInit()
" }}}


" ctrlsf {{{
        let g:ctrlsf_ackprg = 'ag'
        let g:ctrlsf_position = 'bottom'
        nmap <leader>ff <Plug>CtrlSFCwordPath
        let g:ctrlsf_auto_close = 1
        let g:ctrlsf_confirm_save = 0
" }}}


" easy-motion {{{
        let g:EasyMotion_do_mapping = 0 " Disable default mappings"
        let g:EasyMotion_smartcase = 1
        map <Leader><Leader> <Plug>(easymotion-w)
        map <Leader><Leader><Leader> <Plug>(easymotion-jumptoanywhere)
        map <Leader>f <Plug>(easymotion-bd-w)
        nmap <Leader>f <Plug>(easymotion-overwin-w)
        map <Leader><leader>h <Plug>(easymotion-linebackward)
        map <Leader><Leader>j <Plug>(easymotion-j)
        map <Leader><Leader>k <Plug>(easymotion-k)
        map <Leader><leader>l <Plug>(easymotion-lineforward)
        " 重复上一次操作, 类似repeat插件, 很强大
        map <Leader><leader>. <Plug>(easymotion-repeat)
" }}}


" ctrlp ctrlpfunky {{{
        let g:ctrlp_map = '<leader>p'
        let g:ctrlp_cmd = 'CtrlP'
        let g:ctrlp_working_path_mode = 'rw'
        map <leader><leader>p :CtrlPMRU<CR>
        let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/]\.?(git|hg|svn|rvm|venv|node_modules|builds)$',
        \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|jpg|png|log|swp|pyc)$',
        \ }
        "let g:ctrlp_working_path_mode=2
        let g:ctrlp_match_window_bottom=1
        let g:ctrlp_max_height=15
        let g:ctrlp_match_window_reversed=0
        let g:ctrlp_mruf_max=500
        let g:ctrlp_follow_symlinks=1

        " ctrlpfunky
        " ctrlp插件1 - 不用ctag进行函数快速跳转
        nnoremap <Leader>fu :CtrlPFunky<Cr>
        " narrow the list down with a word under cursor
        nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
        let g:ctrlp_funky_syntax_highlight = 1

        let g:ctrlp_extensions = ['funky']
" }}}


" trailling whitespace {{{
        map <leader><space> :FixWhitespace<cr>
" }}}


" emmet {{{
        "let g:user_emmet_leader_key='<Leader>'
        let g:user_emmet_install_global = 0
        autocmd FileType htmldjango,html,css EmmetInstall
" }}}


" tagbar {{{
        nmap <F9> :TagbarToggle<CR>
        let g:tagbar_autofocus = 1
        let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
        let g:tagbar_show_linenumbers = 1
        let g:tagbar_vertical = 1
" }}}


" minibufexpl {{{
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
        nnoremap <TAB> :MBEbn<CR>
        noremap <TAB>[ :MBEbp<CR>
        noremap <TAB>] :MBEbn<CR>
        noremap <Leader><C-w> :MBEbd<CR>
        map <space> :b<Space>
" }}}


" nerdtree {{{
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
        let NERDTreeHijackNetrw = 1 " 当输入 filename]不再显示netrw,而是显示 nerdtree"
        "close vim if the only window left open is a NERDTree
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end
" }}}


" indentLine {{{
        let g:indentLine_char = '┆'
" }}}


" rainbow_parentheses {{{
    " 不加入这行, 防止黑色括号出现, 很难识别
    " \ ['black',       'SeaGreen3'],
    let g:rbpt_colorpairs = [
        \ ['Darkblue',    'SeaGreen3'],
        \ ['darkgreen',   'firebrick3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['Darkblue',    'firebrick3'],
        \ ['darkgreen',   'RoyalBlue3'],
        \ ]

    let g:rbpt_max = 16
    let g:rbpt_loadcmd_toggle = 0
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
" }}}

" nerdcommenter {{{
    let g:NERDSpaceDelims=1
    let g:NERDAltDelims_python = 1
    autocmd VimEnter * noremap <leader>cc  :call NERDComment(0,"toggle")<CR>
" }}}


" fugitive {{{
    " :Gdiff  :Gstatus :Gvsplit
    nnoremap <leader>ge :Gdiff<CR>
    " not ready to open
    " <leader>gb maps to :Gblame<CR>
    " <leader>gs maps to :Gstatus<CR>
    " <leader>gd maps to :Gdiff<CR>  和现有冲突
    " <leader>gl maps to :Glog<CR>
    " <leader>gc maps to :Gcommit<CR>
    " <leader>gp maps to :Git push<CR>
" }}}

" gitgutter {{{
    " 同git diff,实时展示文件中修改的行
    " 只是不喜欢除了行号多一列, 默认关闭,gs时打开
    let g:gitgutter_map_keys = 0
    let g:gitgutter_enabled = 0
    let g:gitgutter_highlight_lines = 1
    nnoremap <leader>gs :GitGutterToggle<CR>
" }}

" ctrlspace {{{
    let g:airline_exclude_preview = 1
    hi CtrlSpaceSelected guifg=#586e75 guibg=#eee8d5 guisp=#839496 gui=reverse,bold ctermfg=10 ctermbg=7 cterm=reverse,bold
    hi CtrlSpaceNormal   guifg=#839496 guibg=#021B25 guisp=#839496 gui=NONE ctermfg=12 ctermbg=0 cterm=NONE
    hi CtrlSpaceSearch   guifg=#cb4b16 guibg=NONE gui=bold ctermfg=9 ctermbg=NONE term=bold cterm=bold
    hi CtrlSpaceStatus   guifg=#839496 guibg=#002b36 gui=reverse term=reverse cterm=reverse ctermfg=12 ctermbg=8
" }}}

call plug#end()

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
colorscheme space-vim-dark
set termguicolors


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
