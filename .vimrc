set nocompatible "关闭 vi 兼容模式
filetype off                    " required!

" gundo插件，目前只有通过这种方式引入才可以使用
set rtp+=~/.vim/bundle/gundo/
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
"Plugins
"Plugin 'Valloric/YouCompleteMe'
Plugin 'Raimondi/delimitMate'  " 自动补全符号
Plugin 'scrooloose/nerdtree' " 目录结构树
Plugin 'ctrlpvim/ctrlp.vim'   " 模糊搜索
Plugin 'tacahiroy/ctrlp-funky' " 依赖于ctrlp,模糊搜索当前文件中所有函数
" 显示文件的Git增删状态,依赖于nerdtree
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/nerdcommenter'   " 注释: ;c<space> ;cs
Plugin 'pangloss/vim-javascript'          " Vastly improved Javascript indentation and syntax support in Vim.
Plugin 'Shougo/neocomplcache.vim'         " 自动补全
Plugin 'msanders/snipmate.vim'            " 代码补全插件，输入if或for等按tab键自动补全
Plugin 'itchyny/lightline.vim'     " 状态栏显示
Plugin 'nathanaelkane/vim-indent-guides' " 可视化缩进
Plugin 'fholgado/minibufexpl.vim'   " 多文档编辑，依赖于nerdtree
Plugin 'iamcco/mathjax-support-for-mkdp'
Plugin 'iamcco/markdown-preview.vim'   "markdown插件,可在浏览器预览
"Plugin 'sjl/gundo.vim'
call vundle#end()            " required
filetype plugin indent on    " required


" =======nerdtree 配置start==========
" Ctrl+N 打开/关闭
map <C-n> :NERDTreeToggle<CR>
" 当不带参数打开Vim时自动加载项目树
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 当所有文件关闭时关闭项目树窗格
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" 不显示这些文件
let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules'] "ignore files in NERDTree
" 不显示项目树上额外的信息，例如帮助、提示什么的
let NERDTreeMinimalUI=1
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" =======nerdtree 配置end============

" ==========nerdtree-git-plugin配置start =============
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
let g:NERDTreeShowIgnoredStatus = 1
" ===========nerdtree-git-plugin配置end ================

" =======ctrlp 配置start ===========
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {'dir':  '\v[\/]\.(git|hg|svn)$', 'file': '\v\.(exe|so|dll)$'}
" =======ctrlp 配置end ============

" =======ctrlpfunky配置start===========
nnoremap <F6> :CtrlPFunky<CR>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>)
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_extensions = ['funky']
" =======ctrlpfunky配置end=============


" =======neocomplcache 配置start=======
" Configuration: neocomplcache.vim
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" =====neocomplcache 配置end ===========


" ========= vim-javascript 配置start ===========
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
augroup javascript_folding
      au!
      au FileType javascript setlocal foldmethod=syntax
augroup END
" ========= vim-javascript 配置end =============


" =========gundo 配置start =================
" 调用 gundo 树
nnoremap <F5> :GundoToggle<CR>
" ========gundo 配置end ====================


" =====vim-indent-guides配置start==========
" 随 vim 自启动
" let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=1
" 色块宽度
let g:indent_guides_guide_size=1
" ======vim-indent-guides配置end============

" ======nerdcommenter 配置start ==========
" ********快速开关注释*****************
" <leader>ci或者<leader>c<space> 添加或者取消“//”注释
" <leader>cs添加多行注释 /** */
" *************************************
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" ======nerdcommenter 配置end ===========

" ======= minibufexpl 配置start ==========
" 在某个 buffer 上键入 s 将该 buffer 对应 window 与先前 window 上下排列，键入
" v 则左右排列（光标必须在 buffer 列表子窗口内）
" 显示/隐藏 MiniBufExplorer 窗口
map <Leader>bl :MBEToggle<cr>
" buffer 切换快捷键
map <C-Tab> :MBEbn<cr>
map <C-S-Tab> :MBEbp<cr>
" ======= minibufexpl 配置end =============



" ====== markdown-preview 配置start =========

let g:mkdp_path_to_chrome = ""
let g:mkdp_browserfunc = 'MKDP_browserfunc_default'
let g:mkdp_auto_start = 0
let g:mkdp_auto_open = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
nmap <silent> <F8> <Plug>MarkdownPreview        " for normal mode
imap <silent> <F8> <Plug>MarkdownPreview        " for insert mode
nmap <silent> <F9> <Plug>StopMarkdownPreview    " for normal mode
imap <silent> <F9> <Plug>StopMarkdownPreview    " for insert mode

" ====== markdown-preview 配置 end ==========



" ======配色方案start============
"开启语法高亮功能
syntax enable
syntax on "允许用指定语法高亮配色方案替换默认方案
set background=dark
"set background=light
"colorscheme solarized
" ======配色方案end ===========

" 分屏窗口移动, Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" 定义快捷键的前缀，即<Leader>
let mapleader=";"
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>qq :NERDTreeClose<CR>:wq<CR>
set number " 显示行号
set relativenumber " 显示相对行号
set cursorline " 突出显示当前行
set ruler " 打开状态栏标尺
set showmode  "左下角那一行的状态
set wrap  "自动折行
set shiftwidth=2 " 设定 << 和 >> 命令移动时的宽度为2 
set softtabstop=2 " 使得按退格键时可以一次删掉 2 个空格
set tabstop=2 " 设定 tab 长度为2 
set expandtab   "将tab替换为相应数量空格
set autochdir " 自动切换当前目录为当前文件所在的目录
set autoindent  "自动缩排
set ignorecase smartcase " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set nowrapscan " 禁止在搜索到文件两端时重新搜索
set incsearch "输入搜索内容时就显示搜索结果
set hlsearch "搜索时高亮显示被找到的文本
set showmatch " 插入括号时，短暂地跳转到匹配的对应括号
set matchtime=2 " 短暂跳转到匹配括号的时间
set magic " 设置魔术
set hidden " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set smartindent " 开启新行时使用智能自动缩进
set cmdheight=1 " 设定命令行的行数为 1
set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ " 设置在状态行显示的信息
set mouse=a "启用鼠标选项,a为所有模式启用鼠标
set helplang=cn "设置帮助为中文

":reg 查看是否包括×和+寄存器,若无需要安装vim-gnome:apt-get install vim-gnome
set clipboard=unnamedplus "在Vim中copy的所有内容都会上系统剪切板
"set clipboard=unnamed  mac中使用该配置

set pastetoggle=<F9> "拷贝模式
set wildmenu  " vim 自身命令行模式智能补全
" 设置 gvim 显示字体
set guifont=YaHei\ Consolas\ Hybrid\ 11.5
" 禁止折行
" set nowrap
" set backspace=2 "解决vim中delete无法删除的问题（主要是mac）

" 操作：za，打开或关闭当前折叠；zM，关闭所有折叠；zR，打开所有折叠
" 基于缩进或语法进行代码折叠
set foldmethod=indent
"set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable
" 设置新文件的编码为 UTF-8
set encoding=utf-8
" vimrc文件修改之后自动加载, linux
autocmd! bufwritepost .vimrc source %

" 重新打开一个文件时，仍然能够撤销之前的编辑
set undofile
" 撤销文件放在用户个人的特定目录下
set undodir=~/.vim/undodir
" 禁止备份文件
set nobackup
